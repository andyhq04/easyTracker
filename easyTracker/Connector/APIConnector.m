//
//  APIConnector.m
//  myTracker
//
//  Created by Andrea Herbas on 1/22/14.
//
//

#import "APIConnector.h"
#import "MappingProvider.h"
#import "CoreData+MagicalRecord.h"

#import "Project.h"
#import "Story.h"
#import "User.h"

// Use a class extension to expose access to MagicalRecord's private setter methods
@interface NSManagedObjectContext ()
+ (void)MR_setRootSavingContext:(NSManagedObjectContext *)context;
+ (void)MR_setDefaultContext:(NSManagedObjectContext *)moc;
@end

@implementation APIConnector

+ (APIConnector*)sharedInstance
{
    static APIConnector *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[APIConnector alloc] init];
        [_sharedInstance setupConnector];
        [_sharedInstance setupMapping];
        [_sharedInstance setupRoutes];
    });
    return _sharedInstance;
}

- (void)setupConnector
{
    NSError *error = nil;
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"Model" withExtension:@"momd"];
    NSManagedObjectModel *managedObjectModel = [[[NSManagedObjectModel alloc] initWithContentsOfURL:url] mutableCopy];
    RKManagedObjectStore *managedObjectStore = [[RKManagedObjectStore alloc] initWithManagedObjectModel:managedObjectModel];
    
    [managedObjectStore createPersistentStoreCoordinator];
    
    NSDictionary* options = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithBool:YES], NSMigratePersistentStoresAutomaticallyOption, [NSNumber numberWithBool:YES], NSInferMappingModelAutomaticallyOption, nil];//NSMigratePersistentStoresAutomaticallyOption: @(YES), NSInferMappingModelAutomaticallyOption: @(YES)};
    NSString *storePath = [RKApplicationDataDirectory() stringByAppendingPathComponent:@"local.sqlite"];

    NSPersistentStore *persistentStore = [managedObjectStore addSQLitePersistentStoreAtPath:storePath fromSeedDatabaseAtPath:nil withConfiguration:nil options:options error:&error];
    if (!persistentStore) {
        RKLogError(@"'%@' %@", storePath, error);
    }
    
    [managedObjectStore createManagedObjectContexts];
    
    // Set the default store shared instance
    [RKManagedObjectStore setDefaultStore:managedObjectStore];

    // Configure MagicalRecord to use RestKit's Core Data stack
    [NSPersistentStoreCoordinator MR_setDefaultStoreCoordinator:managedObjectStore.persistentStoreCoordinator];
    [NSManagedObjectContext MR_setRootSavingContext:managedObjectStore.persistentStoreManagedObjectContext];
    [NSManagedObjectContext MR_setDefaultContext:managedObjectStore.mainQueueManagedObjectContext];
    
    // Configure the object manager
    RKObjectManager *objectManager = [RKObjectManager managerWithBaseURL:[NSURL URLWithString:@"http://localhost:3000/"]];
 
    objectManager.managedObjectStore = managedObjectStore;
    
    [RKObjectManager setSharedManager:objectManager];
    self.managedObjectStore = managedObjectStore;
    
    //TODO review why we need to include text/json as header
    [[RKObjectManager sharedManager].HTTPClient setDefaultHeader:@"Accept" value:RKMIMETypeJSON];
    [[RKObjectManager sharedManager].HTTPClient setDefaultHeader:@"Content-Type" value:RKMIMETypeJSON];
    [RKMIMETypeSerialization registerClass:[RKNSJSONSerialization class] forMIMEType:@"text/json"];
    [RKMIMETypeSerialization registerClass:[RKNSJSONSerialization class] forMIMEType:@"application/json"];
    [[RKObjectManager sharedManager] setRequestSerializationMIMEType:RKMIMETypeJSON];
}

- (void)setupRoutes
{
    
    [[RKObjectManager sharedManager].router.routeSet addRoute:[RKRoute routeWithName:@"projects_index" pathPattern:@"api/projects" method:RKRequestMethodGET]];
    [[RKObjectManager sharedManager].router.routeSet addRoute:[RKRoute routeWithName:@"stories_index" pathPattern:@"api/projects/:projectId/stories" method:RKRequestMethodGET]];
}

- (void)setupMapping
{
    [MappingProvider sharedInstance].managedObjectStore = self.managedObjectStore;
    [[MappingProvider sharedInstance] setProjectMappings];
    [[MappingProvider sharedInstance] setStoryMappings];
    [[MappingProvider sharedInstance] setUserMappings];
}

- (void)loadProjects:(void (^)(RKObjectRequestOperation *operation, RKMappingResult *mappingResult))success
             failure:(void (^)(RKObjectRequestOperation *operation, NSError *error))failure
{
    [[RKObjectManager sharedManager] getObjectsAtPathForRouteNamed:@"projects_index" object:nil parameters:nil success:success failure:failure];
}

- (void)loadStoriesByProject:(Project*) project
                     success:(void (^)(RKObjectRequestOperation *operation, RKMappingResult *mappingResult))success
                     failure:(void (^)(RKObjectRequestOperation *operation, NSError *error))failure
{
    id object = nil;
    if (project != nil)
    {
        object = @{@"projectId": project.id};
    }
    
    [[RKObjectManager sharedManager] getObjectsAtPathForRouteNamed:@"stories_index" object:object parameters:nil success:success failure:failure];
}

- (void)login:(NSString*) username
     password:(NSString*) password
      success:(void (^)(RKObjectRequestOperation *operation, RKMappingResult *mappingResult))success
      failure:(void (^)(RKObjectRequestOperation *operation, NSError *error))failure

{
    [[RKObjectManager sharedManager].HTTPClient setDefaultHeader:@"Content-Type" value:RKMIMETypeJSON];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"User" inManagedObjectContext:APIConnector.sharedInstance.managedObjectStore.mainQueueManagedObjectContext];
    User *user = [[User alloc] initWithEntity:entity insertIntoManagedObjectContext:APIConnector.sharedInstance.managedObjectStore.mainQueueManagedObjectContext];
    
    [user setUser:username];
    [user setPassword:password];
    NSLog(@"USER%@", user);
    [[RKObjectManager sharedManager] postObject:user path:@"api/login" parameters:nil success:success failure:failure];
}

- (void)signup:(NSString*) username
      password:(NSString*) password
       success:(void (^)(RKObjectRequestOperation *operation, RKMappingResult *mappingResult))success
       failure:(void (^)(RKObjectRequestOperation *operation, NSError *error))failure
{
    [[RKObjectManager sharedManager].HTTPClient setDefaultHeader:@"Content-Type" value:RKMIMETypeJSON];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"User" inManagedObjectContext:APIConnector.sharedInstance.managedObjectStore.mainQueueManagedObjectContext];
    User *user = [[User alloc] initWithEntity:entity insertIntoManagedObjectContext:APIConnector.sharedInstance.managedObjectStore.mainQueueManagedObjectContext];
    
    [user setUsername:username];
    [user setPassword:password];


    [[RKObjectManager sharedManager] postObject:user path:@"api/users" parameters:nil success:success failure:failure];
}

@end
