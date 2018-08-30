//
//  CollectionViewController.h
//  ChineseDictionary
//
//  Created by BK01 on 13-10-29.
//  Copyright (c) 2013年 com.bokan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyNavigationBar.h"
#import "Shoucang.h"
#import "DetailViewController.h"

@interface CollectionViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,retain)UITableView *tableView;
@property(nonatomic,retain)NSMutableArray *array;


@end
