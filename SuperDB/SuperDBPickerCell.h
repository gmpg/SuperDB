//
//  SuperDBPickerCell.h
//  SuperDB
//
//  Created by  gmpg on 13-12-24.
//  Copyright (c) 2013年 caoyu. All rights reserved.
//

#import "SuperDBEditCell.h"

@interface SuperDBPickerCell : SuperDBEditCell<UIPickerViewDataSource,UIPickerViewDelegate>
@property(strong,nonatomic) NSArray *values;

@end
