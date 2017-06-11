//
//  DPHandlesMOC.h
//  ToDoManager
//
//  Created by Gu Han on 6/3/17.
//  Copyright © 2017 Gu Han. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@protocol DPHandlesPC <NSObject>

- (void) receivePC: (NSPersistentContainer *)incomingPC;

@end
