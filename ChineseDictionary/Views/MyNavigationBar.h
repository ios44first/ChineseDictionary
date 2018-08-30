//
//  MyNavigationBar.h
//  ChineseDictionary
//
//  Created by BK01 on 13-10-16.
//  Copyright (c) 2013年 com.bokan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyNavigationBar : UIView
@property(retain,nonatomic)UILabel *_lable;
@property(retain,nonatomic)UIImageView *_leftImageview;
@property(retain,nonatomic)UIImageView *_rightImageview;
-(id)initWithview:(UIView *)view;
-(void)creatNavigationBarwithTitle:(NSString *)str andLeftButton:(UIButton *)leftbutton andLeftImage:(UIImageView*)leftimageview andRightButton:(UIButton *)rightbutton andRightImage:(UIImageView*)rightimageview andView:(UIView *)view;
@end
