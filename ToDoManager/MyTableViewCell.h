//
//  MyTableViewCell.h
//  ToDoManager
//
//  Created by Gu Han on 6/3/17.
//  Copyright © 2017 Gu Han. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DPHandlesPC.h"
#import "ToDoEntity+CoreDataClass.h"

@interface MyTableViewCell : UITableViewCell <DPHandlesPC>

@property (strong, nonatomic) IBOutlet UILabel *toDoTitleLabel;
@property (strong, nonatomic) IBOutlet UILabel *toDoDueDateLabel;
@property (strong, nonatomic) ToDoEntity *localToDoEntity;

- (void) setInternalFields:(ToDoEntity *)incomingToDoEntity;

- (void) receivePC: (NSPersistentContainer *)incomingPC;



@end
