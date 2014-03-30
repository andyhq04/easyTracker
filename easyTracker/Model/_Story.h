// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Story.h instead.

#import <CoreData/CoreData.h>


extern const struct StoryAttributes {
	__unsafe_unretained NSString *acceptedAt;
	__unsafe_unretained NSString *createdAt;
	__unsafe_unretained NSString *deadline;
	__unsafe_unretained NSString *desc;
	__unsafe_unretained NSString *id;
	__unsafe_unretained NSString *iteration;
	__unsafe_unretained NSString *iterationEnd;
	__unsafe_unretained NSString *iterationStart;
	__unsafe_unretained NSString *ownedBy;
	__unsafe_unretained NSString *points;
	__unsafe_unretained NSString *project_id;
	__unsafe_unretained NSString *requestedBy;
	__unsafe_unretained NSString *status;
	__unsafe_unretained NSString *title;
	__unsafe_unretained NSString *type;
	__unsafe_unretained NSString *updatedAt;
	__unsafe_unretained NSString *url;
} StoryAttributes;

extern const struct StoryRelationships {
	__unsafe_unretained NSString *project;
} StoryRelationships;

extern const struct StoryFetchedProperties {
} StoryFetchedProperties;

@class Project;



















@interface StoryID : NSManagedObjectID {}
@end

@interface _Story : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (StoryID*)objectID;





@property (nonatomic, strong) NSDate* acceptedAt;



//- (BOOL)validateAcceptedAt:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* createdAt;



//- (BOOL)validateCreatedAt:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* deadline;



//- (BOOL)validateDeadline:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* desc;



//- (BOOL)validateDesc:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* id;



//- (BOOL)validateId:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* iteration;



@property int16_t iterationValue;
- (int16_t)iterationValue;
- (void)setIterationValue:(int16_t)value_;

//- (BOOL)validateIteration:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* iterationEnd;



//- (BOOL)validateIterationEnd:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* iterationStart;



//- (BOOL)validateIterationStart:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* ownedBy;



//- (BOOL)validateOwnedBy:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* points;



@property int16_t pointsValue;
- (int16_t)pointsValue;
- (void)setPointsValue:(int16_t)value_;

//- (BOOL)validatePoints:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* project_id;



//- (BOOL)validateProject_id:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* requestedBy;



//- (BOOL)validateRequestedBy:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* status;



//- (BOOL)validateStatus:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* title;



//- (BOOL)validateTitle:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* type;



//- (BOOL)validateType:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* updatedAt;



//- (BOOL)validateUpdatedAt:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* url;



//- (BOOL)validateUrl:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) Project *project;

//- (BOOL)validateProject:(id*)value_ error:(NSError**)error_;





@end

@interface _Story (CoreDataGeneratedAccessors)

@end

@interface _Story (CoreDataGeneratedPrimitiveAccessors)


- (NSDate*)primitiveAcceptedAt;
- (void)setPrimitiveAcceptedAt:(NSDate*)value;




- (NSDate*)primitiveCreatedAt;
- (void)setPrimitiveCreatedAt:(NSDate*)value;




- (NSString*)primitiveDeadline;
- (void)setPrimitiveDeadline:(NSString*)value;




- (NSString*)primitiveDesc;
- (void)setPrimitiveDesc:(NSString*)value;




- (NSString*)primitiveId;
- (void)setPrimitiveId:(NSString*)value;




- (NSNumber*)primitiveIteration;
- (void)setPrimitiveIteration:(NSNumber*)value;

- (int16_t)primitiveIterationValue;
- (void)setPrimitiveIterationValue:(int16_t)value_;




- (NSDate*)primitiveIterationEnd;
- (void)setPrimitiveIterationEnd:(NSDate*)value;




- (NSDate*)primitiveIterationStart;
- (void)setPrimitiveIterationStart:(NSDate*)value;




- (NSString*)primitiveOwnedBy;
- (void)setPrimitiveOwnedBy:(NSString*)value;




- (NSNumber*)primitivePoints;
- (void)setPrimitivePoints:(NSNumber*)value;

- (int16_t)primitivePointsValue;
- (void)setPrimitivePointsValue:(int16_t)value_;




- (NSString*)primitiveProject_id;
- (void)setPrimitiveProject_id:(NSString*)value;




- (NSString*)primitiveRequestedBy;
- (void)setPrimitiveRequestedBy:(NSString*)value;




- (NSString*)primitiveStatus;
- (void)setPrimitiveStatus:(NSString*)value;




- (NSString*)primitiveTitle;
- (void)setPrimitiveTitle:(NSString*)value;




- (NSString*)primitiveType;
- (void)setPrimitiveType:(NSString*)value;




- (NSDate*)primitiveUpdatedAt;
- (void)setPrimitiveUpdatedAt:(NSDate*)value;




- (NSString*)primitiveUrl;
- (void)setPrimitiveUrl:(NSString*)value;





- (Project*)primitiveProject;
- (void)setPrimitiveProject:(Project*)value;


@end
