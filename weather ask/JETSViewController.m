//
//  JETSViewController.m
//  weather ask
//
//  Created by JETS on 9/1/17.
//  Copyright (c) 2017 JETS. All rights reserved.
//

#import "JETSViewController.h"
#import "resultViewController.h"
@interface JETSViewController ()
{
    NSMutableData *AllData;
    NSMutableDictionary *dict;
    resultViewController *res;
    NSMutableDictionary *coord;
    NSNumber *lon,*lat;
    NSArray *arr;
    NSMutableDictionary *weatherDict;
    NSString *mainState;
    NSString *description;
    NSMutableDictionary *mainDict;
    NSNumber *humidity,*temp,*pressure;
}

@end

@implementation JETSViewController
-(void)getText{
    
    

}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
   
    return self;
}

- (void)viewDidLoad
{
    AllData=[NSMutableData new];
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated{
    [self viewDidLoad];
    [_textfield setText:@""];
    
}

- (IBAction)checkk:(id)sender {
    
    
    res=[resultViewController new];
    NSString *urlstring=@"http://api.openweathermap.org/data/2.5/weather?appid=73de53289521ac4d3d5d25f4c1508ed6&q=";
    NSString *encodeCity=[[_textfield text] stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
    NSScanner *scanner=[NSScanner scannerWithString:encodeCity];
    
   
    if([scanner scanInteger:NULL]&&[scanner isAtEnd])
        {
            
            UIAlertView *message=[[UIAlertView alloc] initWithTitle:@"error" message:@"city not found" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
                [message show];
            [_textfield setText:@""];
        

    }
   
    
    else
        {
            NSString * urls=[urlstring stringByAppendingString:encodeCity];
    
            NSURL *url=[[NSURL alloc] initWithString:urls];
            NSURLRequest *request=[[NSURLRequest alloc] initWithURL:url];
            NSURLConnection *connection =[[NSURLConnection alloc] initWithRequest:request delegate:self];
    
            [connection start];
    
            [self.navigationController pushViewController:res animated:NO];
    
            [res setDeleg:self];
            
        }
    
}







-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    
    [AllData appendData:data];
    
    }
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"connection error" message:@"failed to connect try again later " delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    [alert show];
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
    dict=[NSJSONSerialization JSONObjectWithData:AllData options:NSJSONReadingAllowFragments error:nil];
    if([dict objectForKey:@"message"])
    {
        [self.navigationController popToRootViewControllerAnimated:NO];
        UIAlertView *message=[[UIAlertView alloc] initWithTitle:@"error" message:[dict objectForKey:@"message"] delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [message show];
        
        [_textfield setText:@""];
        
    }
    else
    {
    coord=[dict objectForKey:@"coord"];
    lon=[coord objectForKey:@"lon"];
    lat=[coord objectForKey:@"lat"];
    arr=[dict objectForKey:@"weather"];
    weatherDict=arr[0];
    mainState=[weatherDict objectForKey:@"main"];
    description=[weatherDict objectForKey:@"description"];
    mainDict=[dict objectForKey:@"main"];
    humidity=[mainDict objectForKey:@"humidity"];
    temp=[mainDict objectForKey:@"temp"];
    pressure=[mainDict objectForKey:@"pressure"];
        
    // should pass to result view lon ,lat ,humidity ,temp,weather,description,pressure;
    printf("%s \n ",[mainState UTF8String]);
    printf("%s \n ",[description UTF8String]);
    printf("%s \n ",[[humidity stringValue] UTF8String]);
    printf("%s \n ",[[temp stringValue] UTF8String]);
    printf("%s \n ",[[pressure stringValue] UTF8String]);
    NSLog(@"%@",lat);
    
     
    [[res tempp]setText:[temp stringValue]];
    [[res humidity] setText:[humidity stringValue]];
    [[res desc]setText:description];
    [[res weatherr]setText:mainState];
    [[res pressuretext]setText:[pressure stringValue]];
    NSString *ln=@" lon : ";
    NSString *lt=@" lat : ";
    [[res coO ]setText:[ln stringByAppendingString:[lon stringValue]]];
    [[res coolat] setText:[lt stringByAppendingString:[lat stringValue]]];
        

    }
}
@end
