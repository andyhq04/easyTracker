//
//  MappingProvider.m
//  myTracker
//
//  Created by Andrea Herbas on 1/19/14.
//
//

#import "MappingProvider.h"
#import "User.h"

@implementation MappingProvider

+ (MappingProvider*)sharedInstance
{
    static MappingProvider *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[MappingProvider alloc] init];
    });
    return _sharedInstance;
}

- (id)initWithManagedObjectStore:(RKManagedObjectStore *) managedObjectStore
{
    self = [super init];
    if (self) {
        self.managedObjectStore = managedObjectStore;
    }
    
    return self;
}

- (void)setProjectMappings
{
    RKEntityMapping *entityMapping = [RKEntityMapping mappingForEntityForName:@"Project" inManagedObjectStore:self.managedObjectStore];
    [entityMapping addAttributeMappingsFromDictionary:@{
        @"_id": @"id",
        @"name": @"name",
        @"owner": @"owner",
        @"description": @"desc",
        @"length": @"length",
        @"velocity": @"velocity",
        @"startDate": @"startDate",
        @"currentIteration": @"currentIteration",
        @"createdAt": @"createdAt",
        @"updatedAt": @"updatedAt"}];
    entityMapping.identificationAttributes = @[@"id"];
    
    RKResponseDescriptor *projectResponseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:entityMapping method:RKRequestMethodGET pathPattern:@"api/projects" keyPath:nil statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];

    [[RKObjectManager sharedManager] addResponseDescriptor:projectResponseDescriptor];
}

- (void)setStoryMappings
{
    RKEntityMapping *entityMapping = [RKEntityMapping mappingForEntityForName:@"Story" inManagedObjectStore:self.managedObjectStore];
    [entityMapping addAttributeMappingsFromDictionary:@{
        @"_id": @"id",
        @"title": @"title",
        @"description": @"desc",
        @"iteration": @"iteration",
        @"iterationStart": @"iterationStart",
        @"iterationEnd": @"iterationEnd",
        @"acceptedAt": @"acceptedAt",
        @"deadline": @"deadline",
        @"requestedBy": @"requestedBy",
        @"url": @"url",
        @"ownedBy": @"ownedBy",
        @"type": @"type",
        @"status": @"status",
        @"points": @"points",
        @"project_id": @"project_id",
        @"createdAt": @"createdAt",
        @"updatedAt": @"updatedAt"}];
    
    //[entityMapping addAttributeMappingsFromDictionary:@{ @"project_id": @"project_id" }];
    [entityMapping addConnectionForRelationship:@"project" connectedBy:@{@"project_id": @"id"}];
    
    entityMapping.identificationAttributes = @[@"id"];
    
    RKResponseDescriptor *responseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:entityMapping method:RKRequestMethodGET pathPattern:@"api/projects/:projectId/stories" keyPath:nil statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
    
    [[RKObjectManager sharedManager] addResponseDescriptor:responseDescriptor];
}

- (void)setUserMappings
{
    // Setup your mapping dict
    NSMutableDictionary *dict = @{
        @"_id": @"id",
        @"user": @"user",
        @"username": @"username",
        @"password": @"password",
        @"loginToken": @"loginToken",
        @"userId": @"userId",
        @"createdAt": @"createdAt"
    };
    
    NSMutableDictionary *dict1 = @{
        @"user": @"user",
        @"username": @"username",
        @"password": @"password",
        @"loginToken": @"loginToken",
        @"userId": @"userId",
        @"createdAt": @"createdAt"
    };
    
  /*  RKEntityMapping *userResponseMapping = [RKEntityMapping mappingForEntityForName:@"User" inManagedObjectStore:self.managedObjectStore];
    [userResponseMapping addAttributeMappingsFromDictionary:dict];
    userResponseMapping.identificationAttributes = @[@"id"];
    
    RKEntityMapping *userRequestMapping = [RKEntityMapping mappingForEntityForName:@"User" inManagedObjectStore:self.managedObjectStore];
    [userRequestMapping addAttributeMappingsFromDictionary:dict1];
    userRequestMapping.identificationAttributes = @[@"id"];*/
    
    /*//[entityMapping addAttributeMappingsFromDictionary:@{ @"project_id": @"project_id" }];
    [entityMapping addConnectionForRelationship:@"project" connectedBy:@{@"project_id": @"id"}];
    
    entityMapping.identificationAttributes = @[@"id"];
    
    //[entityMapping addAttributeMappingsFromDictionary:@{ @"project_id": @"project_id" }];
    [entityMapping addConnectionForRelationship:@"project" connectedBy:@{@"project_id": @"id"}];
    
    entityMapping.identificationAttributes = @[@"id"];

    */// Apply dict to an response mapper
    RKObjectMapping* userResponseMapping = [RKObjectMapping requestMapping];
    [userResponseMapping addAttributeMappingsFromDictionary:dict];
    
    // Apply dict to a request mapper
    RKObjectMapping* userRequestMapping = [RKObjectMapping requestMapping];
    [userRequestMapping addAttributeMappingsFromDictionary:dict1];
    
    // Create the response descriptor
    RKResponseDescriptor *responseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:userResponseMapping method:RKRequestMethodPOST pathPattern:@"api/users" keyPath:nil statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
    
    RKResponseDescriptor *responseDescriptor2 = [RKResponseDescriptor responseDescriptorWithMapping:userResponseMapping method:RKRequestMethodPOST pathPattern:@"api/login" keyPath:nil statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];

    // Create the request descriptor
    RKRequestDescriptor *requestDescriptor = [RKRequestDescriptor requestDescriptorWithMapping:userRequestMapping objectClass:[User class] rootKeyPath:nil method:RKRequestMethodPOST];
    
    [[RKObjectManager sharedManager] addRequestDescriptor:requestDescriptor];
    [[RKObjectManager sharedManager] addResponseDescriptor:responseDescriptor];
    [[RKObjectManager sharedManager] addResponseDescriptor:responseDescriptor2];
}

@end
