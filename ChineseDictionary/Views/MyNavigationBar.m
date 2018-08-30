//
//  MyNavigationBar.m
//  ChineseDictionary
//
//  Created by BK01 on 13-10-16.
//  Copyright (c) 2013年 com.bokan. All rights reserved.
//

#import "MyNavigationBar.h"

@implementation MyNavigationBar


-(id)initWithview:(UIView *)view
{
    if (self=[super init]) {
        self.frame=CGRectMake(0, 0, 320, 44);
        
        UIImageView *imaV=[[UIImageView alloc]initWithFrame:CGRectMake(0, -1, 321, 45)];
        imaV.image=[UIImage imageNamed:@"calligrapher@2x.png"];
        [view addSubview:imaV];
        [imaV release];
        
        self._lable=[[UILabel alloc]initWithFrame:CGRectMake(60, 5, 200, 35)];
        self._lable.textAlignment=NSTextAlignmentCenter;
        [self._lable setBackgroundColor:[UIColor clearColor]];
        self._lable.textColor=[UIColor whiteColor];
        self._lable.font=[UIFont fontWithName:@"lixukexingshu" size:25];
        [view addSubview:self._lable];
        [self._lable release];
        
    }
    return self;
}
#pragma mark
-(void)creatNavigationBarwithTitle:(NSString *)str andLeftButton:(UIButton *)leftbutton andLeftImage:(UIImageView*)leftimageview andRightButton:(UIButton *)rightbutton andRightImage:(UIImageView*)rightimageview andView:(UIView *)view
{
    [view addSubview:leftbutton];
    [view addSubview:rightbutton];
    [view addSubview:leftimageview];
    [view addSubview:rightimageview];
    
    self._lable.text=str;;
}
-(void)dealloc
{
    self._lable=nil;
    self._leftImageview=nil;
    self._rightImageview=nil;
    [super dealloc];
}



- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
