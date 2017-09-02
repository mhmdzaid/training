//
//  resultViewController.h
//  weather ask
//
//  Created by JETS on 9/1/17.
//  Copyright (c) 2017 JETS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "protocol.h"
@interface resultViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *weatherr;
@property (strong, nonatomic) IBOutlet UILabel *pressuretext;
@property id <protocol>deleg;
@property (strong, nonatomic) IBOutlet UILabel *desc;
@property (strong, nonatomic) IBOutlet UILabel *tempp;
@property (strong, nonatomic) IBOutlet UILabel *humidity;
@property (strong, nonatomic) IBOutlet UILabel *coO;
@property (strong, nonatomic) IBOutlet UILabel *coolat;
@end
