//
//  HeroDetailController.h
//  SuperDB
//
//  Created by caoyu on 13-12-22.
//  Copyright (c) 2013年 caoyu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SuperDBEditCell.h"
@interface HeroDetailController : UITableViewController
@property(strong,nonatomic) NSManagedObject *hero;
@end
