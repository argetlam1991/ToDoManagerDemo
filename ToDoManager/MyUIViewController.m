//
//  MyUIViewController.m
//  ToDoManager
//
//  Created by Gu Han on 6/3/17.
//  Copyright © 2017 Gu Han. All rights reserved.
//

#import "MyUIViewController.h"
#import <CoreData/CoreData.h>
#import "ToDoEntity+CoreDataClass.h"

@interface MyUIViewController ()

@property (strong, nonatomic) NSPersistentContainer *persistentContainer;
@property (strong, nonatomic) ToDoEntity *localToDoEntity;
@property (strong, nonatomic) IBOutlet UITextField *titleField;
@property (strong, nonatomic) IBOutlet UITextView *detailsField;
@property (strong, nonatomic) IBOutlet UIDatePicker *dueDateField;
@property (nonatomic) BOOL wasDeleted;

@end

@implementation MyUIViewController

- (void)viewWillAppear:(BOOL)animated {
  
  self.wasDeleted = NO;
  
  self.titleField.text = self.localToDoEntity.toDoTitle;
  self.detailsField.text = self.localToDoEntity.toDoDetails;
  NSDate *dueDate = self.localToDoEntity.toDoDueDate;
  if (dueDate != nil) {
    [self.dueDateField setDate:dueDate];
  }
  [[NSNotificationCenter defaultCenter]
   addObserver:self selector:@selector(textViewDidEndEditing:) name:UITextViewTextDidEndEditingNotification object:self];
}


- (void) textViewDidEndEditing: (NSNotification *) notification {
  if ([notification object] == self) {
    self.localToDoEntity.toDoDetails = self.detailsField.text;
    [self saveMyToDoEntitiy];
  }
}

- (void) viewWillDisappear:(BOOL)animated {
  
  if (self.wasDeleted == NO) {
    self.localToDoEntity.toDoTitle = self.titleField.text;
    self.localToDoEntity.toDoDetails = self.detailsField.text;
    self.localToDoEntity.toDoDueDate = self.dueDateField.date;
    [self saveMyToDoEntitiy];
  }
  [[NSNotificationCenter defaultCenter]
   removeObserver:self
   name:UITextViewTextDidEndEditingNotification object:self];
  
}

- (IBAction)trashTapped:(UIBarButtonItem *)sender {
  self.wasDeleted = YES;
  [self.persistentContainer.viewContext deleteObject:self.localToDoEntity];
  [self saveMyToDoEntitiy];
  [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)titleFieldEdited:(UITextField *)sender {
  self.localToDoEntity.toDoTitle = self.titleField.text;
  [self saveMyToDoEntitiy];
}
- (IBAction)dueDateEdited:(UIDatePicker *)sender {
  self.localToDoEntity.toDoDueDate = self.dueDateField.date;
  [self saveMyToDoEntitiy];
}

- (void) saveMyToDoEntitiy {
  NSError *err;
  BOOL saveSuccess = [self.persistentContainer.viewContext save:&err];
  if (!saveSuccess) {
    @throw [NSException exceptionWithName:NSGenericException reason:@"Couldn't save" userInfo:@{NSUnderlyingErrorKey:err}];
  }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void) receivePC:(NSPersistentContainer *)incomingPC {
  self.persistentContainer = incomingPC;
}

- (void) reveiceToDoEntity:(ToDoEntity *)incomingToDoEntity {
  self.localToDoEntity = incomingToDoEntity;
}

@end

