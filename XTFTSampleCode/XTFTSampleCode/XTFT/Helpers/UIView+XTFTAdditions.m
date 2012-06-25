//
//  UIView+XTFTAdditions.m
//  EditableCellsTest
//
//  Created by Mikhail Bushuev on 6/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "UIView+XTFTAdditions.h"

@implementation UIView(XTFTAdditions)

- (void)hideKeybordFromView {
    NSMutableArray *views = [NSMutableArray arrayWithObject:self];
    
    while (views.count > 0) {
        UIView *v = [views objectAtIndex:0];
        
        if (v.isFirstResponder) {
            [v resignFirstResponder];
            return;
        }
        
        [views removeObjectAtIndex:0];
        [views addObjectsFromArray:v.subviews];
    }
}

@end
