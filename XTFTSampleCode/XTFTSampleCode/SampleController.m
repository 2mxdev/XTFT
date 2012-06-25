//
//  SampleController.m
//  XTFTSampleCode
//
//  Created by Mikhail Bushuev on 6/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SampleController.h"

@implementation SampleController

- (id)initWithNavigationController:(UINavigationController *)navigationController {
    self = [super init];
    if (self) {
        _navigationController = [navigationController retain];
        
        _controller = [[XTFTTableViewController alloc] initWithStyle:UITableViewStyleGrouped];
        _controller.delegate = self;
    }
    return self;
}

- (void)dealloc {
    [_navigationController release];
    [_controller release];
    
    [super dealloc];
}

#pragma mark - Public
#pragma mark - Methods

- (void)start {
    [_navigationController pushViewController:_controller animated:YES];
    [self retain];
}

- (void)stop {
    [_navigationController popToRootViewControllerAnimated:YES];
    [self autorelease];
}

#pragma mark - XTFTTableViewController delegate

- (void)xtftControllerDone {
    [self stop];
}

- (void)xtftControllerCancel {
    [self stop];
}

#pragma mark - Class methods

+ (void)startWithNavigationController:(UINavigationController *)navigationController {
    SampleController *controller = [[[[self class] alloc] initWithNavigationController:navigationController] autorelease];
    [controller start];
}

@end
