//
//  HYGContainerRootView.h
//  HYGPage
//
//  Created by 侯英格 on 16/4/28.
//  Copyright © 2016年 侯英格. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContainerCollectionView.h"
@interface HYGContainerRootView : UIView
@property(nonatomic,strong)NSArray*vcArray;
@property(nonatomic,strong)ContainerCollectionView*containerCollectionView;
@property(nonatomic,assign)NSInteger selectIndex;
-(void)prepareForInitialize;
@end
