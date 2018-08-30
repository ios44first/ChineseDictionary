//
//  Bushou.m
//  Chinese Dictionary
//
//  Created by ibokan on 13-7-30.
//  Copyright (c) 2013年 ibokan. All rights reserved.
//

#import "Bushou.h"
#import "MyFMDB.h"
@implementation Bushou
-(id)initWithTitle:(NSString *)title andBihua:(NSInteger)bihua andID:(NSInteger)ID
{
    if (self=[super init]) {
        self.title=title;
        self.bihua=bihua;
        self.ID=ID;
    }
    return self;
}

-(void)dealloc
{
    self.title=nil;
    [super dealloc];
}

+(NSMutableArray *)selectBuhsouByBihua:(NSString *)bihua
{
    FMDatabase *db=[MyFMDB openDB];
    FMResultSet *set=[db executeQuery:@"select * from ol_bushou where bihua=? order by title",bihua];
    NSMutableArray *array=[[NSMutableArray alloc]init];
    while ([set next]) {
        NSDictionary *result=[set resultDictionary];
        NSInteger ID=[[result valueForKey:@"id"] intValue];
        NSInteger bihua=[[result valueForKey:@"bihua"] intValue];
        NSString *title=[result valueForKey:@"title"];
        Bushou *bs=[[Bushou alloc]initWithTitle:title andBihua:bihua andID:ID];
        [array addObject:bs];
        [bs release];
    }
    [db close];
    return [array autorelease];
}
@end
