// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Story.m instead.

#import "_Story.h"

const struct StoryAttributes StoryAttributes = {
	.desc = @"desc",
	.points = @"points",
	.project_id = @"project_id",
	.status = @"status",
	.title = @"title",
	.type = @"type",
};

const struct StoryRelationships StoryRelationships = {
};

const struct StoryFetchedProperties StoryFetchedProperties = {
};

@implementation StoryID
@end

@implementation _Story

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Story" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Story";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Story" inManagedObjectContext:moc_];
}

- (StoryID*)objectID {
	return (StoryID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"pointsValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"points"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic desc;






@dynamic points;



- (int16_t)pointsValue {
	NSNumber *result = [self points];
	return [result shortValue];
}

- (void)setPointsValue:(int16_t)value_ {
	[self setPoints:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitivePointsValue {
	NSNumber *result = [self primitivePoints];
	return [result shortValue];
}

- (void)setPrimitivePointsValue:(int16_t)value_ {
	[self setPrimitivePoints:[NSNumber numberWithShort:value_]];
}





@dynamic project_id;






@dynamic status;






@dynamic title;






@dynamic type;











@end
