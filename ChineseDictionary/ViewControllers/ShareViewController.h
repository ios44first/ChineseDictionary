//
//  ShareViewController.h
//  ChineseDictionary
//
//  Created by BK01 on 13-10-30.
//  Copyright (c) 2013年 com.bokan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ShareSDK/ShareSDK.h>

@interface ShareViewController : UIViewController<UITextViewDelegate>
@property (nonatomic, retain)  UITextView *textView;
@property (nonatomic, retain)  UIImageView *sendImageView;
@property (nonatomic, retain)  UILabel *textCountLabel;

- (void)shareSendButton:(id)sender;
- (void)cancelSendButton:(id)sender;
@end
