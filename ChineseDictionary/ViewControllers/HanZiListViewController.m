//
//  HanZiListViewController.m
//  ChineseDictionary
//
//  Created by BK01 on 13-10-23.
//  Copyright (c) 2013年 com.bokan. All rights reserved.
//

#import "HanZiListViewController.h"

@interface HanZiListViewController ()

@end

@implementation HanZiListViewController

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
    
    if (_refreshHeaderView == nil) {
        // 初始化下拉刷新的视图
        EGORefreshTableHeaderView *view = [[EGORefreshTableHeaderView alloc] initWithFrame:CGRectMake(0.0f, 0.0f-self.tableView.bounds.size.height, 320.0f, self.tableView.bounds.size.height)];
        view.delegate = self;
        [self.tableView addSubview:view];
        _refreshHeaderView = view;
        //[view release];
    }
    //  update the last update date
    [_refreshHeaderView refreshLastUpdatedDate];
    currentPage=1;
    
    [self.tableView removeFromSuperview];
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
    
    NSString *str=nil;
    if (self.pinyin!=nil)
    {
        str=self.pinyin;
        [self loadData:1];
        //GET请求方式，访问请求网络资源  同步
//        NSString *urlString=[NSString stringWithFormat:@"http://www.chazidian.com/service/pinyin/%@/0/10",self.pinyin];
//        NSURL *url=[NSURL URLWithString:urlString];
//        NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:60];
//        [request setHTTPMethod:@"GET"];
//        NSData *receiveData=[NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
//        NSDictionary *dic=[NSJSONSerialization JSONObjectWithData:receiveData options:NSJSONReadingMutableContainers error:nil];
//        NSLog(@"%@",dic);
    }
    else
    {
        str=self.title;
        [self loadData:2];
    }
    [myNavi creatNavigationBarwithTitle:str andLeftButton:back andLeftImage:moreView andRightButton:nil andRightImage:nil andView:self.view];
    [myNavi release];
    [moreView release];

    self.array=[[NSMutableArray alloc]init];//存放解析结果的数组
}
-(void)loadData:(int)type
{
    NSString *urlString=nil;
    if (type==1)
        urlString=[[NSString stringWithFormat:@"http://www.chazidian.com/service/pinyin/%@/%d/20",self.pinyin,currentPage] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    else
        urlString=[[NSString stringWithFormat:@"http://www.chazidian.com/service/bushou/%d/%d/20",self.bushouID,currentPage] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    currentPage++;
    NSURL *url=[NSURL URLWithString:urlString];
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    [NSURLConnection connectionWithRequest:request delegate:self];
}
#pragma mark-- NSURLConnectionDelegate 代理方法
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    activityView.hidden=NO;
    self.mData=[[NSMutableData alloc]init];
}
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [self.mData appendData:data];
}
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    //NSString *resultString=[[NSString alloc]initWithData:self.mData encoding:(NSUTF8StringEncoding)];
    //NSLog(@"%@",resultString);
    if (isHeader)
        [self.array removeAllObjects];
    NSDictionary *dic=[NSJSONSerialization JSONObjectWithData:self.mData options:NSJSONReadingMutableContainers error:nil];
    NSDictionary *data=[dic valueForKey:@"data"];
    if (![data isEqual:@""])
    {
        NSArray *words=[data valueForKey:@"words"];
        for (NSDictionary *hanziDic in words)
        {
            HanZi *han=[[HanZi alloc]init];
            han.wenzi=[hanziDic valueForKey:@"simp"];
            han.bushou=[hanziDic valueForKey:@"bushou"];
            han.bihua=[hanziDic valueForKey:@"num"];
            NSDictionary *yinDic=[hanziDic valueForKey:@"yin"];
            han.pinyin=[yinDic valueForKey:@"pinyin"];
            han.zhuyin=[yinDic valueForKey:@"zhuyin"];
            han.soundURL=[hanziDic valueForKey:@"sound"];
            [self.array addObject:han];
        }
        NSDictionary *pageDic=[data valueForKey:@"page"];
        maxPage=[[pageDic valueForKey:@"pagenum"] intValue];
         NSLog(@"%@",self.array);
        //刷新 tableView
        [self.tableView reloadData];
        
        activityView.hidden=YES;
        if(isHeader)
            [self.tableView setContentOffset:CGPointMake(0, 0) animated:YES];
    }
    else
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Error" message:@"未找到您要查找的信息，请核实后重新输入！" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok", nil];
        [alert show];
        [alert release];
    }
    
}
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"%@",error);
}

