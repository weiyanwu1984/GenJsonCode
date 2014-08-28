//
//  MessageItem.h
//  GenJsonCode
//
//  Created by weiyanwu on 14-8-28.
//  Copyright (c) 2014年 韦 炎午. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JosnBaseObject.h"

@interface MessageItem : JosnBaseObject
{
    int msgId;
    NSDate* createTime;
    NSString* content;
    
}

@property (nonatomic, assign) int msgId;
@property (nonatomic, strong) NSDate* createTime;
@property (nonatomic, strong) NSString* content;


@end