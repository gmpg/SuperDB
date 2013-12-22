//
//  SuperDBEditCell.h
//  SuperDB
//
//  Created by caoyu on 13-12-22.
//  Copyright (c) 2013年 caoyu. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kLabelTextColor [UIColor colorWithRed:0.321569f green:0.4f blue:0.568627f alpha:1.0f]

@interface SuperDBEditCell : UITableViewCell
@property (strong,nonatomic) UILabel *label;
@property (strong,nonatomic) UITextField *textField;
@property (strong,nonatomic) NSString *key;
@property (strong,nonatomic) id value;
@end
