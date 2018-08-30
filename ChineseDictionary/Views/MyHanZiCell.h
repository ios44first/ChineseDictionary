//
//  MyHanZiCell.h
//  ChineseDictionary
//
//  Created by BK01 on 13-10-23.
//  Copyright (c) 2013年 com.bokan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IFlySynthesizerViewManager.h"

@interface MyHanZiCell : UITableViewCell

@property(nonatomic,retain)UILabel *hanZi;
@property(nonatomic,retain)UILabel *pinYin;
@property(nonatomic,retain)UILabel *buShou;
@property(nonatomic,retain)UILabel *biHua;
@property(nonatomic,retain)NSString *soundURL;


@end
