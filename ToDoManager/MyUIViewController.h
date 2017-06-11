//
//  MyUIViewController.h
//  ToDoManager
//
//  Created by Gu Han on 6/3/17.
//  Copyright © 2017 Gu Han. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DPHandlesPC.h"
#import "DPHandlesToDoEntity.h"
#import "ToDoEntity+CoreDataClass.h"



@interface MyUIViewController : UIViewController <DPHandlesPC, DPHandlesToDoEntity>
- (void) receivePC: (NSPersistentContainer *)incomingPC;
- (void) reveiceToDoEntity:(ToDoEntity *)incomingToDoEntity;
@end
