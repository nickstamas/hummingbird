//
//  GroupCollectionViewCell.m
//  hummingbird
//
//  Created by Nick Stamas on 1/7/15.
//  Copyright (c) 2015 Nick Stamas. All rights reserved.
//

#import "GroupCollectionViewCell.h"

@implementation GroupCollectionViewCell

- (void)prepareForReuse {
    self.groupBackground.image = nil;
}

@end
