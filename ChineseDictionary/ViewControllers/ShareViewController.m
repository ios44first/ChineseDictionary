//
//  ShareViewController.m
//  ChineseDictionary
//
//  Created by BK01 on 13-10-30.
//  Copyright (c) 2013年 com.bokan. All rights reserved.
//

#import "ShareViewController.h"

@interface ShareViewController ()

@end

@implementation ShareViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self.view setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.7]];
    
    UIImageView *backGround=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"AGShareBG.png"]];
    backGround.userInteractionEnabled=YES;
    backGround.frame=CGRectMake(10, 50, 300, 200);
    [self.view addSubview:backGround];
    
    UIButton *back=[UIButton buttonWithType:UIButtonTypeCustom];
    back.frame=CGRectMake(15, 15, 60, 30);
    [back setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [back setTitle:@"取消" forState:UIControlStateNormal];
    [back addTarget:self action:@selector(cancelSendButton:) forControlEvents:UIControlEventTouchUpInside];
    [backGround addSubview:back];
    
    UIButton *send=[UIButton buttonWithType:UIButtonTypeCustom];
    send.frame=CGRectMake(225, 15, 60, 30);
    [send setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [send setTitle:@"发送" forState:UIControlStateNormal];
    [send addTarget:self action:@selector(shareSendButton:) forControlEvents:UIControlEventTouchUpInside];
    [backGround addSubview:send];
    
    self.textView=[[UITextView alloc]initWithFrame:CGRectMake(10, 55, 200, 120)];
    [self.textView becomeFirstResponder];
    [self.textView setBackgroundColor:[UIColor clearColor]];
    self.textView.delegate=self;
    [backGround addSubview:self.textView];
    
    self.sendImageView=[[UIImageView alloc]initWithFrame:CGRectMake(215, 60, 75, 100)];
    self.sendImageView.image=[UIImage imageNamed:@"Image.png"];
    [backGround addSubview:self.sendImageView];
    UIImageView *zhen=[[UIImageView alloc]initWithFrame:CGRectMake(240, 50, 40, 30)];
    zhen.image=[UIImage imageNamed:@"Pin.png"];
    [backGround addSubview:zhen];
    
    self.textCountLabel=[[UILabel alloc]initWithFrame:CGRectMake(240, 160, 60, 30)];
    self.textCountLabel.backgroundColor=[UIColor clearColor];
    self.textCountLabel.text=@"140字";
    [backGround addSubview:self.textCountLabel];
}

- (void)shareSendButton:(id)sender
{
    NSString *imagePath = [[NSBundle mainBundle] pathForResource:@"image"  ofType:@"png"];
//    //构造分享内容
//    id<ISSContent> publishContent = [ShareSDK
//            content:self.textView.text  defaultContent:@"默认分享内容，没内容时显示"
//            image:[ShareSDK imageWithPath:imagePath]
//             title:@"我的汉语字典"
//             url:@"http://www.baidu.com"
//             description:@"这是一条测试信息"
//             mediaType:SSPublishContentMediaTypeNews];
//    
//    [ShareSDK shareContent:publishContent
//                      type:ShareTypeSinaWeibo
//               authOptions:nil
//             statusBarTips:YES
//                    result:^(ShareType type, SSPublishContentState state, id<ISSStatusInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
//                        if (state == SSPublishContentStateSuccess)
//                        {
//                            NSLog(@"分享成功");
//                            [self dismissViewControllerAnimated:YES completion:nil];
//                        }else if (state == SSPublishContentStateFail)
//                        {
//                            NSLog(@"分享失败,错误码:%d,错误描述:%@",[error errorCode],[error errorDescription]);
//                        }
//                    }];

    
    //构造分享内容
    id<ISSContent> publishContent = [ShareSDK content:@"分享内容"
                                       defaultContent:@"默认分享内容，没内容时显示"
                                                image:[ShareSDK imageWithPath:imagePath]
                                                title:@"我的汉语字典"
                                                  url:@"http://www.baidu.com"
                                          description:@"这是一条测试信息"
                                            mediaType:SSPublishContentMediaTypeNews];
    
    [ShareSDK showShareActionSheet:nil
                         shareList:nil
                           content:publishContent
                     statusBarTips:YES
                       authOptions:nil
                      shareOptions: nil
                            result:^(ShareType type, SSPublishContentState state, id<ISSStatusInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                                if (state == SSPublishContentStateSuccess)
                                {
                                    NSLog(@"分享成功");
                                }
                                else if (state == SSPublishContentStateFail)
                                {
                                    NSLog(@"分享失败,错误码:%d,错误描述:%@", [error errorCode], [error errorDescription]);
                                }
                            }];
}
- (void)cancelSendButton:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)textViewDidChange:(UITextView *)textView
{
    int num=140 - [self.textView.text length];
    if (num>=0)
        self.textCountLabel.text = [NSString stringWithFormat:@"%d字",num];
    else
        self.textView.text=[self.textView.text substringToIndex:140];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
