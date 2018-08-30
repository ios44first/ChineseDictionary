//
//  JianjieViewController.m
//  Chinese Dictionary
//
//  Created by ibokan on 13-7-30.
//  Copyright (c) 2013年 ibokan. All rights reserved.
//

#import "JianjieViewController.h"

@interface JianjieViewController ()

@end

@implementation JianjieViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)dealloc
{
    self.imageView=nil;
    self.imageView1=nil;
    self.imageView2=nil;
    self.imageView3=nil;
    self.label1=nil;
    self.label2=nil;
    self.label3=nil;
    self.label4=nil;
    self.label5=nil;
    self.label6=nil;
    [super dealloc];
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
    [myNavi creatNavigationBarwithTitle:@"关于我们" andLeftButton:back andLeftImage:moreView andRightButton:backMain andRightImage:backView andView:self.view];
    [myNavi release];
    [moreView release];
       
    self.imageView1=[[UIImageView alloc]initWithFrame:CGRectMake(20, 64, 300, 40)];
    self.imageView1.image=[UIImage imageNamed:@"z@2x.png"];
    [self.view addSubview:self.imageView1];

    self.label1=[[UILabel alloc]initWithFrame:CGRectMake(65, 5, 100, 30)];
    self.label1.text =@"指掌无线";
    [self.imageView1 addSubview:self.label1];
    [self.label1 setBackgroundColor:[UIColor clearColor]];
    self.label1.adjustsFontSizeToFitWidth=YES;
    
    self.label2=[[UILabel alloc]initWithFrame:CGRectMake(220, 40, 80, 30)];
    self.label2.text=@"汉语字典";
    [self.imageView1 addSubview:self.label2];
    [self.label2 setBackgroundColor:[UIColor clearColor]];
    self.label2.adjustsFontSizeToFitWidth=YES;
    
    self.imageView2=[[UIImageView alloc]initWithFrame:CGRectMake(120, 120, 90, 90)];
    self.imageView2.image=[UIImage imageNamed:@"zidian@2x.png"];
    [self.view addSubview:self.imageView2];
    
    self.label3=[[UILabel alloc]initWithFrame:CGRectMake(20, 210, 280, 100)];
    self.label3.text=@"       汉语是世界上最精密的语言之一，语意丰富，耐人寻味，本词典篇幅简短，内容丰富，既求融科学性、知识性、实用性、规范性于一体，又注意突出时代特色。";
    [self.view addSubview:self.label3];
    self.label3.numberOfLines=4;
    self.label3.font=[UIFont systemFontOfSize:14];
    [self.label3 setBackgroundColor:[UIColor clearColor]];
    self.label3.adjustsFontSizeToFitWidth=YES;
    
    self.imageView3=[[UIImageView alloc]initWithFrame:CGRectMake(30, 310, 260, 100)];
    self.imageView3.image=[UIImage imageNamed:@"kuang@2x.png"];
    [self.view addSubview:self.imageView3];
    
    self.label4=[[UILabel alloc]initWithFrame:CGRectMake(20, 10, 220, 30)];
    self.label4.text=@"官方网站: www.zhizhang.com";
    [self.imageView3 addSubview:self.label4];
    self.label4.font=[UIFont systemFontOfSize:13];
    [self.label4 setBackgroundColor:[UIColor clearColor]];
    
    self.label5=[[UILabel alloc]initWithFrame:CGRectMake(20, 35, 220, 30)];
    self.label5.text=@"官方微博: e.weibo.com/u/3385145102";
    [self.imageView3 addSubview:self.label5];
    self.label5.font=[UIFont systemFontOfSize:13];
    [self.label5 setBackgroundColor:[UIColor clearColor]];
    
    self.label6=[[UILabel alloc]initWithFrame:CGRectMake(20, 60, 220, 30)];
    self.label6.text=@"微信公共账号: 指掌无线";
    [self.imageView3 addSubview:self.label6];
    self.label6.font=[UIFont systemFontOfSize:13];
    [self.label6 setBackgroundColor:[UIColor clearColor]];

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
