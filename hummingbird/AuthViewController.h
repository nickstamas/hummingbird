//
//  ViewController.h
//  hummingbird
//
//  Created by Nick Stamas on 12/16/14.
//  Copyright (c) 2014 Nick Stamas. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AuthViewController : UIViewController <UIWebViewDelegate>

// connection to UIWebView in storyboard
@property (weak, nonatomic) IBOutlet UIWebView *webAuthView;

@end

