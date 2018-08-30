//
//  DetailViewController.h
//  ChineseDictionary
//
//  Created by BK01 on 13-10-24.
//  Copyright (c) 2013年 com.bokan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyNavigationBar.h"
#import <QuartzCore/QuartzCore.h>
#import "HanZi.h"
#import "Shoucang.h"

#import "Zuijin.h"
#import "ShareViewController.h"
#import "IFlySynthesizerViewManager.h"

@interface DetailViewController : UIViewController<NSURLConnectionDataDelegate>
{
    UIView *activityView;
    HanZi *han;
    
    UILabel *tishi;
}

@property(nonatomic,retain)NSString *pinyin;
@property(nonatomic,retain)NSString *zhuyin;

@property(nonatomic,retain)UILabel *mizigeLabel;
@property(nonatomic,retain)UILabel *pinyinLabel;
@property(nonatomic,retain)UILabel *zhuyinLabel;
@property(nonatomic,retain)UILabel *fantiLabel;
@property(nonatomic,retain)UILabel *jiegouLabel;
@property(nonatomic,retain)UILabel *bushouLabel;
@property(nonatomic,retain)UILabel *bihuaLabel;
@property(nonatomic,retain)UILabel *bishunLabel;

@property(nonatomic,retain)UITextView *detailView;

@property(nonatomic,retain)NSMutableData *mData;

@end
