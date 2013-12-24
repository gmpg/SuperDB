//
//  SuperDBDateCell.m
//  SuperDB
//
//  Created by  gmpg on 13-12-23.
//  Copyright (c) 2013年 caoyu. All rights reserved.
//

#import "SuperDBDateCell.h"

static NSDateFormatter *__dateFormatter = nil;

@interface SuperDBDateCell ()
@property(strong,nonatomic)UIDatePicker *datePicker;
-(IBAction)datePickerChanged:(id)sender;
@end

@implementation SuperDBDateCell

+(void)initialize{
    __dateFormatter = [[NSDateFormatter alloc]init];
    [__dateFormatter setDateStyle:NSDateFormatterMediumStyle];

}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.textField.clearButtonMode = UITextFieldViewModeNever;
        self.datePicker = [[UIDatePicker alloc]initWithFrame:CGRectZero];
        self.datePicker.datePickerMode = UIDatePickerModeDate;
        [self.datePicker addTarget:self action:@selector(datePickerChanged:) forControlEvents:UIControlEventValueChanged];
        self.textField.inputView = _datePicker;
    }
    return self;
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
#pragma mark - SuperDBEditCell Overrides
-(id)value{
    if (self.textField.text==nil||[self.textField.text length]==0) {
        return nil;
    }
    return self.datePicker.date;
}

-(void)setValue:(id)value{
    if (value!=nil && [value isKindOfClass:[NSDate class]]) {
        [self.datePicker setDate:value];
        self.textField.text = [__dateFormatter stringFromDate:value];
    }else{
        self.textField.text=nil;
    }
}

#pragma mark - (Private) Instant Methods

-(IBAction)datePickerChanged:(id)sender{
    NSDate *date = [self.datePicker date];
    self.value=date;
    self.textField.text = [__dateFormatter stringFromDate:date];
}
@end
