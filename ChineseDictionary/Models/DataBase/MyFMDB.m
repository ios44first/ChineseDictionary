//
//  MyFMDB.m
//  Chinese Dictionary
//
//  Created by ibokan on 13-7-30.
//  Copyright (c) 2013年 ibokan. All rights reserved.
//

#import "MyFMDB.h"

@implementation MyFMDB

static FMDatabase * db=nil;

#pragma mark 创建FMDB单例
+(FMDatabase*)openDB
{

    
    
    NSString *docPath=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *sqlPath=[docPath stringByAppendingPathComponent:@"ol_bushou.sqlite"];
    
    NSString *originPath=[[NSBundle mainBundle] pathForResource:@"ol_bushou" ofType:@"sqlite"];
//    NSLog(@"fff=%@",sqlPath);
    
    NSFileManager *fm=[NSFileManager defaultManager];
    if ([fm fileExistsAtPath:sqlPath]==NO) {
        
        NSError *err = nil;
        if([fm copyItemAtPath:originPath toPath:sqlPath error:&err] == NO)//如果拷贝失败
        {
            NSLog(@"open database error %@",[err localizedDescription]);//拷贝失败打印相关错误信息
            return nil;
        }
        
    }
    
    
    
    db=[[FMDatabase alloc]initWithPath:sqlPath];
    [db open];
//    if (![db open]) {
//        NSLog(@"数据库打开失败！");
//    }
//    else NSLog(@"数据库打开成功！%@",db);
    return db;
    
}
@end
