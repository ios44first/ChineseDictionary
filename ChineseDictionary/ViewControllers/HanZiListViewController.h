//
//  HanZiListViewController.h
//  ChineseDictionary
//
//  Created by BK01 on 13-10-23.
//  Copyright (c) 2013年 com.bokan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyNavigationBar.h"
#import "MyHanZiCell.h"
#import <QuartzCore/QuartzCore.h>
#import "HanZi.h"
#import "DetailViewController.h"
#import "EGORefreshTableHeaderView.h"
#import "EGORefreshTableFooterView.h"

@interface HanZiListViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,NSURLConnectionDataDelegate,EGORefreshTableDelegate,UIScrollViewDelegate>
{
    int maxPage;
    UIView *activityView;
    int currentPage;
    EGORefreshTableHeaderView *_refreshHeaderView;
    EGORefreshTableFooterView *_refreshFooterView;
    BOOL _reloading;
    BOOL isHeader;
}

@property(nonatomic,retain)UITableView *tableView;
@property(nonatomic,retain)NSMutableArray *array;
@property(nonatomic,retain)NSString *pinyin;
@property(nonatomic,assign)int bushouID;

@property(nonatomic,retain)NSMutableData *mData;


@end
