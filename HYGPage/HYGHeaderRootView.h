//
//  HYGHeaderRootView.h
//  HYGPage
//
//  Created by 侯英格 on 16/4/28.
//  Copyright © 2016年 侯英格. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HeaderCollectionView.h"
@interface HYGHeaderRootView : UIView
@property(nonatomic,strong)NSArray*titleArray;
@property(nonatomic,strong)HeaderCollectionView*headerCollectionView;
@property(nonatomic,assign)NSInteger selectIndex;
-(void)prepareForInitialize;
@end
