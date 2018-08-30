//
//  FanKuiViewController.h
//  KeyBoard
//
//  Created by ibokan on 13-8-5.
//  Copyright (c) 2013年 ibokan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FaceToolBar.h"
#import <MessageUI/MessageUI.h>
#import <iflyMSC/IFlyRecognizerView.h>
#import "IFlyRecognizerViewManager.h"


@interface FanKuiViewController : UIViewController<FaceToolBarDelegate,MFMailComposeViewControllerDelegate,IFlyRecognizerViewDelegate>
@property(retain,nonatomic)UIImageView *imageView;
@property(retain,nonatomic)UIImageView *fanKuiImageView;
@end
