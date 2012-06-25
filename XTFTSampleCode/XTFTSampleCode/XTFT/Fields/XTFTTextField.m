//
//  XTFTTextField.m
//  EditableCellsTest
//
//  Created by Mikhail Bushuev on 6/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "XTFTTextField.h"

@implementation XTFTTextField

@synthesize placeholder = _placeholder;

- (void)dealloc {
    [_placeholder release];
    
    [super dealloc];
}

@end
