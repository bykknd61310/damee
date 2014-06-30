//
//  RootTableViewController.m
//  FontStyle
//
//  Created by luowenqi on 14-5-13.
//  Copyright (c) 2014年 Emar. All rights reserved.
//

#import "RootTableViewController.h"

@interface RootTableViewController ()

@end

@implementation RootTableViewController

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
    isEnglish = YES;
    mFontNamesArray = [NSMutableArray arrayWithArray:[UIFont familyNames]];
    mTitleArray = [NSMutableArray arrayWithArray:[UIFont familyNames]];
    NSLog(@"Titles = %@",mTitleArray);
//    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//    button.frame = CGRectMake(0, 0, 320, 44);
//    [button addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
//    self.tableView.tableHeaderView = button;
}
- (void) btnAction
{
    if (isEnglish == YES) {
        isEnglish = NO;
        for (int i = 0; i< mTitleArray.count; i++) {
            NSString *title = @"罗文奇damee";
            [mTitleArray replaceObjectAtIndex:i withObject:title];
        }
    }else
    {
        isEnglish = YES;
        mTitleArray = [NSMutableArray arrayWithArray:[UIFont familyNames]];
    }
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return mFontNamesArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell==nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
//    cell.textLabel.text = [mTitleArray objectAtIndex:indexPath.row];
    cell.textLabel.text = @"罗文奇damee";
//    cell.textLabel.text = @"damee";
//    cell.textLabel.font = [UIFont fontWithName:[mFontNamesArray objectAtIndex:indexPath.row] size:30.0f];
    cell.textLabel.font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:30.0f];
//    [cell addSubview:[labelsArray objectAtIndex:indexPath.row]];

    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
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

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
