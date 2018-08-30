//
//  Bushou.h
//  Chinese Dictionary
//
//  Created by ibokan on 13-7-30.
//  Copyright (c) 2013年 ibokan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Bushou : NSObject

@property(assign)NSInteger ID,bihua;
@property(retain,nonatomic)NSString *title;

-(id)initWithTitle:(NSString *)title andBihua:(NSInteger)bihua andID:(NSInteger)ID;

+(NSMutableArray *)selectBuhsouByBihua:(NSString *)bihua;

@end
