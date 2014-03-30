// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Project.h instead.

#import <CoreData/CoreData.h>


extern const struct ProjectAttributes {
	__unsafe_unretained NSString *createdAt;
	__unsafe_unretained NSString *currentIteration;
	__unsafe_unretained NSString *desc;
	__unsafe_unretained NSString *id;
	__unsafe_unretained NSString *length;
	__unsafe_unretained NSString *name;
	__unsafe_unretained NSString *owner;
	__unsafe_unretained NSString *startDate;
	__unsafe_unretained NSString *updatedAt;
	__unsafe_unretained NSString *velocity;
} ProjectAttributes;

extern const struct ProjectRelationships {
	__unsafe_unretained NSString *stories;
} ProjectRelationships;

extern const struct ProjectFetchedProperties {
} ProjectFetchedProperties;

@class Story;












@interface ProjectID : NSManagedObjectID {}
@end

@interface _Project : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (ProjectID*)objectID;





@property (nonatomic, strong) NSDate* createdAt;



//- (BOOL)validateCreatedAt:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* currentIteration;



@property int16_t currentIterationValue;
- (int16_t)currentIterationValue;
- (void)setCurrentIterationValue:(int16_t)value_;

//- (BOOL)validateCurrentIteration:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* desc;



//- (BOOL)validateDesc:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* id;



//- (BOOL)validateId:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* length;



@property int16_t lengthValue;
- (int16_t)lengthValue;
- (void)setLengthValue:(int16_t)value_;

//- (BOOL)validateLength:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* name;



//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* owner;



//- (BOOL)validateOwner:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* startDate;



//- (BOOL)validateStartDate:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* updatedAt;



//- (BOOL)validateUpdatedAt:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* velocity;



@property int16_t velocityValue;
- (int16_t)velocityValue;
- (void)setVelocityValue:(int16_t)value_;

//- (BOOL)validateVelocity:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSSet *stories;

- (NSMutableSet*)storiesSet;





@end

@interface _Project (CoreDataGeneratedAccessors)

- (void)addStories:(NSSet*)value_;
- (void)removeStories:(NSSet*)value_;
- (void)addStoriesObject:(Story*)value_;
- (void)removeStoriesObject:(Story*)value_;

@end

@interface _Project (CoreDataGeneratedPrimitiveAccessors)


- (NSDate*)primitiveCreatedAt;
- (void)setPrimitiveCreatedAt:(NSDate*)value;




- (NSNumber*)primitiveCurrentIteration;
- (void)setPrimitiveCurrentIteration:(NSNumber*)value;

- (int16_t)primitiveCurrentIterationValue;
- (void)setPrimitiveCurrentIterationValue:(int16_t)value_;




- (NSString*)primitiveDesc;
- (void)setPrimitiveDesc:(NSString*)value;




- (NSString*)primitiveId;
- (void)setPrimitiveId:(NSString*)value;




- (NSNumber*)primitiveLength;
- (void)setPrimitiveLength:(NSNumber*)value;

- (int16_t)primitiveLengthValue;
- (void)setPrimitiveLengthValue:(int16_t)value_;




- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;




- (NSString*)primitiveOwner;
- (void)setPrimitiveOwner:(NSString*)value;




- (NSDate*)primitiveStartDate;
- (void)setPrimitiveStartDate:(NSDate*)value;




- (NSDate*)primitiveUpdatedAt;
- (void)setPrimitiveUpdatedAt:(NSDate*)value;




- (NSNumber*)primitiveVelocity;
- (void)setPrimitiveVelocity:(NSNumber*)value;

- (int16_t)primitiveVelocityValue;
- (void)setPrimitiveVelocityValue:(int16_t)value_;





- (NSMutableSet*)primitiveStories;
- (void)setPrimitiveStories:(NSMutableSet*)value;


@end