#pragma mark-- tableView 代理方法
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CELL=@"cell";
    MyHanZiCell *cell=[self.tableView dequeueReusableCellWithIdentifier:CELL];
    if (!cell)
    {
           cell=[[MyHanZiCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CELL];
    }

       HanZi *han=[self.array objectAtIndex:indexPath.row];
       cell.hanZi.text=han.wenzi;
       cell.pinYin.text=[NSString stringWithFormat:@"拼音：%@",han.pinyin];
       cell.buShou.text=[NSString stringWithFormat:@"部首：%@",han.bushou];
       cell.biHua.text=[NSString stringWithFormat:@"笔画：%@",han.bihua];
       cell.soundURL=han.soundURL;

    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailViewController *detail=[DetailViewController new];
    HanZi *han=[self.array objectAtIndex:indexPath.row];
    detail.title=han.wenzi;
    detail.pinyin=han.pinyin;
    detail.zhuyin=han.zhuyin;
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.navigationController pushViewController:detail animated:YES];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.array count];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


-(void)back:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma mark -
#pragma mark EGORefreshTableHeaderDelegate Methods
-(void) createHeader{
    if (_refreshHeaderView && [_refreshHeaderView superview]) {
        _refreshHeaderView.frame = CGRectMake(0.0f,0.0f-70,320,70);
    }else {
        _refreshHeaderView = [[EGORefreshTableHeaderView alloc] initWithFrame:CGRectMake(0.0f,0.0f-70,320,70)];
        _refreshHeaderView.delegate = self;
        [self.tableView addSubview:_refreshHeaderView];
    }
    if (_refreshHeaderView) {
        [_refreshHeaderView refreshLastUpdatedDate];
    }
}
-(void) createFooter{
    CGFloat height=MAX(self.tableView.contentSize.height, self.tableView.frame.size.height);
    if (_refreshFooterView && [_refreshFooterView superview]) {
        _refreshFooterView.frame = CGRectMake(0.0f,height,320,70);
    }else {
        _refreshFooterView = [[EGORefreshTableFooterView alloc] initWithFrame:CGRectMake(0.0f,height,320,70)];
        _refreshFooterView.delegate = self;
        [self.tableView addSubview:_refreshFooterView];
    }
    if (_refreshFooterView) {
        [_refreshFooterView refreshLastUpdatedDate];
    }
}
-(void)callHeaderMethod
{
    if (currentPage<=maxPage)
    {
        //[self.array removeAllObjects];
        if (self.pinyin!=nil)
            [self loadData:1];
        else
            [self loadData:2];
        activityView.hidden=NO;
    }
    else
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"温馨提示" message:@"已经加载到组后一页了！" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok", nil];
        [alert show];
        [alert release];
    }
    //上拉完成
    _reloading = NO;
    [self.tableView setContentOffset:CGPointMake(0, 0) animated:YES];
    [_refreshHeaderView egoRefreshScrollViewDataSourceDidFinishedLoading:self.tableView];
    [_refreshHeaderView removeFromSuperview];
}
-(void)callFooterMethod
{
    if (currentPage<=maxPage)
    {
        if (self.pinyin!=nil)
            [self loadData:1];
        else
            [self loadData:2];
        activityView.hidden=NO;
    }
    else
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"温馨提示" message:@"已经加载到组后一页了！" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok", nil];
        [alert show];
        [alert release];
    }
    _reloading = NO;
    [_refreshFooterView egoRefreshScrollViewDataSourceDidFinishedLoading:self.tableView];
    [_refreshFooterView removeFromSuperview];
}
-(void) beginToReloadData:(EGORefreshPos)aRefreshPos{
    _reloading = YES;
    if(aRefreshPos == EGORefreshHeader){
        // pull up to load more data
        isHeader=YES;
        [self callHeaderMethod];
        //[self performSelector:@selector(callHeaderMethod) withObject:nil afterDelay:2];
    }
    if(aRefreshPos == EGORefreshFooter){
        // pull up to load more data
        [self callFooterMethod];
        //[self performSelector:@selector(callFooterMethod) withObject:nil afterDelay:2];
    }
}
//当滚动视图时调用
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [self createHeader];
	if (_refreshHeaderView) {
        [_refreshHeaderView egoRefreshScrollViewDidScroll:scrollView];
    }
    [self createFooter];
	if (_refreshFooterView) {
        [_refreshFooterView egoRefreshScrollViewDidScroll:scrollView];
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
	if (_refreshHeaderView) {
        [_refreshHeaderView egoRefreshScrollViewDidEndDragging:scrollView];
    }
    if (_refreshFooterView) {
        [_refreshFooterView egoRefreshScrollViewDidEndDragging:scrollView];
    }
}
- (void)egoRefreshTableDidTriggerRefresh:(EGORefreshPos)aRefreshPos{
	//触发刷新
	[self beginToReloadData:aRefreshPos];
	
}
- (BOOL)egoRefreshTableDataSourceIsLoading:(UIView*)view{
	return _reloading; // should return if data source model is reloading
	
}
// if we don't realize this method, it won't display the refresh timestamp
- (NSDate*)egoRefreshTableDataSourceLastUpdated:(UIView*)view{
	
	return [NSDate date]; // should return date data source was last changed
	
}


@end
