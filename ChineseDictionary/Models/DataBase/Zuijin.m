//
//  Zuijin.m
//  Chinese Dictionary
//
//  Created by ibokan on 13-7-30.
//  Copyright (c) 2013年 ibokan. All rights reserved.
//

#import "Zuijin.h"
#import "MyFMDB.h"
@implementation Zuijin
-(id)initWithHanzi:(NSString *)hanzi andTime:(NSString *)time 
{
    if (self=[super init]) {
        self.hanzi=hanzi;
        self.time=time;
        
    }
    return self;
}
-(void)dealloc
{
    self.hanzi=nil;
    self.time=nil;
    [super dealloc];
}
+(NSMutableArray *)selectAllZuijin
{
    FMDatabase *db=[MyFMDB openDB];
    FMResultSet *set=[db executeQuery:@"select distinct hanzi from ol_zuijin order by id desc limit 8"];
    NSMutableArray *array=[[NSMutableArray alloc]init];
    while ([set next]) {
        NSDictionary *result=[set resultDictionary];
        NSString *hanzi=[result valueForKey:@"hanzi"];
        NSString *time=[result valueForKey:@"time"];
        Zuijin *zj=[[Zuijin alloc]initWithHanzi:hanzi andTime:time];
        [array addObject:zj];
        [zj release];
    }
    [db close];
    return [array autorelease];
}
+(BOOL)insertZuijinWithHanzi:(NSString *)hanzi andTime:(NSString *)time
{
    FMDatabase *db=[MyFMDB openDB];
    BOOL success=[db executeUpdate:@"insert into ol_zuijin (hanzi,time) values (?,?)",hanzi,time];
    [db close];
    return success;
}
+(BOOL)deleteAllZuijin
{
    FMDatabase *db=[MyFMDB openDB];
    BOOL success=[db executeUpdate:@"delete from ol_zuijin"];
    [db close];
    return success;
}

-(NSString *)description
{
    return self.hanzi;
}

@end
