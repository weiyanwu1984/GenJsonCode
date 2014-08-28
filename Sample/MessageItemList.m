//
//  MessageItemList.m
//  GenJsonCode
//
//  Created by weiyanwu on 14-8-28.
//  Copyright (c) 2014年 韦 炎午. All rights reserved.
//

#import "MessageItemList.h"
#import "MessageItem.h"


@implementation MessageItemList

@synthesize count;
@synthesize list;


- (void)loadWithJSONDictionary:(NSDictionary *)dict parent:(JosnBaseObject *)parentObject
{
    [self setParent:parentObject];
    
	[self setCount:[self getInt:[dict objectForKey:@"count"]]];
    
    self.list = [NSMutableArray arrayWithCapacity:0];
    for (NSDictionary *a in [dict objectForKey:@"list"])
    {
        MessageItem* obj = [[MessageItem alloc] initWithJSONDictionary:a parent:self];
        [self.list addObject:obj];
    }
    
}

- (NSDictionary*)toJSONDictionaryRecursive:(BOOL)recursive
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithCapacity:0];
    
	[dict setObject:[NSNumber numberWithInt:count] forKey:@"count"];
    
    if (recursive && self.list)
    {
        NSMutableArray* tempArr = [NSMutableArray arrayWithCapacity:[self.list count]];
        for (MessageItem* obj in self.list)
        {
            [tempArr addObject:[obj toJSONDictionaryRecursive:recursive]];
        }
        [dict setObject:tempArr forKey:@"list"];
    }
    
    return dict;
}

@end