//
//  BushouSearchViewController.m
//  ChineseDictionary
//
//  Created by BK01 on 13-10-16.
//  Copyright (c) 2013年 com.bokan. All rights reserved.
//

#import "BushouSearchViewController.h"

@interface BushouSearchViewController ()

@end

@implementation BushouSearchViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        shuziArray=[@[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17"] retain];
        NSMutableDictionary *mDic=[[NSMutableDictionary alloc]init];
        for (int i=0; i<17; i++)
        {
            NSString *key=[[shuziArray objectAtIndex:i] lowercaseString];
            [mDic setObject:[Bushou selectBuhsouByBihua:key] forKey:key];
        }
        self.resultDic=mDic;
    }
    return self;
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
    [myNavi creatNavigationBarwithTitle:@"部首检索" andLeftButton:back andLeftImage:moreView andRightButton:nil andRightImage:nil andView:self.view];
    [myNavi release];
    [moreView release];
    
    [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:self.buttonTag-1] atScrollPosition:(UITableViewScrollPositionTop) animated:YES];
}
-(void)back:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell)
    {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    NSString *key=[shuziArray objectAtIndex:indexPath.section];
    Bushou *bu=[[self.resultDic objectForKey:key] objectAtIndex:indexPath.row];
    cell.textLabel.text=bu.title;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    HanZiListViewController *hanzi=[[HanZiListViewController alloc]init];
    NSString *key=[shuziArray objectAtIndex:indexPath.section];
    Bushou *bu=[[self.resultDic objectForKey:key] objectAtIndex:indexPath.row];
    hanzi.bushouID=bu.ID;
    hanzi.title=bu.title;
    [self.navigationController pushViewController:hanzi animated:YES];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 17;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSString *key=[shuziArray objectAtIndex:section];
    return [[self.resultDic objectForKey:key]count];
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 40)];
    view.backgroundColor=[UIColor colorWithWhite:1 alpha:0.5];
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(20, 0, 320, 40)];
    label.text=[NSString stringWithFormat:@"%d",section+1];
    label.backgroundColor=[UIColor clearColor];
    label.font=[UIFont systemFontOfSize:25];
    label.textColor=[UIColor redColor];
    [view addSubview:label];
    [label release];
    return [view autorelease];
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}
-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return shuziArray;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
