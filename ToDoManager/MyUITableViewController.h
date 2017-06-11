//
//  MyUITableViewController.h
//  ToDoManager
//
//  Created by Gu Han on 6/3/17.
//  Copyright © 2017 Gu Han. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DPHandlesPC.h"
#import "DPHandlesToDoEntity.h"

@interface MyUITableViewController : UITableViewController <DPHandlesPC>
- (void) receivePC: (NSPersistentContainer *)incomingPC;

@end
