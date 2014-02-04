//
//  MappingProvider.h
//  myTracker
//
//  Created by Andrea Herbas on 1/19/14.
//
//

#import <Foundation/Foundation.h>
#import <RestKit/RestKit.h>

@interface MappingProvider : NSObject

+ (MappingProvider*)sharedInstance;

@property (strong, nonatomic) RKManagedObjectStore *managedObjectStore;

- (id)initWithManagedObjectStore:(RKManagedObjectStore *) managedObjectStore;
- (void)setProjectMappings;
- (void)setStoryMappings;
- (void)setUserMappings;

@end
