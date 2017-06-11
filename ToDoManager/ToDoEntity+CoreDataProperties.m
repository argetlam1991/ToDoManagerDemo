//
//  ToDoEntity+CoreDataProperties.m
//  ToDoManager
//
//  Created by Gu Han on 6/3/17.
//  Copyright © 2017 Gu Han. All rights reserved.
//

#import "ToDoEntity+CoreDataProperties.h"

@implementation ToDoEntity (CoreDataProperties)

+ (NSFetchRequest<ToDoEntity *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"ToDoEntity"];
}

@dynamic toDoTitle;
@dynamic toDoDetails;
@dynamic toDoDueDate;

@end
