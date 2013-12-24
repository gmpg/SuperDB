//
//  HeroDetailController.m
//  SuperDB
//
//  Created by caoyu on 13-12-22.
//  Copyright (c) 2013年 caoyu. All rights reserved.
//

#import "HeroDetailController.h"

@interface HeroDetailController ()
@property(strong,nonatomic) NSArray* sections;
@property(strong,nonatomic) UIBarButtonItem *saveButton;
@property(strong,nonatomic) UIBarButtonItem *backButton;
@property(strong,nonatomic) UIBarButtonItem *cancelButton;
-(void)save;
-(void)cancel;
@end

@implementation HeroDetailController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
     self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.saveButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(save)];
    self.backButton = self.navigationItem.leftBarButtonItem;
    self.cancelButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancel)];
    
    NSURL *plistURL = [[NSBundle mainBundle] URLForResource:@"HeroDetailConfiguration" withExtension:@"plist"];
    NSDictionary *plist = [NSDictionary dictionaryWithContentsOfURL:plistURL];
    self.sections = [plist valueForKey:@"sections"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
/*
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 0;
}
 */

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSUInteger sectionIndex = [indexPath section];
    NSUInteger rowIndex =[indexPath row];
    NSDictionary *section = [self.sections objectAtIndex:sectionIndex];
    NSArray * rows = [section objectForKey:@"rows"];
    NSDictionary *row = [rows objectAtIndex:rowIndex];

    NSString* cellClassname = [row valueForKey:@"class"];
    
    SuperDBEditCell *cell = [tableView dequeueReusableCellWithIdentifier:cellClassname];
    
    if (cell==nil) {
        Class cellClass = NSClassFromString(cellClassname);
        cell = [cellClass alloc];
        cell = [cell initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:cellClassname ];
    }

    
    cell.label.text = [row objectForKey:@"label"];
    cell.key = [row objectForKey:@"key"];
    cell.textField.text = [self.hero valueForKey:[row objectForKey:@"key"]] ;
    NSArray *values = [row valueForKey:@"values"];
    if (values!=nil) {
        [cell performSelector:@selector(setValues:) withObject:values];
    }
    return cell;
}

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;//UITableViewCellEditingStyleNone;
}

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

-(void)setEditing:(BOOL)editing animated:(BOOL)animated{
    [super setEditing:editing animated:animated];
    self.navigationItem.rightBarButtonItem = (editing)?self.saveButton:self.editButtonItem;
    self.navigationItem.leftBarButtonItem = (editing)?self.cancelButton:self.backButton;
}

-(void)save{
    for (SuperDBEditCell *cell in[self.tableView visibleCells]) {
        [self.hero setValue:[cell value] forKey:[cell key]];
    }
    NSError *error;
    if (![self.hero.managedObjectContext save:&error]) {
        NSLog(@"Error saving %@",[error localizedDescription]);
    }
    [self.tableView reloadData];
}
-(void)cancel{
    [self setEditing:NO animated:YES];
}
@end
