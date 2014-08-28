//
//  JosnBaseObject.h
//  Unity
//
//  Created by weiyanwu on 14-3-25.
//  Copyright (c) 2014年 weiyanwu. All rights reserved.
//


#import <Foundation/Foundation.h>


@interface JosnBaseObject : NSObject
{
    JosnBaseObject * __weak parent;
}


@property(nonatomic,weak) JosnBaseObject *parent;


- (id)initWithJSON:(NSString *)str;
- (id)initWithJSON:(NSString *)str parent:(JosnBaseObject*)parentObject;
- (id)initWithJSONDictionary:(NSDictionary *)dict;
- (id)initWithJSONDictionary:(NSDictionary *)dict parent:(JosnBaseObject*)parentObject;


- (void)loadWithJSONDictionary:(NSDictionary *)dict parent:(JosnBaseObject*)parentObject;
- (NSString*)toJSONString;
- (NSString*)toJSONStringRecursive:(BOOL)recursive;
- (NSDictionary*)toJSONDictionary;
- (NSDictionary*)toJSONDictionaryRecursive:(BOOL)recursive;


+ (NSNumber*)getMSFromDate:(NSDate*)date;
+ (NSString *)getShortDateFromDate:(NSDate*)date;
+ (NSString *)getLongDateFromDate:(NSDate*)date;


-(BOOL)getBool:(NSString *)str;
-(char)getChar:(NSString *)str;
-(int)getInt:(NSNumber *)str;
-(double)getDouble:(NSNumber *)str;
-(float)getFloat:(NSNumber *)str;


- (NSString *)getString:(NSString *)str;
- (NSNumber*)getNumber:(NSNumber *)str;
- (NSDate*)getDate:(NSString *)str;


@end