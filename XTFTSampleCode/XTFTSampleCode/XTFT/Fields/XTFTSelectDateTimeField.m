//
//  XTFTSelectDateTimeField.m
//  XTFTSampleCode
//
//  Created by Mikhail Bushuev on 6/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "XTFTSelectDateTimeField.h"

@implementation XTFTSelectDateTimeField

@synthesize minimumDate = _minimumDate;
@synthesize maximumDate = _maximumDate;
@synthesize interval = _interval;
@synthesize mode = _mode;
@synthesize format = _format;

- (id)init {
    self = [super init];
    if (self) {
        _interval = 1;
        _mode = XTFTSelectDateTimeFieldModeDate;
        
        self.format = @"dd.MM.yy hh:mm";
        self.value = [NSDate date];
    }
    return self;
}

- (void)dealloc {
    [_minimumDate release];
    [_maximumDate release];
    
    [super dealloc];
}

#pragma mark - Public
#pragma mark - Properties

- (NSString *)valueAsString {
    if (self.value) {
        NSDateFormatter *df = [[[NSDateFormatter alloc] init] autorelease];
        [df setDateFormat:_format];
        return [df stringFromDate:self.valueAsDate];
    }
    return self.name;
}

@end
