//
//  HeaderCollectionCell.m
//  HYGPage
//
//  Created by 侯英格 on 16/4/28.
//  Copyright © 2016年 侯英格. All rights reserved.
//

#import "HeaderCollectionCell.h"

@implementation HeaderCollectionCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)becomeRedStyle{
    self.titleLab.textColor=[UIColor redColor];
    self.titleLab.font=[UIFont systemFontOfSize:16];
    self.markView.backgroundColor=[UIColor redColor];
}
-(void)becomeBlackStyle{
    self.titleLab.textColor=[UIColor blackColor];
    self.titleLab.font=[UIFont systemFontOfSize:14];
    self.markView.backgroundColor=[UIColor clearColor];
}

@end
