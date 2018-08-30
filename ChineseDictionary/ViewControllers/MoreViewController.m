//
//  MoreViewController.m
//  ChineseDictionary
//
//  Created by BK01 on 13-10-16.
//  Copyright (c) 2013年 com.bokan. All rights reserved.
//

#import "MoreViewController.h"

@interface MoreViewController ()

@end

@implementation MoreViewController

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
    self.tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 44, 320, self.view.frame.size.height-44) style:UITableViewStyleGrouped];
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

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section)
    {
        case 0:return 3;break;
        case 1:return 2;break;
        case 2:return 1;break;
        default:return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell)
    {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    }
    if (indexPath.section==0)
    {
        switch (indexPath.row)
        {
            case 0:
                cell.imageView.image=[UIImage imageNamed:@"065.png"];
                cell.textLabel.text=@"我 的 收 藏";
                break;
            case 1:
                cell.imageView.image=[UIImage imageNamed:@"063.png"];
                cell.textLabel.text=@"分 享";
                break;
            case 2:
                cell.imageView.image=[UIImage imageNamed:@"068.png"];
                cell.textLabel.text=@"意 见 反 馈";
                break;
        }
    }
    else if(indexPath.section==1)
    {
        if (indexPath.row==0)
        {
            cell.imageView.image=[UIImage imageNamed:@"027.png"];
            cell.textLabel.text=@"应 用 打 分";
        }
        else
        {
            cell.imageView.image=[UIImage imageNamed:@"042.png"];
            cell.textLabel.text=@"精 品 应 用";
        }
    }
    else
    {
        cell.imageView.image=[UIImage imageNamed:@"046.png"];
        cell.textLabel.text=@"关 于 我 们";
    }
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0)
    {
        if (indexPath.row==0)
        {
            CollectionViewController *collection=[CollectionViewController new];
            [self.navigationController pushViewController:collection animated:YES];
            [collection release];
        }
        if (indexPath.row==1)
        {
            NSString *imagePath = [[NSBundle mainBundle] pathForResource:@"icon"  ofType:@"png"];
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
        if (indexPath.row==2)
        {
            FanKuiViewController *fankui=[FanKuiViewController new];
            [self.navigationController pushViewController:fankui animated:YES];
        }
    }
    
    if (indexPath.section==1)
    {
        if (indexPath.row==0)
        {
            FanKuiViewController *fankui=[FanKuiViewController new];
            [self.navigationController pushViewController:fankui animated:YES];
        }
        if (indexPath.row==1)
        {
            MyAppViewController *myApp=[[MyAppViewController alloc]init];
            [self.navigationController pushViewController:myApp animated:YES];
        }
    }
    
    if (indexPath.section==2)
    {
        JianjieViewController *jianjie=[[JianjieViewController alloc]init];
        [self.navigationController pushViewController:jianjie animated:YES];
    }
}



@end
