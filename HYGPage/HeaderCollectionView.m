//
//  HeaderCollectionView.m
//  HYGPage
//
//  Created by 侯英格 on 16/4/28.
//  Copyright © 2016年 侯英格. All rights reserved.
//

#import "HeaderCollectionView.h"

@implementation HeaderCollectionView

-(HeaderCollectionView*)init{
    self=[super init];
    self.backgroundColor=[UIColor whiteColor];
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        self.backgroundColor=[UIColor whiteColor];
    }
    return self;
}


-(void)awakeFromNib{
    [super awakeFromNib];
    self.backgroundColor=[UIColor whiteColor];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
