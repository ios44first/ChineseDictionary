//
//  MyFMDB.h
//  Chinese Dictionary
//
//  Created by ibokan on 13-7-30.
//  Copyright (c) 2013年 ibokan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"
#import "FMDatabaseAdditions.h"
@interface MyFMDB : NSObject

+(FMDatabase *)openDB;

@end
