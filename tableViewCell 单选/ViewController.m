//
//  ViewController.m
//  tableViewCell 单选
//
//  Created by chenjunfeng on 2017/4/16.
//  Copyright © 2017年 chenjunfeng. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
//@property (nonatomic, strong) NSIndexPath *lastPath;
@end

@implementation ViewController
{
    NSIndexPath *lastPath;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    //1. UITableViewCellStyleDefault
    //2. UITableViewCellStyleValue1,
    //3. UITableViewCellStyleValue2,
    //4. UITableViewCellStyleSubtitle
    cell.imageView.image = [UIImage imageNamed:@"AppIcon40x40"];
    cell.textLabel.text = @"cell 默认样式一";
    cell.detailTextLabel.text = @"cell value 1 样式";
    
    
    
    NSInteger row = [indexPath row];
    
    NSInteger oldRow = [lastPath row];
    
    if (row == oldRow && lastPath!=nil) {
        
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        
    }else{
        
        cell.accessoryType = UITableViewCellAccessoryNone;
        
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger newRow = [indexPath row];
    NSInteger oldRow = [lastPath row];
    
    if (newRow != oldRow) {
        UITableViewCell *newCell = [tableView cellForRowAtIndexPath:indexPath];
        newCell.accessoryType = UITableViewCellAccessoryCheckmark;
        
        UITableViewCell *oldCell = [tableView cellForRowAtIndexPath:lastPath];
        oldCell.accessoryType = UITableViewCellAccessoryNone;
        
        lastPath = indexPath;
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
