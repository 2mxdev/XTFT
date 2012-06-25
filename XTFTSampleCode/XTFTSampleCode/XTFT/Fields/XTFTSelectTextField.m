//
//  XTFTSelectTextField.m
//  EditableCellsTest
//
//  Created by Mikhail Bushuev on 6/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "XTFTSelectTextField.h"

@implementation XTFTSelectTextField

@synthesize values = _values;
@synthesize selectedIndex = _selectedIndex;

- (id)init {
    self = [super init];
    if (self) {
        _selectedIndex = -1;
    }
    return self;
}

- (void)dealloc {
    [_values release];
    
    [super dealloc];
}

#pragma mark - Public
#pragma mark - Properties

- (NSObject *)value {
    if (_selectedIndex != -1)
        return [_values objectAtIndex:_selectedIndex];
    return self.name;
}

@end
