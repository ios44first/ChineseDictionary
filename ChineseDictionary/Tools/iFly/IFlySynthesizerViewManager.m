//
//  IFlySynthesizerViewManager.m
//  ChineseDictionary
//
//  Created by BK01 on 13-10-31.
//  Copyright (c) 2013年 com.bokan. All rights reserved.
//

#import "IFlySynthesizerViewManager.h"

@implementation IFlySynthesizerViewManager


+(IFlySynthesizerView *)getIFlySynthesizerView
{
    static IFlySynthesizerView *synthesizer=nil;
    if (synthesizer==nil)
    {
        NSString *params=[NSString stringWithFormat:@"appid=5269fbf5"];
        synthesizer = [[IFlySynthesizerView alloc]initWithOrigin:CGPointMake(25, 50) params:params];
        [synthesizer setParameter:@"speed" value:@"1"];
        [synthesizer setParameter:@"volume" value:@"100"];
        [synthesizer setParameter:@"voice_name" value:@"xiaoyu"];
        [synthesizer setParameter:@"sample_rate" value:@"16000"];

    }
    return synthesizer;
}

@end
