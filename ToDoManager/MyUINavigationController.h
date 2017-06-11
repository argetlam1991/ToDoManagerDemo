//
//  MyUINavigationController.h
//  ToDoManager
//
//  Created by Gu Han on 6/3/17.
//  Copyright © 2017 Gu Han. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DPHandlesPC.h"

@interface MyUINavigationController : UINavigationController <DPHandlesPC>

- (void) receivePC:(NSPersistentContainer *)incomingPC;

@end
