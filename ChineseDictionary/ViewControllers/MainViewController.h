//
//  MainViewController.h
//  ChineseDictionary
//
//  Created by BK01 on 13-10-16.
//  Copyright (c) 2013年 com.bokan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyNavigationBar.h"
#import "PinyinSearchViewController.h"
#import "BushouSearchViewController.h"
#import "MoreViewController.h"
#import <QuartzCore/QuartzCore.h>

#import "DetailViewController.h"
#import "HanZiListViewController.h"

#import "Zuijin.h"

#define Chinese @"[\\u4e00-\\u9fa5]"
#define Number @"[1-9]|(1[0-7])"
#define Word @"[A-Z,a-z]{1,6}"


@interface MainViewController : UIViewController<UITextFieldDelegate>

@property(nonatomic,retain)UITextField *inputText;
@property(nonatomic,retain)UILabel *tishiLabel;
@property(nonatomic,retain)UILabel *searchTypeLabel;
@property (retain,nonatomic) UIImageView *recentImageView;
@property (retain,nonatomic) UIButton *recentButton;
@property (retain,nonatomic) UIButton *searchButton;
@property (retain,nonatomic) UIImageView *searchPinyinImageView;
@property (retain,nonatomic) UIImageView *searchBushouImageView;

@end
