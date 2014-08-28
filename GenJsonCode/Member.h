//
//  Member.h
//  GenJsonCode
//
//  Created by 韦 炎午 on 13-11-25.
//  Copyright (c) 2013年 韦 炎午. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Member : NSObject
{
    NSString *type;
    NSString *name;
}

@property(nonatomic,strong) NSString *type;
@property(nonatomic,strong) NSString *name;

@end
