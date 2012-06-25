//
//  XTFTInputCell.m
//  EditableCellsTest
//
//  Created by Mikhail Bushuev on 6/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "XTFTInputCell.h"
#import "XTFTInputField.h"

@implementation XTFTInputCell

@synthesize field = _field;
@synthesize height = _height;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 12, 135, 20)];
        _nameLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:12];
        _nameLabel.backgroundColor = [UIColor clearColor];
        
        _errorLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 32, 280, 20)];
        _errorLabel.font = [UIFont fontWithName:@"Helvetica" size:12];
        _errorLabel.backgroundColor = [UIColor clearColor];
        _errorLabel.textColor = [UIColor redColor];
        
        [self addSubview:_nameLabel];
        [self addSubview:_errorLabel];
    }
    return self;
}

- (void)dealloc {
    [_field release];
    [_nameLabel release];
    [_errorLabel release];
    
    [super dealloc];
}

#pragma mark - Public
#pragma mark - Properties

- (void)setField:(XTFTInputField *)field {
    [field retain];
    [_field release];
    _field = field;
    
    _nameLabel.text = field.name;
    _errorLabel.text = field.validationErrorMessage;
    
    if (field.validationErrorMessage != nil) {
        _nameLabel.textColor = [UIColor redColor];
        _errorLabel.hidden = NO;
    } else {
        _nameLabel.textColor = [UIColor blackColor];
        _errorLabel.hidden = YES;
    }
}

- (CGFloat)height {
    if (_field.validationErrorMessage != nil) {
        _height = 64;
    } else {
        _height = 44;
    }
    return _height;
}

#pragma mark - Factory

+ (id)cellWithIdentifier:(NSString *)cellIdentifier {
    return [[[[self class] alloc] initWithStyle:UITableViewCellStyleDefault
                                reuseIdentifier:cellIdentifier] autorelease];
}

+ (id)cell {
    return [[[[self class] alloc] initWithStyle:UITableViewCellStyleDefault
                                reuseIdentifier:[[self class] description]] autorelease];
}

@end
