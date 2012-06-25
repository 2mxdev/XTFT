//
//  XTFTSelectValueCell.m
//  XTFTSampleCode
//
//  Created by Mikhail Bushuev on 6/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "XTFTSelectValueCell.h"
#import "XTFTInputField.h"

@implementation XTFTSelectValueCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _nameLabel.frame = CGRectMake(10, 12, 300, 20);
        _nameLabel.textAlignment = UITextAlignmentCenter;
        
        _triangleView = [[UIImageView alloc] initWithFrame:CGRectMake(280, 12, 20, 20)];
        _triangleView.image = [UIImage imageNamed:@"xtft-triangle.png"];
        
        [self addSubview:_triangleView];
    }
    return self;
}

- (void)dealloc {
    [_triangleView release];
    
    [super dealloc];
}

#pragma mark - Public
#pragma mark - Properties

- (void)setField:(XTFTInputField *)field {
    [super setField:field];
    
    _nameLabel.text = field.valueAsString;
}

@end
