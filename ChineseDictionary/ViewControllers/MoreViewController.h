//
//  MoreViewController.h
//  ChineseDictionary
//
//  Created by BK01 on 13-10-16.
//  Copyright (c) 2013年 com.bokan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyNavigationBar.h"
#import "CollectionViewController.h"
#import <ShareSDK/ShareSDK.h>

#import "MyAppViewController.h"
#import "JianjieViewController.h"
#import "FanKuiViewController.h"

@interface MoreViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    NSArray *pinyinArray;
}
@property(nonatomic,retain)UITableView *tableView;
@property(nonatomic,retain)NSArray *array;

@end
