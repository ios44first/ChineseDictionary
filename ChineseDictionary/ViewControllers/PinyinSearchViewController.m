//
//  PinyinSearchViewController.m
//  ChineseDictionary
//
//  Created by BK01 on 13-10-16.
//  Copyright (c) 2013年 com.bokan. All rights reserved.
//

#import "PinyinSearchViewController.h"

@interface PinyinSearchViewController ()

@end

@implementation PinyinSearchViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
       //NSLog(@"%s",__FUNCTION__);
    pinyinArray=[@[@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z"] retain];
        NSMutableDictionary *mDic=[[NSMutableDictionary alloc]init];
        for (int i=0; i<26; i++)
        {
            NSString *key=[[pinyinArray objectAtIndex:i] lowercaseString];
            [mDic setObject:[Pinyin selectPinyinByType:key] forKey:key];
        }
        self.resultDic=mDic;
    }
    return self;
}
-(void)viewWillAppear:(BOOL)animated
{
    //NSLog(@"%s",__FUNCTION__);
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"beijing.png"]];
	self.tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 44, 320, self.view.frame.size.height-44) style:UITableViewStylePlain];
    self.tableView.dataSource=self;
    self.tableView.delegate=self;
    self.tableView.backgroundColor=[UIColor clearColor];
    [self.view addSubview:self.tableView];
    
    //自定义导航栏
    MyNavigationBar *myNavi=[[MyNavigationBar alloc]initWithview:self.view];
    self.navigationController.navigationBar.hidden=YES;
    //导航栏的按钮
    UIButton *back=[UIButton buttonWithType:UIButtonTypeCustom];
    back.frame=CGRectMake(0, 0, 40, 44);
    [back addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
    UIImageView *moreView=[[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 20, 20)];
    moreView.image=[UIImage imageNamed:@"return.png"];
    [myNavi creatNavigationBarwithTitle:@"拼音检索" andLeftButton:back andLeftImage:moreView andRightButton:nil andRightImage:nil andView:self.view];
    [myNavi release];
    [moreView release];
    
    [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:self.buttonTag-1] atScrollPosition:UITableViewScrollPositionTop animated:YES];
    
    //NSLog(@"%s",__FUNCTION__);
}
-(void)back:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //NSLog(@"%s",__FUNCTION__);
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell)
    {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    NSString *key=[[pinyinArray objectAtIndex:indexPath.section] lowercaseString];
    self.array=[self.resultDic objectForKey:key];
    Pinyin *pin=[self.array objectAtIndex:indexPath.row];
    cell.textLabel.text=pin.pinyin;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    HanZiListViewController *hanzi=[[HanZiListViewController alloc]init];
    UITableViewCell *cell=[self.tableView cellForRowAtIndexPath:indexPath];
    hanzi.pinyin=cell.textLabel.text;
    [self.navigationController pushViewController:hanzi animated:YES];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    //NSLog(@"%s",__FUNCTION__);
    return 26;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //NSLog(@"%s",__FUNCTION__);
   
    NSString *key=[[pinyinArray objectAtIndex:section] lowercaseString];
    return [[self.resultDic objectForKey:key] count];
    //return 10;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    //NSLog(@"%s",__FUNCTION__);
    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 40)];
    view.backgroundColor=[UIColor colorWithWhite:1 alpha:0.7];
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(20, 0, 320, 40)];
    label.text=[pinyinArray objectAtIndex:section];
    label.backgroundColor=[UIColor clearColor];
    label.font=[UIFont systemFontOfSize:20];
    [view addSubview:label];
    [label release];
    return [view autorelease];
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    //NSLog(@"%s",__FUNCTION__);
    return 40;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //NSLog(@"%s",__FUNCTION__);
    return 40;
}
-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return pinyinArray;
}

- (void)didReceiveMemoryWarning
{
    NSLog(@"%s",__FUNCTION__);
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
