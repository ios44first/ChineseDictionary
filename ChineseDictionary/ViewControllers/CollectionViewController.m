//
//  CollectionViewController.m
//  ChineseDictionary
//
//  Created by BK01 on 13-10-29.
//  Copyright (c) 2013年 com.bokan. All rights reserved.
//

#import "CollectionViewController.h"

@interface CollectionViewController ()

@end

@implementation CollectionViewController

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
    self.tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 44, 320, self.view.frame.size.height-44) style:UITableViewStylePlain];
    self.tableView.dataSource=self;
    self.tableView.delegate=self;
    self.tableView.backgroundColor=[UIColor clearColor];
    [self.view addSubview:self.tableView];
    self.tableView.scrollEnabled=NO;
    
    //自定义导航栏
    MyNavigationBar *myNavi=[[MyNavigationBar alloc]initWithview:self.view];
    self.navigationController.navigationBar.hidden=YES;
    //导航栏的按钮
    UIButton *back=[UIButton buttonWithType:UIButtonTypeCustom];
    back.frame=CGRectMake(0, 0, 40, 44);
    [back addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
    UIImageView *moreView=[[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 20, 20)];
    moreView.image=[UIImage imageNamed:@"return.png"];
    [myNavi creatNavigationBarwithTitle:@"更  多" andLeftButton:back andLeftImage:moreView andRightButton:nil andRightImage:nil andView:self.view];
    [myNavi release];
    [moreView release];
    
    self.array=[Shoucang selectAllShoucang];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell)
    {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    }
    Shoucang *shoucang=[self.array objectAtIndex:indexPath.row];
    cell.textLabel.text=shoucang.hanzi;
    cell.detailTextLabel.text=shoucang.pinyin;
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Shoucang *shc=[self.array objectAtIndex:indexPath.row];
    DetailViewController *detail=[DetailViewController new];
    detail.title=shc.hanzi;
    [self.navigationController pushViewController:detail animated:YES];
    [detail release];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.array count];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle==UITableViewCellEditingStyleDelete)
    {
        Shoucang *shou=[self.array objectAtIndex:indexPath.row];
        [Shoucang deleteShoucangByHanzi:shou.hanzi];
        [self.array removeObjectAtIndex:indexPath.row];
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:(UITableViewRowAnimationFade)];
    }
}



-(void)back:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
