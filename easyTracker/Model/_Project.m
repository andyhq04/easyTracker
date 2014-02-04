// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Project.m instead.

#import "_Project.h"

const struct ProjectAttributes ProjectAttributes = {
	.desc = @"desc",
	.length = @"length",
	.name = @"name",
	.startDate = @"startDate",
	.velocity = @"velocity",
};

const struct ProjectRelationships ProjectRelationships = {
};

const struct ProjectFetchedProperties ProjectFetchedProperties = {
};

@implementation ProjectID
@end

@implementation _Project

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Project" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Project";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Project" inManagedObjectContext:moc_];
}

- (ProjectID*)objectID {
	return (ProjectID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"lengthValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"length"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"velocityValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"velocity"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic desc;






@dynamic length;



- (int16_t)lengthValue {
	NSNumber *result = [self length];
	return [result shortValue];
}

- (void)setLengthValue:(int16_t)value_ {
	[self setLength:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveLengthValue {
	NSNumber *result = [self primitiveLength];
	return [result shortValue];
}

- (void)setPrimitiveLengthValue:(int16_t)value_ {
	[self setPrimitiveLength:[NSNumber numberWithShort:value_]];
}





@dynamic name;






@dynamic startDate;






@dynamic velocity;



- (int16_t)velocityValue {
	NSNumber *result = [self velocity];
	return [result shortValue];
}

- (void)setVelocityValue:(int16_t)value_ {
	[self setVelocity:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveVelocityValue {
	NSNumber *result = [self primitiveVelocity];
	return [result shortValue];
}

- (void)setPrimitiveVelocityValue:(int16_t)value_ {
	[self setPrimitiveVelocity:[NSNumber numberWithShort:value_]];
}










@end
