//
//  IFlyRecognizerViewManager.m
//  ChineseDictionary
//
//  Created by Arise on 13-11-3.
//  Copyright (c) 2013年 com.bokan. All rights reserved.
//

#import "IFlyRecognizerViewManager.h"

@implementation IFlyRecognizerViewManager

+(IFlyRecognizerView *)getIFlyRecognizerView
{
    static IFlyRecognizerView * recognizer=nil;
    if (recognizer==nil)
    {
        NSString *params=[NSString stringWithFormat:@"appid=5269fbf5"];
        recognizer=[[IFlyRecognizerView alloc]initWithOrigin:CGPointMake(25, 50) initParam:params];
        [recognizer setParameter:@"domain" value:@"iat"];
    }
    return recognizer;
}

@end
