//
//  SampleController.h
//  XTFTSampleCode
//
//  Created by Mikhail Bushuev on 6/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XTFT.h"

@interface SampleController : NSObject <XTFTTavleViewControllerDelegate> {
@protected
    UINavigationController *_navigationController;
    XTFTTableViewController *_controller;
}

- (id)initWithNavigationController:(UINavigationController *)navigationController;

- (void)start;
- (void)stop;

+ (void)startWithNavigationController:(UINavigationController *)navigationController;

@end
