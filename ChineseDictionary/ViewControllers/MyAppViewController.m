//
//  MyAppViewController.m
//  汉语字典_test
//
//  Created by ibokan on 13-8-5.
//  Copyright (c) 2013年 ibokan. All rights reserved.
//

#import "MyAppViewController.h"

@interface MyAppViewController ()

@end

@implementation MyAppViewController

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
    self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"beijing.png"]];
    
    //自定义导航栏
    MyNavigationBar *myNavi=[[MyNavigationBar alloc]initWithview:self.view];
    self.navigationController.navigationBar.hidden=YES;
    //导航栏的按钮
    UIButton *back=[UIButton buttonWithType:UIButtonTypeCustom];
    back.frame=CGRectMake(0, 0, 40, 44);
    back.tag=1;
    [back addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
    UIImageView *moreView=[[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 20, 20)];
    moreView.image=[UIImage imageNamed:@"return.png"];
    UIButton *backMain=[UIButton buttonWithType:UIButtonTypeCustom];
    backMain.frame=CGRectMake(275, 0, 40, 44);
    backMain.tag=2;
    [backMain addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
    UIImageView *backView=[[UIImageView alloc]initWithFrame:CGRectMake(285, 10, 20, 20)];
    backView.image=[UIImage imageNamed:@"home@2x.png"];
    [myNavi creatNavigationBarwithTitle:@"精品应用" andLeftButton:back andLeftImage:moreView andRightButton:backMain andRightImage:backView andView:self.view];
    [myNavi release];
    [moreView release];
    
    UIButton *btn1=[UIButton buttonWithType:UIButtonTypeCustom];
    [btn1 setBackgroundImage:[UIImage imageNamed:@"10.png"] forState:UIControlStateNormal];
    btn1.frame=CGRectMake(10, 60, 140, 75);
    [btn1 addTarget:self action:@selector(doButton1:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    UIButton *btn2=[UIButton buttonWithType:UIButtonTypeCustom];
    [btn2 setBackgroundImage:[UIImage imageNamed:@"11.png"] forState:UIControlStateNormal];
    btn2.frame=CGRectMake(170,60, 140, 75);
    [btn2 addTarget:self action:@selector(doButton2:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];

    UIImageView *line=[[UIImageView alloc]initWithFrame:CGRectMake(0, 149, 320, 1)];
    line.image=[UIImage imageNamed:@"dividing-line@2x"];
    [self.view addSubview:line];
    [line release];
    
    NSArray *array1=[[NSArray alloc]initWithObjects:@"QQ",@"PPTV网络电视",@"Twitter",@"爱奇艺视频",@"QQ音乐",@"易呗新概念英语", nil];
    NSArray *array2=[[NSArray alloc]initWithObjects:@"和QQ好友玩游戏吧",@"最高人气视频软件",@"名人社交软件",@"最新视频更新抢先看",@"QQ音乐与您一路同行",@"不一样的学习感受", nil];
    
    for (int i=0; i<6; i++)
    {
        UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 150+i*50, 320, 50)];
        imageView.image=[UIImage imageNamed:@"beijing"];
        [self.view addSubview:imageView];
        imageView.userInteractionEnabled=YES;
        
        UILabel *label1=[[UILabel alloc]initWithFrame:CGRectMake(55, 5, 100, 20)];
        label1.text=[array1 objectAtIndex:i];
        label1.backgroundColor=[UIColor clearColor];
        [imageView addSubview:label1];
        UILabel *label2=[[UILabel alloc]initWithFrame:CGRectMake(55, 25, 200, 20)];
        label2.text=[array2 objectAtIndex:i];
        label2.backgroundColor=[UIColor clearColor];
        [imageView addSubview:label2];
        label1.font=[UIFont systemFontOfSize:14];
        label2.font=[UIFont systemFontOfSize:14];
        
        UIImageView *lineView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 49, 320, 1)];
        lineView.image=[UIImage imageNamed:@"dividing-line@2x"];
        [imageView addSubview:lineView];
        UIImageView *logoView=[[UIImageView alloc]initWithFrame:CGRectMake(5, 5, 40, 40)];
        logoView.image=[UIImage imageNamed:[NSString stringWithFormat:@"%02d",i+1]];
        [imageView addSubview:logoView];

        UIButton *loadBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        [loadBtn setBackgroundImage:[UIImage imageNamed:@"pressed1"] forState:UIControlStateNormal];
        loadBtn.tag=i+1;
        [loadBtn setTitle:@"下载" forState:UIControlStateNormal];
        loadBtn.frame=CGRectMake(260, 10, 50, 30);
        [loadBtn addTarget:self action:@selector(doButton:) forControlEvents:UIControlEventTouchUpInside];
        [imageView addSubview:loadBtn];
    }
}
-(void)doButton:(UIButton *)btn
{
    switch (btn.tag) {
        case 1:
        {
            NSString *strUrl=[NSString stringWithFormat:@"https://itunes.apple.com/cn/app/qq/id444934666?mt=8"];
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:strUrl]];
        }
            break;
        case 2:
        {
            NSString *strUrl=[NSString stringWithFormat:@"https://itunes.apple.com/cn/app/pptv-wang-luo-dian-shi-zui/id438426078?mt=8"];
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:strUrl]];
        }
            break;
        case 3:
        {
            NSString *strUrl=[NSString stringWithFormat:@"https://itunes.apple.com/cn/app/twitter/id333903271?mt=8"];
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:strUrl]];
        }
            break;
        case 4:
        {
            NSString *strUrl=[NSString stringWithFormat:@"https://itunes.apple.com/cn/app/ai-qi-yi-shi-pin/id393765873?mt=8"];
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:strUrl]];
        }
            break;
        case 5:
        {
            NSString *strUrl=[NSString stringWithFormat:@"https://itunes.apple.com/cn/app/qq-yin-le/id414603431?mt=8"];
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:strUrl]];
        }
            break;
        {
            NSString *strUrl=[NSString stringWithFormat:@"https://itunes.apple.com/cn/app/yi-bei-xin-gai-nian-ying-yu/id623670193?mt=8"];
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:strUrl]];
        }
        default:
            break;
    }
}
-(void)doButton1:(UIButton *)btn
{
    NSString *strUrl=[NSString stringWithFormat:@"https://itunes.apple.com/cn/app/da-yu-chi-xiao-yuol-le-le/id541576957?mt=8"];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:strUrl]];
    
}
-(void)doButton2:(UIButton *)btn
{
    NSString *strUrl=[NSString stringWithFormat:@"https://itunes.apple.com/cn/app/zhi-wu-da-zhan-jiang-shi2/id639516529?mt=8"];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:strUrl]];
}
-(void)back:(UIButton *)sender
{
    if (sender.tag==1)
        [self.navigationController popViewControllerAnimated:YES];
    else
        [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
