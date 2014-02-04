// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Story.h instead.

#import <CoreData/CoreData.h>
#import "RemoteObject.h"

extern const struct StoryAttributes {
	__unsafe_unretained NSString *desc;
	__unsafe_unretained NSString *points;
	__unsafe_unretained NSString *project_id;
	__unsafe_unretained NSString *status;
	__unsafe_unretained NSString *title;
	__unsafe_unretained NSString *type;
} StoryAttributes;

extern const struct StoryRelationships {
} StoryRelationships;

extern const struct StoryFetchedProperties {
} StoryFetchedProperties;









@interface StoryID : NSManagedObjectID {}
@end

@interface _Story : RemoteObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (StoryID*)objectID;





@property (nonatomic, strong) NSString* desc;



//- (BOOL)validateDesc:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* points;



@property int16_t pointsValue;
- (int16_t)pointsValue;
- (void)setPointsValue:(int16_t)value_;

//- (BOOL)validatePoints:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* project_id;



//- (BOOL)validateProject_id:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* status;



//- (BOOL)validateStatus:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* title;



//- (BOOL)validateTitle:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* type;



//- (BOOL)validateType:(id*)value_ error:(NSError**)error_;






@end

@interface _Story (CoreDataGeneratedAccessors)

@end

@interface _Story (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveDesc;
- (void)setPrimitiveDesc:(NSString*)value;




- (NSNumber*)primitivePoints;
- (void)setPrimitivePoints:(NSNumber*)value;

- (int16_t)primitivePointsValue;
- (void)setPrimitivePointsValue:(int16_t)value_;




- (NSString*)primitiveProject_id;
- (void)setPrimitiveProject_id:(NSString*)value;




- (NSString*)primitiveStatus;
- (void)setPrimitiveStatus:(NSString*)value;




- (NSString*)primitiveTitle;
- (void)setPrimitiveTitle:(NSString*)value;




- (NSString*)primitiveType;
- (void)setPrimitiveType:(NSString*)value;




@end
