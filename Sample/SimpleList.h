//
//  SimpleList.h
//  GenJsonCode
//
//  Created by weiyanwu on 14-8-28.
//  Copyright (c) 2014年 韦 炎午. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JosnBaseObject.h"

@interface SimpleList : JosnBaseObject
{
    int count;
    NSMutableArray* list;
    
}

@property (nonatomic, assign) int count;
@property (nonatomic, strong) NSMutableArray* list;


@end
