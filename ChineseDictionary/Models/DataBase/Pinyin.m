//
//  Pinyin.m
//  Chinese Dictionary
//
//  Created by ibokan on 13-7-30.
//  Copyright (c) 2013年 ibokan. All rights reserved.
//

#import "Pinyin.h"
#import "MyFMDB.h"
@implementation Pinyin
-(id)initWithPinyin:(NSString *)pinyin andType:(NSString *)type andID:(NSInteger)ID
{
    if (self=[super init]) {
        self.ID=ID;
        self.pinyin=pinyin;
        self.type=type;
    }
    return self;
}
-(void)dealloc
{
    self.pinyin=nil;
    self.type=nil;
    [super dealloc];
}
+(NSMutableArray *)selectPinyinByType:(NSString *)type
{
    FMDatabase *db=[MyFMDB openDB];
    FMResultSet *set=[db executeQuery:@"select * from ol_pinyins where type=? order by pinyin",type];
    NSMutableArray *array=[[NSMutableArray alloc]init];
    
    while ([set next]) {
        NSDictionary *result=[set resultDictionary];
        NSInteger ID=[[result valueForKey:@"id"] intValue];
        NSString *pinyin=[result valueForKey:@"pinyin"];
        NSString *type=[result valueForKey:@"type"];
        Pinyin *py=[[Pinyin alloc]initWithPinyin:pinyin andType:type andID:ID];
        [array addObject:py];
        [py release];
    }
    [db close];
    return [array autorelease];
}
+(BOOL)selectPinyinByPinyin:(NSString *)pinyin
{
    FMDatabase *db=[MyFMDB openDB];
    FMResultSet *set=[db executeQuery:@"select *from ol_pinyins where pinyin = ?  and id>26 ",pinyin];
    NSMutableArray *array=[[NSMutableArray alloc]init];
    
    while ([set next]) {
        NSDictionary *result=[set resultDictionary];
        NSInteger ID=(NSInteger)[result valueForKey:@"id"];
        NSString *pinyin=[result valueForKey:@"pinyin"];
        NSString *type=[result valueForKey:@"type"];
        Pinyin *py=[[Pinyin alloc]initWithPinyin:pinyin andType:type andID:ID];
        [array addObject:py];
        [py release];
    }
    [db close];
    if ([array count]==0) {
        return NO;
    }else{
        return YES;
    }
}
@end
