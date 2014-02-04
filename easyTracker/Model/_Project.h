// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Project.h instead.

#import <CoreData/CoreData.h>
#import "RemoteObject.h"

extern const struct ProjectAttributes {
	__unsafe_unretained NSString *desc;
	__unsafe_unretained NSString *length;
	__unsafe_unretained NSString *name;
	__unsafe_unretained NSString *startDate;
	__unsafe_unretained NSString *velocity;
} ProjectAttributes;

extern const struct ProjectRelationships {
} ProjectRelationships;

extern const struct ProjectFetchedProperties {
} ProjectFetchedProperties;








@interface ProjectID : NSManagedObjectID {}
@end

@interface _Project : RemoteObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (ProjectID*)objectID;





@property (nonatomic, strong) NSString* desc;



//- (BOOL)validateDesc:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* length;



@property int16_t lengthValue;
- (int16_t)lengthValue;
- (void)setLengthValue:(int16_t)value_;

//- (BOOL)validateLength:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* name;



//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* startDate;



//- (BOOL)validateStartDate:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* velocity;



@property int16_t velocityValue;
- (int16_t)velocityValue;
- (void)setVelocityValue:(int16_t)value_;

//- (BOOL)validateVelocity:(id*)value_ error:(NSError**)error_;






@end

@interface _Project (CoreDataGeneratedAccessors)

@end

@interface _Project (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveDesc;
- (void)setPrimitiveDesc:(NSString*)value;




- (NSNumber*)primitiveLength;
- (void)setPrimitiveLength:(NSNumber*)value;

- (int16_t)primitiveLengthValue;
- (void)setPrimitiveLengthValue:(int16_t)value_;




- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;




- (NSDate*)primitiveStartDate;
- (void)setPrimitiveStartDate:(NSDate*)value;




- (NSNumber*)primitiveVelocity;
- (void)setPrimitiveVelocity:(NSNumber*)value;

- (int16_t)primitiveVelocityValue;
- (void)setPrimitiveVelocityValue:(int16_t)value_;




@end
