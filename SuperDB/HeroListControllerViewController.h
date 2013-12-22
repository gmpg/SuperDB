//
//  HeroListControllerViewController.h
//  SuperDB
//
//  Created by caoyu on 13-12-20.
//  Copyright (c) 2013年 caoyu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HeroDetailController.h"
#define kSelectedTabDefaultsKey @"Selected Tab"

enum{
    kByName,
    kBySecretIdentity,
};

@interface HeroListControllerViewController : UIViewController<UITableViewDataSource,UITabBarDelegate,UITabBarDelegate,NSFetchedResultsControllerDelegate,UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *heroTableView;
@property (weak, nonatomic) IBOutlet UITabBar *heroTabBar;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *addButton;
- (IBAction)addHero:(id)sender;

@end
