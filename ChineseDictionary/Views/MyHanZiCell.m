//
//  MyHanZiCell.m
//  ChineseDictionary
//
//  Created by BK01 on 13-10-23.
//  Copyright (c) 2013年 com.bokan. All rights reserved.
//

#import "MyHanZiCell.h"

@implementation MyHanZiCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        UIImageView *imgView=[[UIImageView alloc]initWithFrame:CGRectMake(25, 15, 40, 40)];
        imgView.image=[UIImage imageNamed:@"banmizige@2x.png"];
        [self.contentView addSubview:imgView];
        
        self.hanZi=[[UILabel alloc]initWithFrame:CGRectMake(25, 15, 40, 40)];
        self.hanZi.font=[UIFont fontWithName:@"Tianshi-Diaoyu" size:33];
        self.hanZi.backgroundColor=[UIColor clearColor];
        self.hanZi.textAlignment=NSTextAlignmentCenter;
        [self.contentView addSubview:self.hanZi];
        
        self.pinYin=[[UILabel alloc]initWithFrame:CGRectMake(80, 15, 150, 20)];
        self.pinYin.backgroundColor=[UIColor clearColor];
        [self.contentView addSubview:self.pinYin];
        
        self.buShou=[[UILabel alloc]initWithFrame:CGRectMake(80, 45, 100, 20)];
        self.buShou.backgroundColor=[UIColor clearColor];
        [self.contentView addSubview:self.buShou];
        
        self.biHua=[[UILabel alloc]initWithFrame:CGRectMake(200, 45, 100, 20)];
        self.biHua.backgroundColor=[UIColor clearColor];
        [self.contentView addSubview:self.biHua];
        
        UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
        [btn setImage:[UIImage imageNamed:@"loud@2x.png"] forState:UIControlStateNormal];
        btn.frame=CGRectMake(200, 15, 20, 20);
        [btn addTarget:self action:@selector(sound:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:btn];
    }
    return self;
}
-(void)sound:(UIButton *)sender
{
    IFlySynthesizerView *ifly=[IFlySynthesizerViewManager getIFlySynthesizerView];
    [ifly startSpeaking:self.hanZi.text];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
