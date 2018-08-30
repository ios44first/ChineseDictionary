//
//  Shoucang.m
//  Chinese Dictionary
//
//  Created by ibokan on 13-7-30.
//  Copyright (c) 2013年 ibokan. All rights reserved.
//

#import "Shoucang.h"
#import "MyFMDB.h"
@implementation Shoucang
-(id)initWithHanzi:(NSString *)hanzi andPinyin:(NSString *)pinyin andFanti:(NSString *)fanti andBushou:(NSString *)bushou andBishun:(NSString *)bishun andJiegou:(NSString *)jiegou andBsNum:(NSString *)bsNum andBihuaNum:(NSString *)bihuaNum andZhuyin:(NSString *)zhuyin andTime:(NSString *)time andID:(NSInteger)ID
{
    if (self=[super init]) {
        self.hanzi=hanzi;
        self.pinyin=pinyin;
        self.fanti=fanti;
        self.bushou=bushou;
        self.bishun=bishun;
        self.jiegou=jiegou;
        self.bsNum=bsNum;
        self.bihuaNum=bihuaNum;
        self.zhuyin=zhuyin;
        self.time=time;
        self.ID=ID;
    }
    return self;
}
-(void)dealloc
{
    self.hanzi=nil;
    self.pinyin=nil;
    self.fanti=nil;
    self.bushou=nil;
    self.bishun=nil;
    self.jiegou=nil;
    self.bsNum=nil;
    self.bihuaNum=nil;
    self.zhuyin=nil;
    self.time=nil;
    [super dealloc];
}
+(NSMutableArray *)selectAllShoucang
{
    FMDatabase *db=[MyFMDB openDB];
    FMResultSet *set=[db executeQuery:@"select * from ol_shouchang order by id desc"];
    NSMutableArray *array=[[NSMutableArray alloc]init];
    while ([set next]) {
        NSDictionary *result=[set resultDictionary];
        NSInteger ID=(NSInteger)[result valueForKey:@"id"];
        NSString *hanzi=[result valueForKey:@"hanzi"];
        NSString *pinyin=[result valueForKey:@"pinyin"];
        NSString *fanti=[result valueForKey:@"fanti"];
        NSString *bushou=[result valueForKey:@"bushou"];
        NSString *bishun=[result valueForKey:@"bishun"];
        NSString *jiegou=[result valueForKey:@"jiegou"];
        NSString *bsNum=[result valueForKey:@"bsNum"];
        NSString *bihuaNum=[result valueForKey:@"bihuaNum"];
        NSString *zhuyin=[result valueForKey:@"zhuyin"];
        NSString *time=[result valueForKey:@"time"];
        Shoucang *sc=[[Shoucang alloc]initWithHanzi:hanzi andPinyin:pinyin andFanti:fanti andBushou:bushou andBishun:bishun andJiegou:jiegou andBsNum:bsNum andBihuaNum:bihuaNum andZhuyin:zhuyin andTime:time andID:ID];
        [array addObject:sc];
        [sc release];
        
    }
     [db close];
    return [array autorelease];
}
+(NSMutableArray *)selectShoucangofTime:(NSString *)time
{
    FMDatabase *db=[MyFMDB openDB];
    FMResultSet *set=[db executeQuery:@"select * from ol_shouchang where time=? order by id desc",time];
    NSMutableArray *array=[[NSMutableArray alloc]init];
    while ([set next]) {
        NSDictionary *result=[set resultDictionary];
        NSInteger ID=(NSInteger)[result valueForKey:@"id"] ;
        NSString *hanzi=[result valueForKey:@"hanzi"];
        NSString *pinyin=[result valueForKey:@"pinyin"];
        NSString *fanti=[result valueForKey:@"fanti"];
        NSString *bushou=[result valueForKey:@"bushou"];
        NSString *bishun=[result valueForKey:@"bishun"];
        NSString *jiegou=[result valueForKey:@"jiegou"];
        NSString *bsNum=[result valueForKey:@"bsNum"];
        NSString *bihuaNum=[result valueForKey:@"bihuaNum"];
        NSString *zhuyin=[result valueForKey:@"zhuyin"];
        NSString *time=[result valueForKey:@"time"];
        Shoucang *sc=[[Shoucang alloc]initWithHanzi:hanzi andPinyin:pinyin andFanti:fanti andBushou:bushou andBishun:bishun andJiegou:jiegou andBsNum:bsNum andBihuaNum:bihuaNum andZhuyin:zhuyin andTime:time andID:ID];
        [array addObject:sc];
        [sc release];
        
    }
    [db close];
    return [array autorelease];
}
+(BOOL)insertShoucangWithHanzi:(NSString *)hanzi andPinyin:(NSString *)pinyin andFanti:(NSString *)fanti andBushou:(NSString *)bushou andBishun:(NSString *)bishun andJiegou:(NSString *)jiegou andBsNum:(NSString *)bsNum andBihuaNum:(NSString *)bihuaNum andZhuyin:(NSString *)zhuyin andTime:(NSString *)time
{
    FMDatabase *db=[MyFMDB openDB];
    BOOL success=[db executeUpdate:@"insert into ol_shouchang (hanzi,pinyin,fanti,bushou,bishun,jiegou,bsNum,bihuaNum,zhuyin,time) values (?,?,?,?,?,?,?,?,?,?)",hanzi,pinyin,fanti,bushou,bishun,jiegou,bsNum,bihuaNum,zhuyin,time];
    [db close];
    NSLog(@"hanzi===%@",hanzi);
    return success;
}
+(BOOL)deleteShoucangByID:(NSInteger)ID
{
    FMDatabase *db=[MyFMDB openDB];
    BOOL success=[db executeUpdate:@"delete from ol_shouchang where id=?",ID];
    [db close];
    return success;
}
+(BOOL)deleteShoucangByHanzi:(NSString *)hanzi

{
    FMDatabase *db=[MyFMDB openDB];
    BOOL success=[db executeUpdate:@"delete from ol_shouchang where hanzi=?",hanzi];
    [db close];
    return success;
}
+(NSMutableArray *)selectTimeShoucang
{
    FMDatabase *db=[MyFMDB openDB];
    FMResultSet *set=[db executeQuery:@"select distinct time from ol_shouchang order by id desc"];
    NSMutableArray *array=[[NSMutableArray alloc]init];
    while ([set next]) {
        NSDictionary *result=[set resultDictionary];
        NSString *time=[result valueForKey:@"time"];

        [array addObject:time];
    }
    [db close];
    return  [array autorelease];
}
@end
