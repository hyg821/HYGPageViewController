//
//  ContainerCollectionCell.h
//  HYGPage
//
//  Created by 侯英格 on 16/4/28.
//  Copyright © 2016年 侯英格. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContainerCollectionCell : UICollectionViewCell
@property(nonatomic,weak)UIViewController*controller;
+(ContainerCollectionCell*)dequeueReusableCellWithReuseIdentifier:(NSString*)identifier forIndexPath:(NSIndexPath*)indexPath withCollectionView:(UICollectionView*)collectionView andChildVC:(UIViewController*)vc;

-(void)showChildController;
@end
