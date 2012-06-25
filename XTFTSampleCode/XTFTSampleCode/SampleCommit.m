//
//  SampleCommit.m
//  XTFTSampleCode
//
//  Created by Mikhail Bushuev on 6/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SampleCommit.h"

@interface User1 : NSObject

@property (nonatomic, retain) NSString *firstName;
@property (nonatomic, retain) NSString *lastName;

@end

@implementation User1

@synthesize firstName, lastName;

- (void)dealloc {
    [firstName release];
    [lastName release];
    
    [super dealloc];
}

- (NSString *)description {
    return [NSString stringWithFormat:@"first name = %@, last name = %@", firstName, lastName];
}

@end

@interface User2 : User1

- (void)setFirstNameFromField:(XTFTInputField *)field;
- (void)setLastNameFromField:(XTFTInputField *)field;

@end

@implementation User2

- (void)setFirstNameFromField:(XTFTInputField *)field {
    self.firstName = field.valueAsString;
}

- (void)setLastNameFromField:(XTFTInputField *)field {
    self.lastName = field.valueAsString;
}

@end

@implementation SampleCommit

- (id)initWithNavigationController:(UINavigationController *)navigationController {
    self = [super initWithNavigationController:navigationController];
    if (self) {
        _user1 = [[User1 alloc] init];
        _user2 = [[User2 alloc] init];
    }
    return self;
}

- (void)dealloc {
    [_user1 release];
    [_user2 release];
    
    [super dealloc];
}

- (void)start {
    XTFTStep *step = [XTFTStep step];
    XTFTFieldSection *section = nil;
    XTFTInputField *f = nil;
    
    step.title = @"Commit sample";
    step.desc = @"Result in debug console";
    
    section = [XTFTFieldSection section];
    section.title = @"User1 class - commit value";
    
    f = [XTFTFieldFactory textFieldWithName:@"First name" andPlaceholder:@"type here"];
    f.commitValueSelector = @selector(setFirstName:);
    f.commitValueTarget = _user1;
    f.validateSelector = @selector(validateNotEmpty:);
    f.validateTarget = [XTFTFieldValidator class];
    [section addField:f];
    
    f = [XTFTFieldFactory textFieldWithName:@"Last name" andPlaceholder:@"type here"];
    f.commitValueSelector = @selector(setLastName:);
    f.commitValueTarget = _user1;
    f.validateSelector = @selector(validateNotEmpty:);
    f.validateTarget = [XTFTFieldValidator class];
    [section addField:f];
    
    [step addSection:section];
    
    section = [XTFTFieldSection section];
    section.title = @"User2 class - commit field";
    
    f = [XTFTFieldFactory textFieldWithName:@"First name" andPlaceholder:@"type here"];
    f.commitFieldSelector = @selector(setFirstNameFromField:);
    f.commitFieldTarget = _user2;
    f.validateSelector = @selector(validateNotEmpty:);
    f.validateTarget = [XTFTFieldValidator class];
    [section addField:f];
    
    f = [XTFTFieldFactory textFieldWithName:@"Last name" andPlaceholder:@"type here"];
    f.commitFieldSelector = @selector(setLastNameFromField:);
    f.commitFieldTarget = _user2;
    f.validateSelector = @selector(validateNotEmpty:);
    f.validateTarget = [XTFTFieldValidator class];
    [section addField:f];
    
    [step addSection:section];
    
    _controller.steps = [NSArray arrayWithObject:step];
    
    [super start];
}

- (void)stop {
    NSLog(@"USER1 CLASS: %@", _user1);
    NSLog(@"USER2 CLASS: %@", _user2);
    
    [super stop];
}

@end
