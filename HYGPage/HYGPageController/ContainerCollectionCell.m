//
//  ContainerCollectionCell.m
//  HYGPage
//
//  Created by 侯英格 on 16/4/28.
//  Copyright © 2016年 侯英格. All rights reserved.
//

#import "ContainerCollectionCell.h"

@implementation ContainerCollectionCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

+(ContainerCollectionCell*)dequeueReusableCellWithReuseIdentifier:(NSString*)identifier forIndexPath:(NSIndexPath*)indexPath withCollectionView:
    (UICollectionView*)collectionView andChildVC:(UIViewController*)vc{
    ContainerCollectionCell*cell=[collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    cell.contentView.backgroundColor=[UIColor colorWithRed:random()%255/255.0 green:random()%255/255.0 blue:random()%255/255.0 alpha:1];
    if (!cell.controller||![cell.controller isEqual:vc]) {
        cell.controller=vc;
    }
    return cell;
}

-(void)showChildController{
    self.contentView.bounds=self.controller.view.frame;
    if (self.contentView.subviews.count!=0) {
        if (![self.contentView.subviews[0] isEqual:self.controller.view]) {
            UIView*view=self.contentView.subviews[0];
            [view removeFromSuperview];
            [self.contentView addSubview:self.controller.view];
        }
    }else{
        [self.contentView addSubview:self.controller.view];
    }
    
}


@end
