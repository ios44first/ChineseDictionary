//
//  MainViewController.m
//  ChineseDictionary
//
//  Created by BK01 on 13-10-16.
//  Copyright (c) 2013年 com.bokan. All rights reserved.
//

#import "MainViewController.h"
#import "IFlySynthesizerViewManager.h"

@interface MainViewController ()

@end

@implementation MainViewController

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
    
//    IFlySynthesizerView *ifly=[IFlySynthesizerViewManager getIFlySynthesizerView];
//    [ifly startSpeaking:@"我是一名iOS开发工程师。"];
    
    
    
    //背景图片
    self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"beijing.png"]];
    //自定义导航栏
    MyNavigationBar *myNavi=[[MyNavigationBar alloc]initWithview:self.view];
    self.navigationController.navigationBar.hidden=YES;
    //导航栏的按钮
    UIButton *more=[UIButton buttonWithType:UIButtonTypeCustom];
    more.frame=CGRectMake(280, 0, 40, 44);
    [more addTarget:self action:@selector(doMore) forControlEvents:UIControlEventTouchUpInside];
    UIImageView *moreView=[[UIImageView alloc]initWithFrame:CGRectMake(290, 19, 20, 5)];
    moreView.image=[UIImage imageNamed:@"more.png"];
    
    [myNavi creatNavigationBarwithTitle:@"汉字字典" andLeftButton:nil andLeftImage:nil andRightButton:more andRightImage:moreView andView:self.view];
    [myNavi release];
    [moreView release];
    //SegmentedControl单选按钮
    UISegmentedControl *segment=[[UISegmentedControl alloc] initWithItems:@[@"拼音查字",@"部首检字"]];
    [segment setFrame:CGRectMake(20, 44+10, 280, 30)];
    [segment setSegmentedControlStyle:UISegmentedControlStyleBar];
    [segment setBackgroundImage:[UIImage imageNamed:@"pyjz_normal01.png"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [segment setBackgroundImage:[UIImage imageNamed:@"pyjz_pressed11.png"] forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
    [segment setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor blackColor],UITextAttributeTextColor,[UIFont fontWithName:@"AppleGothic" size:14],UITextAttributeFont, nil] forState:UIControlStateNormal];
    [segment addTarget:self action:@selector(changeType:) forControlEvents:UIControlEventValueChanged];
    segment.selectedSegmentIndex=0;
    [self.view addSubview:segment];
    [segment release];
    
    //输入框
    self.inputText=[[UITextField alloc]initWithFrame:CGRectMake(20, 44+10+30+10, 280, 30)];
    self.inputText.placeholder=@"请输入要查询的汉字。。。";
    self.inputText.textAlignment=NSTextAlignmentLeft;
    self.inputText.borderStyle=UITextBorderStyleRoundedRect;
    self.inputText.returnKeyType=UIReturnKeySearch;
    self.inputText.delegate=self;
    [self.view addSubview:self.inputText];
    [self.inputText release];
    
    //键盘的工具栏
    UIToolbar *tool=[[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 40)];
    tool.barStyle=UIBarStyleBlackTranslucent;
    UIButton *keyButton=[UIButton buttonWithType:UIButtonTypeCustom];
    keyButton.frame=CGRectMake(290, 5, 23, 23);
    [keyButton addTarget:self action:@selector(keyButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [keyButton setImage:[UIImage imageNamed:@"jianpan.png"] forState:UIControlStateNormal];
    [tool addSubview:keyButton];
    self.inputText.inputAccessoryView=tool;
    [tool release];
    //“最近搜索” 和 分割线
    UILabel *la1=[[UILabel alloc]initWithFrame:CGRectMake(20, 54+40+30+10, 100, 30)];
    la1.text=@"最近搜索：";
    la1.font=[UIFont fontWithName:@"Tianshi-Diaoyu" size:20];
    [la1 setBackgroundColor:[UIColor clearColor]];
    [la1 setTextColor:[UIColor colorWithRed:120.0/255 green:39.0/255 blue:15.0/255 alpha:1]];
    [self.view addSubview:la1];
    [la1 release];
    UIImageView *imgView=[[UIImageView alloc]initWithFrame:CGRectMake(20, 54+80+30+3, 280, 2)];
    imgView.image=[UIImage imageNamed:@"pinyin.png"];
    [self.view addSubview:imgView];
    [imgView release];
    
    //最近搜索的
    self.recentImageView=[[UIImageView alloc]initWithFrame:CGRectMake(20, 54+110+5+8, 280, 30)];
    self.recentImageView.image=[UIImage imageNamed:@"Key-frame1.png"];
    self.recentImageView.userInteractionEnabled=YES;
    [self.view addSubview:self.recentImageView];
    [self.recentImageView release];
    
    UILongPressGestureRecognizer *longPress=[UILongPressGestureRecognizer new];
    longPress.minimumPressDuration=2;
    [longPress addTarget:self action:@selector(longPressAction:)];
    [self.recentImageView addGestureRecognizer:longPress];
    
    //“最近搜索” 和 分割线
    self.searchTypeLabel=[[UILabel alloc]initWithFrame:CGRectMake(20, 54+110+43, 280, 30)];
    self.searchTypeLabel.text=@"按照拼音字母检索：";
    self.searchTypeLabel.font=[UIFont fontWithName:@"Tianshi-Diaoyu" size:20];
    [self.searchTypeLabel setBackgroundColor:[UIColor clearColor]];
    [self.searchTypeLabel setTextColor:[UIColor colorWithRed:120.0/255 green:39.0/255 blue:15.0/255 alpha:1]];
    [self.view addSubview:self.searchTypeLabel];
    [self.searchTypeLabel release];
    UIImageView *imgView1=[[UIImageView alloc]initWithFrame:CGRectMake(20, 54+153+30+3, 280, 2)];
    imgView1.image=[UIImage imageNamed:@"pinyin.png"];
    [self.view addSubview:imgView1];
    [imgView1 release];
    
    //拼音查找 和 部首查找
    NSArray *pinyinArray=@[@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z"];
    NSArray *bushouArray=@[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17"];
    //创建部首检索索引视图
    self.searchBushouImageView=[[UIImageView alloc]initWithFrame:CGRectMake(20, 54+153+35+10, 280, 180)];
    self.searchBushouImageView.image=[UIImage imageNamed:@"Key-frame2.png"];
    [self.view addSubview:self.searchBushouImageView];
    [self.searchBushouImageView release];
    [self.searchBushouImageView setUserInteractionEnabled:YES];
    int count=0;
    for (int i=0; i<3; i++) {
        for (int j=0; j<6; j++) {
            count++;
            self.searchButton=[UIButton buttonWithType:UIButtonTypeCustom];
            self.searchButton.tag=count;
            self.searchButton.frame=CGRectMake(5+j*48, 5+i*50, 25, 25);
            [self.searchButton setTitle:[bushouArray objectAtIndex:count-1] forState:(UIControlStateNormal)];
            [self.searchButton addTarget:self action:@selector(doBushouSearch:) forControlEvents:(UIControlEventTouchUpInside)];
            [self.searchButton setTitleColor:[UIColor colorWithRed:130.0/255 green:32.0/255 blue:10.0/255 alpha:1] forState:UIControlStateNormal];
            [self.searchButton setBackgroundImage:[UIImage imageNamed:@"pressed1.png"] forState:UIControlStateHighlighted];
            [self.searchButton setBackgroundColor:[UIColor colorWithRed:1 green:0.1 blue:0.1 alpha:0.6]];
            [self.searchButton.layer setCornerRadius:12.5];
            [self.searchBushouImageView addSubview:self.searchButton];
            if (count>=17) {
                break;
            }
        }
    }
    //创建拼音检索索引视图
    self.searchPinyinImageView=[[UIImageView alloc]initWithFrame:CGRectMake(20, 54+153+35+10, 280, 180)];
    self.searchPinyinImageView.image=[UIImage imageNamed:@"Key-frame2.png"];
    [self.view addSubview:self.searchPinyinImageView];
    [self.searchPinyinImageView release];
    [self.searchPinyinImageView setUserInteractionEnabled:YES];
    count=0;
    for (int i=0; i<4; i++) {
        for (int j=0; j<7; j++) {
            count++;
            self.searchButton=[UIButton buttonWithType:UIButtonTypeCustom];
            self.searchButton.tag=count;
            self.searchButton.frame=CGRectMake(5+j*39, 5+i*46, 25, 25);
            [self.searchButton setTitle:[pinyinArray objectAtIndex:count-1] forState:(UIControlStateNormal)];
            [self.searchButton addTarget:self action:@selector(doPinyinSearch:) forControlEvents:(UIControlEventTouchUpInside)];
            [self.searchButton setTitleColor:[UIColor colorWithRed:130.0/255 green:32.0/255 blue:10.0/255 alpha:1] forState:UIControlStateNormal];
            [self.searchButton setBackgroundImage:[UIImage imageNamed:@"pressed1.png"] forState:UIControlStateHighlighted];
            [self.searchButton setBackgroundColor:[UIColor colorWithRed:1 green:0.1 blue:0.1 alpha:0.6]];
            [self.searchButton.layer setCornerRadius:12.5];
            [self.searchPinyinImageView addSubview:self.searchButton];
            if (count>=26) {
                break;
            }
        }
    }
    [self.searchBushouImageView setHidden:YES];
   
}
-(void)longPressAction:(UILongPressGestureRecognizer *)sender
{
    for (UIView *view in self.recentImageView.subviews)
    {
        [view removeFromSuperview];
    }
    UIAlertView *alert=nil;
    if ([Zuijin deleteAllZuijin])
        alert=[[UIAlertView alloc]initWithTitle:@"Success" message:@"历史记录删除成功！" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok", nil];
    else
        alert=[[UIAlertView alloc]initWithTitle:@"Failure" message:@"历史记录删除失败！" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok", nil];
    [alert show];
    [alert release];
}
-(void)viewWillAppear:(BOOL)animated
{
    for (UIView *view in self.recentImageView.subviews)
    {
        [view removeFromSuperview];
    }
    
    NSArray *arr=[Zuijin selectAllZuijin];
   // NSLog(@"%@",arr);
    for (int i=0; i<[arr count]; i++)
    {
        Zuijin *zuijin=[arr objectAtIndex:i];
        UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame=CGRectMake(5+35*i, 0, 30, 30);
        [btn setTitle:zuijin.hanzi forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(goDetail:) forControlEvents:UIControlEventTouchUpInside];
        [self.recentImageView addSubview:btn];
    }
}
-(void)goDetail:(UIButton *)sender
{
    DetailViewController *detail=[DetailViewController new];
    detail.title=sender.titleLabel.text;
    [self.navigationController pushViewController:detail animated:YES];
    [detail release];
}
-(void)doBushouSearch:(UIButton *)sender
{
    BushouSearchViewController *bu=[BushouSearchViewController new];
    bu.buttonTag=sender.tag;
    [self.navigationController pushViewController:bu animated:YES];
    [bu release];
}
-(void)doPinyinSearch:(UIButton *)sender
{
    PinyinSearchViewController *pin=[PinyinSearchViewController new];
    switch (sender.tag)
    {
        case 9:
        case 15:
        case 22:pin.buttonTag=sender.tag+1; break;
        case 21:pin.buttonTag=sender.tag+2; break;
            
        default:pin.buttonTag=sender.tag; break;
    }
    [self.navigationController pushViewController:pin animated:YES];
    [pin release];
}
-(void)doMore
{
    MoreViewController *more=[MoreViewController new];
    [self.navigationController pushViewController:more animated:YES];
    [more release];
}


-(void)keyButtonAction:(UIButton *)sender
{
    [self.inputText resignFirstResponder];
}
-(void)changeType:(UISegmentedControl *)sender
{
    if (sender.selectedSegmentIndex==0)
    {
        self.searchTypeLabel.text=@"按照拼音字母检索：";
        self.searchPinyinImageView.hidden=NO;
        self.searchBushouImageView.hidden=YES;
    }
    else
    {
        self.searchTypeLabel.text=@"按照部首笔画检索：";
        self.searchBushouImageView.hidden=NO;
        self.searchPinyinImageView.hidden=YES;
    }
}

-(void)dealloc
{
    [self.inputText release],self.inputText=nil;
    [self.tishiLabel release],self.tishiLabel=nil;
    [self.searchTypeLabel release],self.searchTypeLabel=nil;
    [self.recentButton release],self.recentButton=nil;
    [self.recentImageView release],self.recentImageView=nil;
    [self.searchButton release],self.searchButton=nil;
    [self.searchBushouImageView release],self.searchBushouImageView=nil;
    [self.searchPinyinImageView release],self.searchPinyinImageView=nil;
    [super dealloc];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSLog(@"%@",textField.text);
    [textField resignFirstResponder];
    NSPredicate *_preChinese=[NSPredicate predicateWithFormat:@"SELF MATCHES %@",Chinese];
    NSPredicate *_preWord=[NSPredicate predicateWithFormat:@"SELF MATCHES %@",Word];
    NSPredicate *_preNumber=[NSPredicate predicateWithFormat:@"SELF MATCHES %@",Number];
    if ([_preChinese evaluateWithObject:textField.text])
    {
        DetailViewController *detail=[DetailViewController new];
        detail.title=textField.text;
        [self.navigationController pushViewController:detail animated:YES];
        [detail release];
    }
    else if([_preWord evaluateWithObject:textField.text])
    {
        HanZiListViewController *list=[HanZiListViewController new];
        list.pinyin=textField.text;
        [self.navigationController pushViewController:list animated:YES];
        [list release];
    }
    else if([_preNumber evaluateWithObject:textField.text])
    {
        BushouSearchViewController *bushouSearch=[BushouSearchViewController new];
        bushouSearch.buttonTag=[textField.text intValue];
        [self.navigationController pushViewController:bushouSearch animated:YES];
        [bushouSearch release];
    }
    else
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Error" message:@"您输入的内容格式不正确，请重新输入：单个汉字、拼音或者1到17之间的数字！" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok", nil];
        [alert show];
        [alert release];
    }
    
    return YES;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
