// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Story.m instead.

#import "_Story.h"

const struct StoryAttributes StoryAttributes = {
	.acceptedAt = @"acceptedAt",
	.createdAt = @"createdAt",
	.deadline = @"deadline",
	.desc = @"desc",
	.id = @"id",
	.iteration = @"iteration",
	.iterationEnd = @"iterationEnd",
	.iterationStart = @"iterationStart",
	.ownedBy = @"ownedBy",
	.points = @"points",
	.project_id = @"project_id",
	.requestedBy = @"requestedBy",
	.status = @"status",
	.title = @"title",
	.type = @"type",
	.updatedAt = @"updatedAt",
	.url = @"url",
};

const struct StoryRelationships StoryRelationships = {
	.project = @"project",
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
	
	if ([key isEqualToString:@"iterationValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"iteration"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"pointsValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"points"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic acceptedAt;






@dynamic createdAt;






@dynamic deadline;






@dynamic desc;






@dynamic id;






@dynamic iteration;



- (int16_t)iterationValue {
	NSNumber *result = [self iteration];
	return [result shortValue];
}

- (void)setIterationValue:(int16_t)value_ {
	[self setIteration:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveIterationValue {
	NSNumber *result = [self primitiveIteration];
	return [result shortValue];
}

- (void)setPrimitiveIterationValue:(int16_t)value_ {
	[self setPrimitiveIteration:[NSNumber numberWithShort:value_]];
}





@dynamic iterationEnd;






@dynamic iterationStart;






@dynamic ownedBy;






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






@dynamic requestedBy;






@dynamic status;






@dynamic title;






@dynamic type;






@dynamic updatedAt;






@dynamic url;






@dynamic project;

	






@end
