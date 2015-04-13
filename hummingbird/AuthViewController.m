#import "AuthViewController.h"
#import "HummingbirdNavigationViewController.h"

@implementation AuthViewController

NSString *accessToken;

// The app "starts" here, because in the settings we've set Main.storyboard as the main interface
// This controller controls the first view in Main.storyboard, designated by the arrow ->
// viewDidLoad gets called on a ViewController once the view loads

- (void)viewDidLoad {
    // call same method on parent
    [super viewDidLoad];
    
    // sets self (AuthViewController) to be the delegate for the UIWebView
    self.webAuthView.delegate = self;
    
    // load up this URL in the UIWebView
    NSString *fullURL = @"https://secure.meetup.com/oauth2/authorize?client_id=efk1eq7597s9h0s9oorvu47c2u&response_type=token&redirect_uri=b749bned.com&set_mobile=on";
    NSURL *url = [NSURL URLWithString:fullURL];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [self.webAuthView loadRequest:requestObj];
}

// A delegate method that gets called when our UIWebView loads up a page
- (BOOL)webView:(UIWebView *)webView
shouldStartLoadWithRequest:(NSURLRequest *)request
 navigationType:(UIWebViewNavigationType)navigationType {
    
    // This is all a bit of a hack to grab the Meetup access token out of the URL
    NSString *url = [NSString stringWithFormat: @"%@", request.URL];
    NSArray *urlParts = [url componentsSeparatedByString:@"#"];
    
    if ([urlParts count] > 1) {
        NSString *urlParams = urlParts[1];
        NSArray *paramArr = [urlParams componentsSeparatedByString:@"&"];
        
        for (NSString *paramString in paramArr) {
            NSArray *paramPartArr = [paramString componentsSeparatedByString:@"="];
            NSString *key = paramPartArr[0];
            NSString *value;
            
            if ([paramPartArr count] > 1) {
                value = paramPartArr[1];
            }
            
            if ([key isEqual: @"access_token"]) {
                // We got the access token
                
                // Store that shit
                accessToken = value;
                
                // We out. Segue to next view. The identifier is set in the storyboard.
                [self performSegueWithIdentifier: @"login" sender: self];
            }
        }
        
    }
    return YES;
}

// This method gets called when we're about to segue
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"login"]) {
        HummingbirdNavigationViewController *hnvc = segue.destinationViewController;
        // Pass along the access token, so we can make calls to the Meetup API
        hnvc.accessToken = accessToken;
    }
}

@end
