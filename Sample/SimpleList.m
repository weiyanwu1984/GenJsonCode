//
//  SimpleList.m
//  GenJsonCode
//
//  Created by weiyanwu on 14-8-28.
//  Copyright (c) 2014年 韦 炎午. All rights reserved.
//


#import "SimpleList.h"


@implementation SimpleList

@synthesize count;
@synthesize list;


- (void)loadWithJSONDictionary:(NSDictionary *)dict parent:(JosnBaseObject *)parentObject
{
    [self setParent:parentObject];
    
	[self setCount:[self getInt:[dict objectForKey:@"count"]]];
    
    self.list = [NSMutableArray arrayWithCapacity:0];
    for (NSDictionary *a in [dict objectForKey:@"list"])
    {
        [self.list addObject:a];
    }

}

- (NSDictionary*)toJSONDictionaryRecursive:(BOOL)recursive
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithCapacity:0];
    
	[dict setObject:[NSNumber numberWithInt:count] forKey:@"count"];
    
    if (recursive && self.list)
    {
        [dict setObject:self.list forKey:@"list"];
    }
    
    return dict;
}

@end