//
//  Shoucang.h
//  Chinese Dictionary
//
//  Created by ibokan on 13-7-30.
//  Copyright (c) 2013年 ibokan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Shoucang : NSObject

@property(assign)NSInteger ID;
@property(retain,nonatomic)NSString * hanzi, *pinyin,*fanti,*bushou,*bishun,*jiegou,*bsNum,*bihuaNum,*zhuyin,*time;

-(id)initWithHanzi:(NSString *)hanzi andPinyin:(NSString *)pinyin andFanti:(NSString *)fanti andBushou:(NSString *)bushou andBishun:(NSString *)bishun andJiegou:(NSString *)jiegou andBsNum:(NSString *)bsNum andBihuaNum:(NSString *)bihuaNum andZhuyin:(NSString *)zhuyin andTime:(NSString *)time andID:(NSInteger)ID;

+(NSMutableArray *)selectAllShoucang;

//增
+(BOOL)insertShoucangWithHanzi:(NSString *)hanzi andPinyin:(NSString *)pinyin andFanti:(NSString *)fanti andBushou:(NSString *)bushou andBishun:(NSString *)bishun andJiegou:(NSString *)jiegou andBsNum:(NSString *)bsNum andBihuaNum:(NSString *)bihuaNum andZhuyin:(NSString *)zhuyin andTime:(NSString *)time;
//删
+(BOOL)deleteShoucangByID:(NSInteger)ID;
+(BOOL)deleteShoucangByHanzi:(NSString *)hanzi;
+(NSMutableArray *)selectTimeShoucang;
+(NSMutableArray *)selectShoucangofTime:(NSString *)time;
@end
