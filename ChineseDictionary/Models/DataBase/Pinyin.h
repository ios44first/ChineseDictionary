//
//  Pinyin.h
//  Chinese Dictionary
//
//  Created by ibokan on 13-7-30.
//  Copyright (c) 2013年 ibokan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Pinyin : NSObject

@property(assign)NSInteger ID;
@property(retain,nonatomic)NSString *pinyin,*type;


-(id)initWithPinyin:(NSString *)pinyin andType:(NSString *)type andID:(NSInteger)ID;

+(NSMutableArray *)selectPinyinByType:(NSString *)type;

+(BOOL)selectPinyinByPinyin:(NSString *)pinyin;

@end
