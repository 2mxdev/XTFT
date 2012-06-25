//
//  XTETField.m
//  EditableCellsTest
//
//  Created by Mikhail Bushuev on 6/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "XTFTField.h"

@implementation XTFTField

@synthesize fieldType = _fieldType;
@synthesize tag = _tag;

+ (id)field {
    return [[[[self class] alloc] init] autorelease];
}

@end
