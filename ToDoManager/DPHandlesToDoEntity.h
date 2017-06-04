//
//  DPHandlesToDoEntity.h
//  ToDoManager
//
//  Created by Gu Han on 6/3/17.
//  Copyright © 2017 Gu Han. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DPHandlesToDoEntity <NSObject>

- (void) reveiceToDoEntity:(ToDoEntity *) incomingToDoEntity;

@end
