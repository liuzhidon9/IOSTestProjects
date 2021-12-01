//
//  ViewController.m
//  tableViewDemo
//
//  Created by donview on 2021/11/26.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.tableView];
    NSLog(@"tableStyle:%ld",self.tableView.style);
}

-(NSMutableArray<NSString *> *) dataList{
    if(_dataList==nil){
        NSMutableArray<NSString *> *array = [[NSMutableArray alloc]init];
        for (int i=0; i<20; i++) {
            NSString *item = [NSString stringWithFormat:@"item %d",arc4random_uniform(1000000)];
            [array addObject:item];
        }
        _dataList = array;
    }
    return  _dataList;
}

//对tableView属性进行懒加载
- (UITableView *)tableView {
    if (_tableView==nil){
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.sectionFooterHeight = 0;
        _tableView.sectionIndexBackgroundColor = [UIColor lightGrayColor];
        UILabel *headerView = [[UILabel alloc] initWithFrame:CGRectMake(0,0, self.view.bounds.size.width, 50)];
        headerView.backgroundColor = [UIColor redColor];
        headerView.text = @"Header";
        headerView.textAlignment = NSTextAlignmentCenter;
        headerView.font = [UIFont systemFontOfSize:30 weight:UIFontWeightBold];
        headerView.textColor = [UIColor whiteColor];
        _tableView.tableHeaderView = headerView;
        
        UILabel *footerView = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 100)];
        footerView.text = @"Footer";
        footerView.textAlignment = NSTextAlignmentCenter;
        footerView.font = [UIFont systemFontOfSize:30 weight:UIFontWeightBold];
        footerView.backgroundColor = [UIColor greenColor];
        footerView.textColor = [UIColor whiteColor];
        _tableView.tableFooterView = footerView;
        
        UIImageView *backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"magical-tree"]];
        backgroundView.contentMode = UIViewContentModeCenter;
        _tableView.backgroundView =backgroundView;
        
    }
    return  _tableView;
}

#pragma mark UITableViewDelegate

//是否开启点击高亮显示
-(BOOL) tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath{
    return  YES;
}

//指定行被高亮显示时调用
-(void)tableView:(UITableView *)tableView didHighlightRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"第%ld行被高亮显示了",indexPath.row);
}

//指定行将要被选中时调用，返回响应行的索引。
-(nullable NSIndexPath *) tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"第%ld行将要被选中",indexPath.row);
    return  indexPath;
}

//指定行被选中时调用
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"第%ld被选中了",indexPath.row);
}

//指定行将要被取消选中时调用，返回响应行的索引。
-(nullable NSIndexPath *) tableView:(UITableView *)tableView willDeselectRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    NSLog(@"第%ld行将要被取消选中",indexPath.row);
    return  indexPath;
}

//指定行被取消选中时调用
-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    NSLog(@"第%ld已被取消选中",indexPath.row);
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"滚动中...");
}

//设置每个tableview中section的footer高度。
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if(section==3){
        return 0;
    }
    return 20;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UILabel *labelView = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 50)];
    labelView.text = @"view for footer in section";
    labelView.textAlignment = NSTextAlignmentCenter;
    labelView.backgroundColor = [UIColor grayColor];
    labelView.textColor = [UIColor whiteColor];
    return  labelView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 300;
}

//- (NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath{
//    UITableViewRowAction *action = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"删除" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
//        NSString *currentItem = self.dataList[indexPath.row+indexPath.section*5];
//        [self.dataList removeObject:currentItem];
//        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
//        [tableView reloadData];
//    }];
//    return @[action];
//}

//- (UISwipeActionsConfiguration *)tableView:(UITableView *)tableView trailingSwipeActionsConfigurationForRowAtIndexPath:(NSIndexPath *)indexPath{
//
//    UIContextualAction *action = [UIContextualAction contextualActionWithStyle:UIContextualActionStyleDestructive title:@"DELETE" handler:^(UIContextualAction * _Nonnull action, __kindof UIView * _Nonnull sourceView, void (^ _Nonnull completionHandler)(BOOL)) {
//        [self.dataList removeObjectAtIndex:indexPath.row];
//        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
////        [tableView reloadData];
//    }];
//    UISwipeActionsConfiguration *configuration = [UISwipeActionsConfiguration configurationWithActions:@[action]];
//    return  configuration;
//}


#pragma mark UITableViewDataSource


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    return [self.dataList count] ;
    return  5;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //初始化cell
    static NSString *cellID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if(cell==nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
  
    cell.textLabel.text = self.dataList[indexPath.row+indexPath.section*5];
    UIImageView *customAccessory =[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"magical-tree"]];
    customAccessory.frame = CGRectMake(0, 0, self.view.bounds.size.width, 300);
    
//    cell.accessoryView = customAccessory;
    [cell.contentView addSubview:customAccessory];
    cell.selectionStyle = UITableViewCellSelectionStyleGray;
    cell.clipsToBounds = YES;
    return  cell;
}

- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    return @[@"a",@"b",@"c",@"d"];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"title of header in section";
}

@end
