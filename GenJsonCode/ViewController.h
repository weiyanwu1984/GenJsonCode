//
//  ViewController.h
//  GenJsonCode
//
//  Created by 韦 炎午 on 13-11-25.
//  Copyright (c) 2013年 韦 炎午. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    NSString *className;
    NSMutableArray *arr;
    
    NSString *arrPart4;
    NSString *arrPart5;
    NSString *objPart4;
    NSString *objPart5;
    
    NSString *charPart5;
    NSString *stringPart5;
    NSString *datePart5;
    NSString *numberPart5;
    
    NSString *coredataPart1;
    NSString *coredataPart2;

}


@property(nonatomic,strong) NSString *className;
@property(nonatomic,strong) NSMutableArray *arr;

@property(nonatomic,strong) NSString *arrPart4;
@property(nonatomic,strong) NSString *arrPart5;
@property(nonatomic,strong) NSString *objPart4;
@property(nonatomic,strong) NSString *objPart5;

@property(nonatomic,strong) NSString *charPart5;
@property(nonatomic,strong) NSString *stringPart5;
@property(nonatomic,strong) NSString *datePart5;
@property(nonatomic,strong) NSString *numberPart5;

@property(nonatomic,strong) NSString *coredataPart1;
@property(nonatomic,strong) NSString *coredataPart2;


-(IBAction)genCode:(id)sender;

@end
