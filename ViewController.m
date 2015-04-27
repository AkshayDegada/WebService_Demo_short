//
//  ViewController.m
//  Akshay_Degada
//
//  Created by Akshay_iMac on 27/04/15.
//  Copyright (c) 2015 Eminents. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
 -->   NSString *str = @"Parameter String with table name...like below line";
   //tableName=country_master&afterWhere=is_delete = 0&field=country_master.country_master_id,country_master.country_name&numOfRecord=all&start=0&beforeWhere=
   
-->    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"Webservice Name like Below line"]];
    //http://203.88.133.140/myshalewell_live/webservice/webservice_pagination.php
    [request setHTTPMethod:@"POST"];
    
    NSData *myRequestData = [ NSData dataWithBytes: [ str UTF8String ] length: [ str length ] ];
    [request setValue:[NSString stringWithFormat:@"%lu", (unsigned long)str.length] forHTTPHeaderField:@"Content-Length"];
    [request setHTTPBody:[str dataUsingEncoding:NSUTF8StringEncoding]];
    [request setValue:@"application/x-www-form-urlencoded charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:myRequestData];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error)
     {
         NSString *responseBody = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
         NSDictionary *returnDict = [NSJSONSerialization JSONObjectWithData: [responseBody dataUsingEncoding:NSUTF8StringEncoding] options: NSJSONReadingMutableContainers
                                                                      error: &error];
         NSLog(@"ReturnDict:%@",returnDict);
         // Webservice Responce
     }];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
