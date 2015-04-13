//
//  DiscoveryViewController.m
//  Pods
//
//  Created by Nick Stamas on 1/7/15.
//
//

#import "DiscoveryViewController.h"
#import "HummingbirdNavigationViewController.h"
#import "GroupCollectionViewCell.h"
#import <AFNetworking/AFNetworking.h>
#import "UIImageView+AFNetworking.h"

@interface DiscoveryViewController ()
@property (nonatomic) NSMutableArray *groups;
@end

@implementation DiscoveryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    HummingbirdNavigationViewController *viewController = (HummingbirdNavigationViewController*)self.navigationController;
    
    [manager GET:[NSString stringWithFormat:@"https://api.meetup.com/recommended/groups?access_token=%@", viewController.accessToken] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        self.groups = (NSMutableArray*)responseObject;
        [_discoveryCollectionView reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}

- (void)viewDidAppear:(BOOL)animated {
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section {
    return [self.groups count];
}

- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (self.groups == nil) return nil;
    
    GroupCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"groupCell" forIndexPath:indexPath];
    NSDictionary *group = [self.groups objectAtIndex:indexPath.row];
    
    NSString *groupName = [group objectForKey:@"name"];
    NSString *imageURL = [[group valueForKeyPath:@"photos.photo_link"] lastObject];
    
    cell.groupName.text = groupName;

    if (imageURL) {
        [cell.groupBackground setImageWithURL:[NSURL URLWithString:imageURL]];
    }
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(CGRectGetWidth([UIScreen mainScreen].bounds)-20.0, 79.0);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    // If you need to use the touched cell, you can retrieve it like so
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    
    NSLog(@"touched cell %@ at indexPath %@", cell, indexPath);
}

@end
