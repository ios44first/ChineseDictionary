//
//  PinyinSearchViewController.h
//  ChineseDictionary
//
//  Created by BK01 on 13-10-16.
//  Copyright (c) 2013年 com.bokan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyNavigationBar.h"
#import "Pinyin.h"
#import "HanZiListViewController.h"


@interface PinyinSearchViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    NSArray *pinyinArray;
    
}


@property(nonatomic,retain)UITableView *tableView;
@property(nonatomic,retain)NSDictionary *resultDic;
@property(nonatomic,retain)NSArray *array;
@property(nonatomic,assign)int buttonTag;

@end
