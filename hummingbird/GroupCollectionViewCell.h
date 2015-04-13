//
//  GroupCollectionViewCell.h
//  hummingbird
//
//  Created by Nick Stamas on 1/7/15.
//  Copyright (c) 2015 Nick Stamas. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GroupCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *groupName;
@property (weak, nonatomic) IBOutlet UIImageView *groupBackground;

@end
