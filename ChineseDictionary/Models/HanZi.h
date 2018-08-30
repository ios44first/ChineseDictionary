//
//  HanZi.h
//  ChineseDictionary
//
//  Created by BK01 on 13-10-24.
//  Copyright (c) 2013年 com.bokan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HanZi : NSObject

@property(nonatomic,retain)NSString *wenzi;
@property(nonatomic,retain)NSString *pinyin;
@property(nonatomic,retain)NSString *bushou;
@property(nonatomic,retain)NSString *bihua;
@property(nonatomic,retain)NSString *soundURL;

@property(nonatomic,retain)NSString *zhuyin;
@property(nonatomic,retain)NSString *fanti;
@property(nonatomic,retain)NSString *jiegou;
@property(nonatomic,retain)NSString *bushoubihua;
@property(nonatomic,retain)NSString *bishun;

@property(nonatomic,retain)NSString *baseMessage;
@property(nonatomic,retain)NSString *detail;
@property(nonatomic,retain)NSString *ciyu;
@property(nonatomic,retain)NSString *english;



@end
