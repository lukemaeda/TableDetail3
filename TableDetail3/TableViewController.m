//
//  TableViewController.m
//  TableDetail
//
//  Created by MAEDA HAJIME on 2014/04/08.
//  Copyright (c) 2014年 HAJIME MAEDA. All rights reserved.
//

#import "TableViewController.h"
#import "ViewController.h"

@interface TableViewController () {
    
    NSArray *_items;

}


@end

@implementation TableViewController

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
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    // 表示データの設定
//    _items = @[@"BMW01",
//               @"BMW02",
//               @"BMW03",
//               @"BMW04",
//               @"BMW05"];
    
    // 表示データの設定（Plist1）
//    NSBundle *bnd = [NSBundle mainBundle];
//    NSString *prs = [bnd pathForResource:@"Items"
//                                ofType:@"plist"];
//    _items = [NSArray arrayWithContentsOfFile:prs];
    
//    NSLog(@"Plist %@ %@ %@", _items, bnd, prs);
    
    // 表示データの設定（Plist2）
//    NSBundle *bnd = [NSBundle mainBundle];
//    NSString *prs = [bnd pathForResource:@"Items2"
//                                  ofType:@"plist"];
//    _items = [NSArray arrayWithContentsOfFile:prs];
    
    // 表示データの設定（Plist3）
    NSBundle *bnd = [NSBundle mainBundle];
    NSString *prs = [bnd pathForResource:@"Items3"
                                  ofType:@"plist"];
    _items = [NSArray arrayWithContentsOfFile:prs];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

// 設定（列）
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
// #warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

// 設定（行数）
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
// #warning Incomplete method implementation.
    // Return the number of rows in the section.
    
    // 要素の数　配列数 （Plist1）
//    return [_items count];
    
    // 要素の数　配列数（Plist2）
    //return [_items[0] count];
    
    // 要素の数　配列数（Plist3）
    return [_items count];
}

// 設定（セル）
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // セルオブジェクト取得
    UITableViewCell *cell =
    [tableView dequeueReusableCellWithIdentifier:@"Cell"
                                    forIndexPath:indexPath];
    
    // Configure the cell...
    
    // データ表示（Plist1）設定（セル）引数:indexPath
    //cell.textLabel.text = _items[indexPath.row];
    
    // データ表示（Plist2）
//    NSDictionary *dic = _items[0];
//    NSString *str = [NSString stringWithFormat:@"KEY%02ld",(long)indexPath.row];
//    cell.textLabel.text = dic[str];
    
    
    // 表示データの設定（Plist3）
    NSDictionary *dic = _items[indexPath.row];
    
    // テキストラベルに代入
    cell.textLabel.text = dic[@"Name"];
    cell.detailTextLabel.text = dic[@"Note"];
    
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


#pragma mark - Navigation

// ViewController に代入
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    // セグエ判定
    if ([segue.identifier isEqualToString:@"Segue01"]){
        
        // セルの情報の取得
        NSIndexPath *lp = self.tableView.indexPathForSelectedRow;
        NSString *str = _items[lp.row][@"Name"];
        
        ViewController *vc = (ViewController *)segue.destinationViewController;
        
        vc.mssage = str;
    }
}

@end
