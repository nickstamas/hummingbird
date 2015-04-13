//
//  DiscoveryViewController.h
//  Pods
//
//  Created by Nick Stamas on 1/7/15.
//
//

#import <UIKit/UIKit.h>

@interface DiscoveryViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UICollectionView *discoveryCollectionView;

@end
