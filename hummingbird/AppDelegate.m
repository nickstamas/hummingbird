//
//  AppDelegate.m
//  hummingbird
//
//  Created by Nick Stamas on 12/16/14.
//  Copyright (c) 2014 Nick Stamas. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [[UINavigationBar appearance] setTitleTextAttributes: @{
        NSForegroundColorAttributeName: [UIColor whiteColor],
        NSFontAttributeName: [UIFont fontWithName:@"WhitneySSm-Book" size:17]
    }];
    
    return YES;
}

@end
