//
//  RootViewController.h
//  ChineseDictionary
//
//  Created by BK01 on 13-10-16.
//  Copyright (c) 2013年 com.bokan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KOAProgressBar.h"
#import "MainViewController.h"

@interface RootViewController : UIViewController
{
    KOAProgressBar *pro;
    NSTimer *timer;
    UILabel *showPercent;
}

@end
