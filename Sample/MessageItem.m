//
//  MessageItem.m
//  GenJsonCode
//
//  Created by weiyanwu on 14-8-28.
//  Copyright (c) 2014年 韦 炎午. All rights reserved.
//

#import "MessageItem.h"

@implementation MessageItem

@synthesize msgId;
@synthesize createTime;
@synthesize content;


- (void)loadWithJSONDictionary:(NSDictionary *)dict parent:(JosnBaseObject *)parentObject
{
    [self setParent:parentObject];
    
	[self setMsgId:[self getInt:[dict objectForKey:@"msgId"]]];
	[self setCreateTime:[self getDate:[dict objectForKey:@"createTime"]]];
	[self setContent:[self getString:[dict objectForKey:@"content"]]];
    
    
}

- (NSDictionary*)toJSONDictionaryRecursive:(BOOL)recursive
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithCapacity:0];
    
	[dict setObject:[NSNumber numberWithInt:msgId] forKey:@"msgId"];
    
    if (createTime)
    {
        [dict setObject:[JosnBaseObject getMSFromDate:createTime] forKey:@"createTime"];
    }
    
    if (content)
    {
        [dict setObject:content forKey:@"content"];
    }
    
    
    return dict;
}

@end