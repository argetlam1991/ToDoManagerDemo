//
//  MyTableViewCell.m
//  ToDoManager
//
//  Created by Gu Han on 6/3/17.
//  Copyright © 2017 Gu Han. All rights reserved.
//

#import "MyTableViewCell.h"

@interface MyTableViewCell ()
@property (strong, nonatomic) NSPersistentContainer *persistentContainer;

@end

@implementation MyTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) setInternalFields:(ToDoEntity *)incomingToDoEntity {
  NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
  [dateFormatter setDateStyle:NSDateFormatterShortStyle];
  [dateFormatter setTimeStyle:NSDateFormatterShortStyle];
  
  self.localToDoEntity = incomingToDoEntity;
  self.toDoTitleLabel.text = self.localToDoEntity.toDoTitle;
  self.toDoDueDateLabel.text = [dateFormatter stringFromDate:self.localToDoEntity.toDoDueDate];
  
}

- (void) receivePC:(NSPersistentContainer *)incomingPC {
  self.persistentContainer = incomingPC;
}

@end
