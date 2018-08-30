//
//  Zuijin.h
//  Chinese Dictionary
//
//  Created by ibokan on 13-7-30.
//  Copyright (c) 2013年 ibokan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Zuijin : NSObject


@property(retain,nonatomic)NSString *hanzi,*time;

-(id)initWithHanzi:(NSString *)hanzi andTime:(NSString *)time ;

+(NSMutableArray *)selectAllZuijin;

+(BOOL)insertZuijinWithHanzi:(NSString *)hanzi andTime:(NSString *)time;

+(BOOL)deleteAllZuijin;

@end
