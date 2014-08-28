//
//  JosnBaseObject.m
//  Unity
//
//  Created by weiyanwu on 14-3-25.
//  Copyright (c) 2014年 weiyanwu. All rights reserved.
//

#import "JosnBaseObject.h"
#import "JSON.h"

@implementation JosnBaseObject

@synthesize parent;

- (id)initWithJSON:(NSString *)str
{
	NSDictionary* dict = [str JSONValue];
	if ((self = [self initWithJSONDictionary:dict parent:nil]))
    {
	}
	return self;
}

- (id)initWithJSON:(NSString *)str parent:(JosnBaseObject*)parentObject
{
	NSDictionary* dict = [str JSONValue];
	if ((self = [self initWithJSONDictionary:dict parent:parentObject]))
    {
	}
	return self;
}

- (id)initWithJSONDictionary:(NSDictionary *)dict
{
	if ((self = [super init]))
    {
		[self loadWithJSONDictionary:dict parent:nil];
	}
	return self;
}

- (id)initWithJSONDictionary:(NSDictionary *)dict parent:(JosnBaseObject*)parentObject
{
    if ((self = [super init]))
    {
        [self loadWithJSONDictionary:dict parent:parentObject];
    }
    return self;
}

- (void)loadWithJSONDictionary:(NSDictionary *)dict parent:(JosnBaseObject*)parentObject
{
    
}

- (NSString*)toJSONString
{
	return [self toJSONStringRecursive:NO];
}

- (NSString*)toJSONStringRecursive:(BOOL)recursive
{
	NSDictionary* vdict = [self toJSONDictionaryRecursive:recursive];
	return [vdict JSONFragment];
}

- (NSDictionary*)toJSONDictionary
{
	return [self toJSONDictionaryRecursive:NO];
}

- (NSDictionary*)toJSONDictionaryRecursive:(BOOL)recursive
{
	return nil;
}




+ (NSNumber*)getMSFromDate:(NSDate*)date
{
	if (date)
    {
		return [NSNumber numberWithLongLong:[date timeIntervalSince1970] * 1000];
    }
	else
    {
		return nil;
    }
}

+ (NSString *)getShortDateFromDate:(NSDate*)date
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd";
    return [formatter stringFromDate:date];
}

+ (NSString *)getLongDateFromDate:(NSDate*)date
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    return [formatter stringFromDate:date];
}

-(BOOL)getBool:(NSString *)str
{
    if (str == nil || (NSNull*)str == [NSNull null])
    {
		return NO;
    }
	else
    {
        return [str boolValue];
    }
}

-(char)getChar:(NSString *)str
{
    if (str == nil || (NSNull*)str == [NSNull null])
    {
		return '\0';
    }
	else
    {
        return [str characterAtIndex:0];
    }
}

-(int)getInt:(NSNumber *)str
{
    if (str == nil || (NSNull*)str == [NSNull null])
    {
		return 0;
    }
	else
    {
        return [str intValue];
    }
}

-(double)getDouble:(NSNumber *)str
{
    if (str == nil || (NSNull*)str == [NSNull null])
    {
		return 0.0;
    }
	else
    {
        return [str doubleValue];
    }
}

-(float)getFloat:(NSNumber *)str
{
    if (str == nil || (NSNull*)str == [NSNull null])
    {
		return 0.0;
    }
	else
    {
        return [str floatValue];
    }
}

- (NSString *)getString:(NSString *)str
{
    NSString *ret = nil;
    if (str == nil || (NSNull*)str == [NSNull null])
    {
		return nil;
    }
    if([str isKindOfClass:[NSNumber class]])
    {
        NSNumber *num = (NSNumber *)str;
        ret = [num stringValue];
        return ret;
    }
	else
    {
        return str;
    }
}

- (NSNumber*)getNumber:(NSNumber *)str
{
    if (str == nil || (NSNull*)str == [NSNull null])
	{
		return nil;
	}
    
    NSNumber *number = nil;
    if([str isKindOfClass:[NSNumber class]])
    {
        number = (NSNumber *)str;
    }
    else if([str isKindOfClass:[NSString class]])
    {
        NSString *theStr = (NSString *)str;
        NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
        [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
        number = [formatter numberFromString:theStr];
    }
    else
    {
        number = [NSNumber numberWithInt:0];
    }
	return number;
}



- (NSDate*)getDate:(NSString *)str
{
    
	if(str==nil || (NSNull*)str == [NSNull null])
    {
        return nil;
    }
    
    
    if([str isKindOfClass:[NSNumber class]])
    {
        NSNumber * tempNum = (NSNumber *)str;
        NSString * tempStr = [tempNum stringValue];
        
        NSString * msStr = [tempStr stringByReplacingOccurrencesOfString:@"/Date(" withString:@""];
        msStr = [msStr stringByReplacingOccurrencesOfString:@")/" withString:@""];
        
        double interval = [msStr doubleValue];
        interval = interval / 1000;
        
        NSDate *retDate = [NSDate dateWithTimeIntervalSince1970:interval];
        return retDate;
    }
    else
    {
        NSString *regex1 = @"\\d{4}-\\d{2}-\\d{2}";
        NSPredicate *test1 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex1];
        
        NSString *regex2 = @"\\d{4}-\\d{2}-\\d{2} \\d{2}:\\d{2}:\\d{2}";
        NSPredicate *test2 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex2];
        
        NSString *regex3 = @"\\d{10}";
        NSPredicate *test3 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex3];
        
        if([test1 evaluateWithObject:str])
        {
            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
            [dateFormatter setDateFormat:@"yyyy-MM-dd"];
            NSDate *formateDate = [dateFormatter dateFromString:str];
            return formateDate;
        }
        else if([test2 evaluateWithObject:str])
        {
            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
            [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
            NSDate *formateDate = [dateFormatter dateFromString:str];
            return formateDate;
        }
        else if([test3 evaluateWithObject:str])
        {
            NSNumber * tempNum = [NSNumber numberWithFloat:[str floatValue]];
            NSString * tempStr = [tempNum stringValue];
            
            NSString * msStr = [tempStr stringByReplacingOccurrencesOfString:@"/Date(" withString:@""];
            msStr = [msStr stringByReplacingOccurrencesOfString:@")/" withString:@""];
            
            double interval = [msStr doubleValue];
     
            NSDate *retDate = [NSDate dateWithTimeIntervalSince1970:interval];
            return retDate;
        }
        else
        {
        
            NSString * tempStr = str;
            
            NSString * msStr = [tempStr stringByReplacingOccurrencesOfString:@"/Date(" withString:@""];
            msStr = [msStr stringByReplacingOccurrencesOfString:@")/" withString:@""];
            
            double interval = [msStr doubleValue];
            interval = interval / 1000;
            
            NSDate *retDate = [NSDate dateWithTimeIntervalSince1970:interval];
            return retDate;
        }
        
        
    }
}

@end