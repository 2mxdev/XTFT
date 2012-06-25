//
//  ViewController.m
//  XTFTSampleCode
//
//  Created by Mikhail Bushuev on 6/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

#import "SampleFieldTypes.h"
#import "SampleSteps.h"
#import "SampleRegForm.h"
#import "SampleValidation.h"
#import "SampleCommit.h"
#import "SampleCancelButton.h"
#import "SampleReference.h"
#import "SampleAsyncValidation.h"

@interface ViewController ()

@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.navigationItem.title = @"XTFT Samples";
    }
    return self;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    return UIInterfaceOrientationIsPortrait(toInterfaceOrientation);
}

- (IBAction)showFieldTypes:(id)sender {
    [SampleFieldTypes startWithNavigationController:self.navigationController];
}

- (IBAction)showSteps:(id)sender {
    [SampleSteps startWithNavigationController:self.navigationController];
}

- (IBAction)showRegForm:(id)sender {
    [SampleRegForm startWithNavigationController:self.navigationController];
}

- (IBAction)showValidation:(id)sender {
    [SampleValidation startWithNavigationController:self.navigationController];
}

- (IBAction)showCommit:(id)sender {
    [SampleCommit startWithNavigationController:self.navigationController];
}

- (IBAction)showCancel:(id)sender {
    [SampleCancelButton startWithNavigationController:self.navigationController];
}

- (IBAction)showReferences:(id)sender {
    [SampleReference startWithNavigationController:self.navigationController];
}

- (IBAction)showAsyncValidation:(id)sender {
    [SampleAsyncValidation startWithNavigationController:self.navigationController];
}

@end
