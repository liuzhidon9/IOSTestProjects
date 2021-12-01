//
//  ViewController.h
//  tableViewDemo
//
//  Created by donview on 2021/11/26.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray<NSString *> *dataList;
@end

