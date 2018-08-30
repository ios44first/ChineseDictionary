//
//  RootViewController.m
//  ChineseDictionary
//
//  Created by BK01 on 13-10-16.
//  Copyright (c) 2013年 com.bokan. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

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
	self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"startup-interface.png"]];
    
    pro=[[KOAProgressBar alloc]initWithFrame:CGRectMake(50, 350, 220, 15)];
    pro.maxValue=1;
    pro.minValue=0;
	[pro setDisplayedWhenStopped:YES];
	//[pro setAnimationDuration:1.0];
	[pro startAnimation:self];
    [self.view addSubview:pro];
    
    showPercent=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 80, 30)];
    showPercent.center=CGPointMake(160, 320);
    showPercent.text=@"0%";
    showPercent.backgroundColor=[UIColor clearColor];
    showPercent.textColor=[UIColor whiteColor];
    showPercent.font=[UIFont fontWithName:@"CourierNewPS-BoldItalicMT" size:20];
    showPercent.textAlignment=NSTextAlignmentCenter;
    [self.view addSubview:showPercent];
    
    timer=[NSTimer scheduledTimerWithTimeInterval:0.02 target:self selector:@selector(loadTime) userInfo:nil repeats:YES];
    
    
}
-(void)loadTime
{
    pro.realProgress += 0.01;
    showPercent.text = [NSString stringWithFormat:@"%d%%",(int)(pro.realProgress*100)];
    if (pro.progress >= 1)
    {
        [timer invalidate];
        MainViewController *mainView=[MainViewController new];
        UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:mainView];
        nav.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
        [self presentViewController:nav animated:YES completion:nil];
        [mainView release];
        [nav release];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
