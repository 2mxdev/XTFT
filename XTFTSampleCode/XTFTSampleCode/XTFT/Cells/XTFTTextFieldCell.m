//
//  XTFTTextFieldCell.m
//  EditableCellsTest
//
//  Created by Mikhail Bushuev on 6/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "XTFTTextFieldCell.h"
#import "XTFTTextField.h"
#import "UIView+XTFTAdditions.h"

@interface XTFTTextFieldCell() <UITextFieldDelegate>

- (void)textDidChanged:(UITextField *)textField;
- (void)commitFieldType;
- (void)nameLabelClick:(id)sender;

@end

@implementation XTFTTextFieldCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UITapGestureRecognizer *t = [[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(nameLabelClick:)] autorelease];
        _nameLabel.userInteractionEnabled = YES;
        [_nameLabel addGestureRecognizer:t];
        
        _textField = [[UITextField alloc] initWithFrame:CGRectMake(165, 12, 135, 20)];
        _textField.font = [UIFont fontWithName:@"Helvetica" size:14];
        _textField.backgroundColor = [UIColor clearColor];
        _textField.delegate = self;
        [_textField addTarget:self
                       action:@selector(textDidChanged:)
             forControlEvents:UIControlEventEditingChanged];
        
        [self addSubview:_textField];
    }
    return self;
}

- (void)dealloc {
    [_textField release];
    
    [super dealloc];
}

#pragma mark - Public
#pragma mark - Properties

- (void)setField:(XTFTInputField *)field {
    [super setField:field];
    
    XTFTTextField *f = (XTFTTextField *)field;
    
    _textField.placeholder = f.placeholder;
    _textField.text = f.valueAsString;
    
    [self commitFieldType];
}

#pragma mark - Private
#pragma mark - UITextField delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [_textField resignFirstResponder];
    return YES;
}

#pragma mark - User iteractions

- (void)textDidChanged:(UITextField *)textField {
    self.field.value = textField.text;
}

- (void)nameLabelClick:(id)sender {
    [self.superview hideKeybordFromView];
}

#pragma mark - Helpers

- (void)commitFieldType {
    switch (self.field.fieldType) {
        case XTFTFieldTypeText:
            _textField.secureTextEntry = NO;
            _textField.keyboardType = UIKeyboardTypeDefault;
            break;
        case XTFTFieldTypeEmail:
            _textField.secureTextEntry = NO;
            _textField.keyboardType = UIKeyboardTypeEmailAddress;
            break;
        case XTFTFieldTypePassword:
            _textField.secureTextEntry = YES;
            _textField.keyboardType = UIKeyboardTypeDefault;
            break;
        case XTFTFieldTypePhoneNumber:
            _textField.secureTextEntry = NO;
            _textField.keyboardType = UIKeyboardTypePhonePad;
            break;
        case XTFTFieldTypeNumber:
            _textField.secureTextEntry = NO;
            _textField.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
            break;
        case XTFTFieldTypeURL:
            _textField.secureTextEntry = NO;
            _textField.keyboardType = UIKeyboardTypeURL;
            break;
        default:
            break;
    }
}

@end
