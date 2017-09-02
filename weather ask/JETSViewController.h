//
//  JETSViewController.h
//  weather ask
//
//  Created by JETS on 9/1/17.
//  Copyright (c) 2017 JETS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "protocol.h"
@interface JETSViewController : UIViewController <NSURLConnectionDataDelegate ,NSURLConnectionDelegate, protocol>
    
- (IBAction)checkk:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *textfield;
@property NSString* str;
@property NSMutableDictionary *dictp;
@end
