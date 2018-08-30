//
//  DetailViewController.m
//  ChineseDictionary
//
//  Created by BK01 on 13-10-24.
//  Copyright (c) 2013年 com.bokan. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

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
    [myNavi creatNavigationBarwithTitle:self.title andLeftButton:back andLeftImage:moreView andRightButton:backMain andRightImage:backView andView:self.view];
    [myNavi release];
    [moreView release];
    
    UIImageView *miView=[[UIImageView alloc]initWithFrame:CGRectMake(8, 55, 70, 70)];
    miView.image=[UIImage imageNamed:@"banmizige@2x.png"];
    [self.view addSubview:miView];
    
    self.mizigeLabel=[[UILabel alloc]initWithFrame:CGRectMake(4, 55, 70, 70)];
    self.mizigeLabel.font=[UIFont fontWithName:@"Tianshi-Diaoyu" size:60];
    self.mizigeLabel.textAlignment=NSTextAlignmentCenter;
    self.mizigeLabel.text=self.title;
    self.mizigeLabel.backgroundColor=[UIColor clearColor];
    [self.view  addSubview:self.mizigeLabel];
    [self.mizigeLabel release];
    
    self.pinyinLabel=[[UILabel alloc]initWithFrame:CGRectMake(85, 55, 100, 20)];
    self.pinyinLabel.font=[UIFont fontWithName:@"Tianshi-Diaoyu" size:14];
    self.pinyinLabel.text=[NSString stringWithFormat:@"拼音：%@",self.pinyin];
    self.pinyinLabel.backgroundColor=[UIColor clearColor];
    [self.view  addSubview:self.pinyinLabel];
    [self.pinyinLabel release];
    
    self.fantiLabel=[[UILabel alloc]initWithFrame:CGRectMake(85, 80, 100, 20)];
    self.fantiLabel.font=[UIFont fontWithName:@"Tianshi-Diaoyu" size:14];
    self.fantiLabel.text=@"繁体：";
    self.fantiLabel.backgroundColor=[UIColor clearColor];
    [self.view  addSubview:self.fantiLabel];
    [self.fantiLabel release];
    
    self.bushouLabel=[[UILabel alloc]initWithFrame:CGRectMake(85, 105, 100, 20)];
    self.bushouLabel.font=[UIFont fontWithName:@"Tianshi-Diaoyu" size:14];
    self.bushouLabel.text=@"部首：";
    self.bushouLabel.backgroundColor=[UIColor clearColor];
    [self.view  addSubview:self.bushouLabel];
    [self.bushouLabel release];
    
    self.bishunLabel=[[UILabel alloc]initWithFrame:CGRectMake(85, 130, 240, 20)];
    self.bishunLabel.font=[UIFont fontWithName:@"Tianshi-Diaoyu" size:14];
    self.bishunLabel.text=@"笔顺：";
    self.bishunLabel.backgroundColor=[UIColor clearColor];
    [self.view  addSubview:self.bishunLabel];
    [self.bishunLabel release];
    
    self.zhuyinLabel=[[UILabel alloc]initWithFrame:CGRectMake(185, 55, 100, 20)];
    self.zhuyinLabel.font=[UIFont fontWithName:@"Tianshi-Diaoyu" size:14];
    self.zhuyinLabel.text=[NSString stringWithFormat:@"注音：%@",self.zhuyin];
    self.zhuyinLabel.backgroundColor=[UIColor clearColor];
    [self.view  addSubview:self.zhuyinLabel];
    [self.zhuyinLabel release];
    
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame=CGRectMake(280, 55, 20, 20);
    [btn setImage:[UIImage imageNamed:@"loud@2x.png"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(loadSound:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    self.jiegouLabel=[[UILabel alloc]initWithFrame:CGRectMake(185, 80, 120, 20)];
    self.jiegouLabel.font=[UIFont fontWithName:@"Tianshi-Diaoyu" size:14];
    self.jiegouLabel.text=@"结构：";
    self.jiegouLabel.backgroundColor=[UIColor clearColor];
    [self.view  addSubview:self.jiegouLabel];
    [self.jiegouLabel release];
    
    self.bihuaLabel=[[UILabel alloc]initWithFrame:CGRectMake(185, 105, 100, 20)];
    self.bihuaLabel.font=[UIFont fontWithName:@"Tianshi-Diaoyu" size:14];
    self.bihuaLabel.text=@"笔画：";
    self.bihuaLabel.backgroundColor=[UIColor clearColor];
    [self.view  addSubview:self.bihuaLabel];
    [self.bihuaLabel release];
    
    UISegmentedControl *segment=[[UISegmentedControl alloc]initWithItems:@[@"基本信息",@"汉语字典",@"组成词语",@"英文翻译"]];
    segment.frame=CGRectMake(10, 170, 300, 30);
    NSDictionary *dic=[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithRed:130.0/255 green:32.0/255 blue:10.0/255 alpha:1],UITextAttributeTextColor,[UIFont fontWithName:@"AppleGothic" size:14],UITextAttributeFont, nil];
    [segment setTitleTextAttributes:dic forState:UIControlStateNormal];
    [segment setBackgroundImage:[UIImage imageNamed:@"pyjz_normal01.png"] forState:UIControlStateNormal barMetrics:(UIBarMetricsDefault)];
    [segment setBackgroundImage:[UIImage imageNamed:@"pyjz_pressed11.png"] forState:UIControlStateSelected barMetrics:(UIBarMetricsDefault)];
    [segment setSelectedSegmentIndex:0];
    [segment setSegmentedControlStyle:(UISegmentedControlStyleBar)];
    [segment addTarget:self action:@selector(changeMessage:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:segment];
    [segment release];
    
    CGRect rect1,rect2;
    if (self.view.frame.size.height==460.0)
    {
        rect1=CGRectMake(5, 225, 310, 179);
        rect2=CGRectMake(10, 35, 290, 130);
    }
    else
    {
        rect1=CGRectMake(5, 225, 310, 239);
        rect2=CGRectMake(10, 35, 290, 190);
    }
    
    UIImageView *imgView=[[UIImageView alloc]initWithFrame:rect1];
    imgView.image=[UIImage imageNamed:@"informatianlow@2x.png"];
    imgView.userInteractionEnabled=YES;
    [self.view addSubview:imgView];
    UIImageView *imgViewBiezhen=[[UIImageView alloc]initWithFrame:CGRectMake(272, 213, 30, 50)];
    imgViewBiezhen.image=[UIImage imageNamed:@"brooch.png"];
    [self.view addSubview:imgViewBiezhen];
    
    self.detailView=[[UITextView alloc]initWithFrame:rect2];
    self.detailView.autoresizingMask=UIViewAutoresizingFlexibleHeight;
    self.detailView.editable=NO;
    self.detailView.userInteractionEnabled=YES;
    self.detailView.text=@"暂无";
    self.detailView.font=[UIFont systemFontOfSize:16];
    [imgView addSubview:self.detailView];
    [imgView release];
    [imgViewBiezhen release];
    [self.detailView release];
    
    activityView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    activityView.center=self.view.center;
    activityView.backgroundColor=[UIColor colorWithRed:0 green:0 blue:0 alpha:0.89];
    [activityView.layer setCornerRadius:10];
    UIActivityIndicatorView *ac=[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:(UIActivityIndicatorViewStyleWhiteLarge)];
    ac.frame=CGRectMake(25, 25, 50, 50);
    [ac startAnimating];
    [activityView addSubview:ac];
    [self.view addSubview:activityView];
    [ac release];
    [activityView release];
    
    UIImageView *threeButtonView=[[UIImageView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height-49, 321, 50)];
    threeButtonView.image=[UIImage imageNamed:@"calligrapher.png"];
    [self.view addSubview:threeButtonView];
    [threeButtonView release];
    
    UIButton *btn1=[UIButton buttonWithType:UIButtonTypeCustom];
    btn1.frame=CGRectMake(42, self.view.frame.size.height-49, 50, 49);
    [btn1 setTitle:@"复制" forState:UIControlStateNormal];
    [btn1 setTitleEdgeInsets:(UIEdgeInsetsMake(35, 0, 0, 0))];
    btn1.titleLabel.font=[UIFont systemFontOfSize:12];
    [btn1 setBackgroundImage:[UIImage imageNamed:@"penlow@2x.png"] forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    btn1.tag=1;
    [self.view addSubview:btn1];
    UIButton *btn2=[UIButton buttonWithType:UIButtonTypeCustom];
    btn2.frame=CGRectMake(135, self.view.frame.size.height-49, 50, 49);
    [btn2 setTitle:@"收藏" forState:UIControlStateNormal];
    [btn2 setTitleEdgeInsets:(UIEdgeInsetsMake(35, 0, 0, 0))];
    btn2.titleLabel.font=[UIFont systemFontOfSize:12];
    [btn2 setBackgroundImage:[UIImage imageNamed:@"penlow@2x.png"] forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    btn2.tag=2;
    [self.view addSubview:btn2];
    UIButton *btn3=[UIButton buttonWithType:UIButtonTypeCustom];
    btn3.frame=CGRectMake(231, self.view.frame.size.height-49, 50, 49);
    [btn3 setTitle:@"分享" forState:UIControlStateNormal];
    [btn3 setTitleEdgeInsets:(UIEdgeInsetsMake(35, 0, 0, 0))];
    btn3.titleLabel.font=[UIFont systemFontOfSize:12];
    [btn3 setBackgroundImage:[UIImage imageNamed:@"penlow@2x.png"] forState:UIControlStateNormal];
    [btn3 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    btn3.tag=3;
    [self.view addSubview:btn3];
    
    UIImageView *imgView1=[[UIImageView alloc]initWithFrame:CGRectMake(52, self.view.frame.size.height-45, 30, 30)];
    imgView1.image=[UIImage imageNamed:@"document@2x.png"];
    [self.view addSubview:imgView1];
    [imgView1 release];
    UIImageView *imgView2=[[UIImageView alloc]initWithFrame:CGRectMake(145, self.view.frame.size.height-45, 30, 30)];
    imgView2.image=[UIImage imageNamed:@"star.png"];
    [self.view addSubview:imgView2];
    [imgView2 release];
    UIImageView *imgView3=[[UIImageView alloc]initWithFrame:CGRectMake(241, self.view.frame.size.height-45, 30, 30)];
    imgView3.image=[UIImage imageNamed:@"share@2x.png"];
    [self.view addSubview:imgView3];
    [imgView3 release];
    
    tishi=[[UILabel alloc]initWithFrame:CGRectMake(50, 400, 220, 30)];
    tishi.backgroundColor=[UIColor colorWithRed:0 green:0 blue:0 alpha:0.7];
    tishi.textColor=[UIColor whiteColor];
    tishi.textAlignment=NSTextAlignmentCenter;
    tishi.hidden=YES;
    [self.view addSubview:tishi];
    
    NSString *strURL=[[NSString stringWithFormat:@"http://www.chazidian.com/service/word/%@",self.title] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *url=[NSURL URLWithString:strURL];
    NSURLRequest *re=[NSURLRequest requestWithURL:url];
    [NSURLConnection connectionWithRequest:re delegate:self];
}
-(void)buttonAction:(UIButton *)sender
{
    switch (sender.tag)
    {
        case 1:
        {
            UIPasteboard *pasteboard=[UIPasteboard generalPasteboard];
            pasteboard.string = self.detailView.text;
//            [UIView animateWithDuration:0.5 animations:^{
//                tishi.hidden=NO;
//                tishi.text=@"已复制到粘贴板！";
//                //[tishi sizeToFit];
//            }];
            tishi.hidden=NO;
            tishi.alpha=1;
            tishi.text=@"已复制到粘贴板！";
            [UIView animateWithDuration:2.0
                                  delay:0.0
                                options:UIViewAnimationOptionCurveEaseIn
                             animations:^{
                                 tishi.alpha = 0;
                             }
                             completion:^(BOOL finished){
                               //  [tishi removeFromSuperview];
                             }
             ];

            //[self performSelector:@selector(hideLAbel) withObject:nil afterDelay:1];
        }
            break;
        case 2:
        {
            tishi.alpha=1;
            NSArray *shoucangArray=[Shoucang selectAllShoucang];
            for (Shoucang *shou in shoucangArray)
            {
                if([shou.hanzi isEqualToString:self.title])
                {
                    [UIView animateWithDuration:0.5 animations:^{
                        tishi.hidden=NO;
                        tishi.text=@"已经收藏过次文字！";
                    }];
                    [self performSelector:@selector(hideLAbel) withObject:nil afterDelay:1];
                    return;
                }
            }
            
            BOOL is= [Shoucang insertShoucangWithHanzi:han.wenzi andPinyin:han.pinyin andFanti:han.fanti andBushou:han.bushou andBishun:han.bishun andJiegou:han.jiegou andBsNum:nil andBihuaNum:han.bihua andZhuyin:han.zhuyin andTime:[[NSDate date]description]];
            if (is)
            {
               [UIView animateWithDuration:0.5 animations:^{
                   tishi.hidden=NO;
                   tishi.text=@"收藏成功";
                }];
                [self performSelector:@selector(hideLAbel) withObject:nil afterDelay:1];
            }
        }
            break;
        case 3:
        {
            ShareViewController *share=[ShareViewController new];
            [self presentViewController:share animated:YES completion:nil];
        }
            break;
    }
}
-(void)hideLAbel
{
    [UIView animateWithDuration:0.5 animations:^{
        tishi.hidden=YES;
    }];
}
-(void)changeMessage:(UISegmentedControl *)sender
{
    switch (sender.selectedSegmentIndex)
    {
        case 0:self.detailView.text=han.baseMessage;
            break;
        case 1:self.detailView.text=han.detail;
            break;
        case 2:self.detailView.text=han.ciyu;
            break;
        case 3:self.detailView.text=han.english;
            break;
    }
}
-(void)loadSound:(UIButton *)sender
{
    IFlySynthesizerView *ifly=[IFlySynthesizerViewManager getIFlySynthesizerView];
    [ifly startSpeaking:self.title];
}
-(void)viewDidAppear:(BOOL)animated
{
    [Zuijin insertZuijinWithHanzi:self.title andTime:[[NSDate date] description]];
}
#pragma mark-- NSURLConnection代理方法
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    self.mData=[[NSMutableData alloc]init];
}
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [self.mData appendData:data];
}
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSDictionary *dic=[NSJSONSerialization JSONObjectWithData:self.mData options:(NSJSONReadingMutableContainers) error:nil];
    NSDictionary *data=[dic valueForKey:@"data"];
    NSDictionary *baseinfo=[data valueForKey:@"baseinfo"];
    han=[HanZi new];
    han.wenzi=self.title;
    
    NSDictionary *yinDic=[baseinfo valueForKey:@"yin"];
    han.pinyin=[yinDic valueForKey:@"pinyin"];
    self.pinyinLabel.text=[NSString stringWithFormat:@"拼音：%@",han.pinyin];
    han.zhuyin=[yinDic valueForKey:@"zhuyin"];
    self.zhuyinLabel.text=[NSString stringWithFormat:@"注音：%@",han.zhuyin];
    han.fanti=[baseinfo valueForKey:@"tra"];
    if ([han.fanti isKindOfClass:[NSNull class]])
        self.fantiLabel.text=[NSString stringWithFormat:@"繁体：无"];
    else
        self.fantiLabel.text=[NSString stringWithFormat:@"繁体：%@",han.fanti];
    han.jiegou=[baseinfo valueForKey:@"frame"];
    if ([han.jiegou  isKindOfClass:[NSNull class]])
        self.jiegouLabel.text=[NSString stringWithFormat:@"结构：无"];
    else
        self.jiegouLabel.text=[NSString stringWithFormat:@"结构：%@",han.jiegou];
    han.bushou=[baseinfo valueForKey:@"bushou"];
    self.bushouLabel.text=[NSString stringWithFormat:@"部首：%@",han.bushou];
    han.bihua=[baseinfo valueForKey:@"num"];
    self.bihuaLabel.text=[NSString stringWithFormat:@"笔画：%@",han.bihua];
    han.bishun=[baseinfo valueForKey:@"seq"];
    self.bishunLabel.text=[NSString stringWithFormat:@"笔顺：%@",han.bishun];
    
    han.baseMessage=[data valueForKey:@"hanyu"];
    han.detail=[data valueForKey:@"base"];
    han.ciyu=[data valueForKey:@"idiom"];
    han.english=[data valueForKey:@"english"];
    
    self.detailView.text=han.baseMessage;
    
    activityView.hidden=YES;
}
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"%@",error);
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
