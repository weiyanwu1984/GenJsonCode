//
//  ViewController.m
//  GenJsonCode
//
//  Created by 韦 炎午 on 13-11-25.
//  Copyright (c) 2013年 韦 炎午. All rights reserved.
//

#import "ViewController.h"
#import "Member.h"


@interface ViewController ()

@end

@implementation ViewController
@synthesize className;
@synthesize arr;

@synthesize arrPart4;
@synthesize arrPart5;
@synthesize objPart4;
@synthesize objPart5;

@synthesize charPart5;
@synthesize stringPart5;
@synthesize datePart5;
@synthesize numberPart5;


@synthesize coredataPart1;
@synthesize coredataPart2;

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self genCode:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSMutableArray *totalArr  = [[NSMutableArray alloc] init];

    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"testData" ofType:@"txt"];
    if (filePath)
    {
        NSError* error = nil;//先赋一个nil的值
        NSString *totalStr = [NSString stringWithContentsOfFile:filePath encoding:NSASCIIStringEncoding error:&error];
        
        if (totalStr)
        {
            totalStr = [totalStr stringByAppendingString:@"\r\n"];
            
            NSArray *ret = [totalStr componentsSeparatedByString:@";"];
            
            NSMutableArray *tempArr = [[NSMutableArray alloc] initWithCapacity:10];
            
            for(NSString  *obj in ret)
            {
                NSString *temp = [obj stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
               
                if(![temp isEqualToString:@""])
                {
                    [tempArr addObject:temp];
                }
            }
            
            className = [tempArr objectAtIndex:0];
            
            for(int i =1;i<[tempArr count];i++)
            {
                NSString *tempStr = [tempArr objectAtIndex:i];
                if([tempStr rangeOfString:@"*"].location != NSNotFound)
                {
                    NSArray *tempMemberArr = [tempStr componentsSeparatedByString:@"*"];
                    {
                        Member *m = [[Member alloc] init];
                        
                        NSString *strType = [tempMemberArr objectAtIndex:0];
                        NSString *strName = [tempMemberArr objectAtIndex:1];
                        NSString *tempType = [strType stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
                        NSString *tempName = [strName stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
                        
                        strType = [tempType stringByAppendingString:@"*"];
                        strName = tempName;
                        
                        m.type = strType;
                        m.name = strName;
                        [totalArr addObject:m];
                    }
                }
                else
                {
                    NSArray *tempMemberArr = [tempStr componentsSeparatedByString:@" "];
                    {
                        Member *m = [[Member alloc] init];
                        
                        NSString *strType = [tempMemberArr objectAtIndex:0];
                        NSString *strName = [tempMemberArr objectAtIndex:1];
                        NSString *tempType = [strType stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
                        NSString *tempName = [strName stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
  
                        m.type = tempType;
                        m.name = tempName;
                        [totalArr addObject:m];
                    }
                }
        
            }
   
        }
        
    }
    
    self.arr = totalArr;
  
    {
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"arrPart4" ofType:@"txt"];
        if (filePath)
        {
            NSError* error = nil;//先赋一个nil的值
            self.arrPart4 = [NSString stringWithContentsOfFile:filePath encoding:NSASCIIStringEncoding error:&error];
        }
    }
    {
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"arrPart5" ofType:@"txt"];
        if (filePath)
        {
            NSError* error = nil;//先赋一个nil的值
            self.arrPart5 = [NSString stringWithContentsOfFile:filePath encoding:NSASCIIStringEncoding error:&error];
        }
    }
    {
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"objPart4" ofType:@"txt"];
        if (filePath)
        {
            NSError* error = nil;//先赋一个nil的值
            self.objPart4 = [NSString stringWithContentsOfFile:filePath encoding:NSASCIIStringEncoding error:&error];
        }
    }
    {
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"objPart5" ofType:@"txt"];
        if (filePath)
        {
            NSError* error = nil;//先赋一个nil的值
            self.objPart5 = [NSString stringWithContentsOfFile:filePath encoding:NSASCIIStringEncoding error:&error];
        }
    }
    {
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"stringPart5" ofType:@"txt"];
        if (filePath)
        {
            NSError* error = nil;//先赋一个nil的值
            self.stringPart5 = [NSString stringWithContentsOfFile:filePath encoding:NSASCIIStringEncoding error:&error];
        }
    }
    {
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"datePart5" ofType:@"txt"];
        if (filePath)
        {
            NSError* error = nil;//先赋一个nil的值
            self.datePart5 = [NSString stringWithContentsOfFile:filePath encoding:NSASCIIStringEncoding error:&error];
        }
    }
    {
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"numberPart5" ofType:@"txt"];
        if (filePath)
        {
            NSError* error = nil;//先赋一个nil的值
            self.numberPart5 = [NSString stringWithContentsOfFile:filePath encoding:NSASCIIStringEncoding error:&error];
        }
    }
    {
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"charPart5" ofType:@"txt"];
        if (filePath)
        {
            NSError* error = nil;//先赋一个nil的值
            self.charPart5 = [NSString stringWithContentsOfFile:filePath encoding:NSASCIIStringEncoding error:&error];
        }
    }
    
    {
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"coredataPart1" ofType:@"txt"];
        if (filePath)
        {
            NSError* error = nil;//先赋一个nil的值
            self.coredataPart1 = [NSString stringWithContentsOfFile:filePath encoding:NSASCIIStringEncoding error:&error];
        }
    }
    
    {
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"coredataPart2" ofType:@"txt"];
        if (filePath)
        {
            NSError* error = nil;//先赋一个nil的值
            self.coredataPart2 = [NSString stringWithContentsOfFile:filePath encoding:NSASCIIStringEncoding error:&error];
        }
    }


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSString *)genPart1
{
    NSString *ret = @"";
    for (Member *obj in arr)
    {
        ret = [ret stringByAppendingFormat:@"   %@ %@;\r\n",obj.type,obj.name];
    }
    
    return ret;
}

-(BOOL)isSimple:(NSString *)type
{
    if([type isEqualToString:@"BOOL"]
       ||[type isEqualToString:@"int"]
       ||[type isEqualToString:@"double"]
       ||[type isEqualToString:@"float"]
       ||[type isEqualToString:@"char"]
       )
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

-(NSString *)genPart2
{
    NSString *ret = @"";
    for (Member *obj in arr)
    {
        if(![self isSimple:obj.type])
        {
            ret = [ret stringByAppendingFormat:@"@property (nonatomic, strong) %@ %@;\r\n",obj.type,obj.name];
        }
        else
        {
            ret = [ret stringByAppendingFormat:@"@property (nonatomic, assign) %@ %@;\r\n",obj.type,obj.name];
        }
    }
    
    return ret;
}

-(NSString *)genPart3
{
    NSString *ret = @"";
    for (Member *obj in arr)
    {
        ret = [ret stringByAppendingFormat:@"@synthesize %@;\r\n",obj.name];
    }
    return ret;
}

-(NSString *)getDaxieName:(NSString *)name
{
    NSString *str1= [name substringToIndex:1];
    NSString *str2= [name substringFromIndex:1];
    return [[str1 capitalizedString] stringByAppendingString:str2];
}

-(NSString *)genPart4
{
    NSString *ret = @"";
    int i = 0;
    for (Member *obj in arr)
    {
        i++;
   
        if([obj.type isEqualToString:@"BOOL"])
        {
            ret = [ret stringByAppendingFormat:@"\t[self set%@:[self getBool:[dict objectForKey:@\"%@\"]]];\r\n",[self getDaxieName:obj.name],obj.name];
            
        }
        else if([obj.type isEqualToString:@"char"])
        {
            ret = [ret stringByAppendingFormat:@"\t[self set%@:[self getChar:[dict objectForKey:@\"%@\"]]];\r\n",[self getDaxieName:obj.name],obj.name];
            
        }
        else if([obj.type isEqualToString:@"int"])
        {
            ret = [ret stringByAppendingFormat:@"\t[self set%@:[self getInt:[dict objectForKey:@\"%@\"]]];\r\n",[self getDaxieName:obj.name],obj.name];
            
        }
        else if([obj.type isEqualToString:@"float"])
        {
            ret = [ret stringByAppendingFormat:@"\t[self set%@:[self getFloat:[dict objectForKey:@\"%@\"]]];\r\n",[self getDaxieName:obj.name],obj.name];
            
        }
        else if([obj.type isEqualToString:@"double"])
        {
            ret = [ret stringByAppendingFormat:@"\t[self set%@:[self getDouble:[dict objectForKey:@\"%@\"]]];\r\n",[self getDaxieName:obj.name],obj.name];
            
        }
        
        else if ([obj.type isEqualToString:@"NSString*"])
        {
            ret = [ret stringByAppendingFormat:@"\t[self set%@:[self getString:[dict objectForKey:@\"%@\"]]];\r\n",[self getDaxieName:obj.name],obj.name];
            
        }
        else if([obj.type isEqualToString:@"NSDate*"])
        {
            ret = [ret stringByAppendingFormat:@"\t[self set%@:[self getDate:[dict objectForKey:@\"%@\"]]];\r\n",[self getDaxieName:obj.name],obj.name];
            
            
        }
        else if([obj.type isEqualToString:@"NSNumber*"])
        {
            ret = [ret stringByAppendingFormat:@"\t[self set%@:[self getNumber:[dict objectForKey:@\"%@\"]]];\r\n",[self getDaxieName:obj.name],obj.name];
            
        }

        else if([obj.type isEqualToString:@"NSMutableArray*"])
        {
            NSString *temp = [arrPart4 stringByReplacingOccurrencesOfString:@"arrMember" withString:obj.name];
            ret = [ret stringByAppendingString:temp];
        }
        
        else
        {
            NSString *temp = [objPart4 stringByReplacingOccurrencesOfString:@"ObjectMember" withString:[self getDaxieName:obj.name]];
            temp = [temp stringByReplacingOccurrencesOfString:@"objectMember" withString:obj.name];
            ret = [ret stringByAppendingString:temp];
        }
    }
    
    return ret;
}

-(NSString *)genPart5
{
    NSString *ret = @"";
    for (Member *obj in arr)
    {
        if([obj.type isEqualToString:@"BOOL"])
        {
            ret = [ret stringByAppendingFormat:@"\t[dict setObject:[NSNumber numberWithBool:%@] forKey:@\"%@\"];\r\n",obj.name,obj.name];
            
        }
        else if([obj.type isEqualToString:@"char"])
        {
            NSString *temp = [charPart5 stringByReplacingOccurrencesOfString:@"charMember" withString:obj.name];
            ret = [ret stringByAppendingString:temp];
            
        }
        else if([obj.type isEqualToString:@"int"])
        {
            ret = [ret stringByAppendingFormat:@"\t[dict setObject:[NSNumber numberWithInt:%@] forKey:@\"%@\"];\r\n",obj.name,obj.name];
            
        }
        else if([obj.type isEqualToString:@"float"])
        {
            ret = [ret stringByAppendingFormat:@"\t[dict setObject:[NSNumber numberWithFloat:%@] forKey:@\"%@\"];\r\n",obj.name,obj.name];
            
        }
        else if([obj.type isEqualToString:@"double"])
        {
            ret = [ret stringByAppendingFormat:@"\t[dict setObject:[NSNumber numberWithDouble:%@] forKey:@\"%@\"];\r\n",obj.name,obj.name];
  
        }
        
        
        else if ([obj.type isEqualToString:@"NSString*"])
        {
            NSString *temp = [stringPart5 stringByReplacingOccurrencesOfString:@"stringMember" withString:obj.name];
            ret = [ret stringByAppendingString:temp];
        }
        else if([obj.type isEqualToString:@"NSDate*"])
        {
            NSString *temp = [datePart5 stringByReplacingOccurrencesOfString:@"dateMember" withString:obj.name];
            ret = [ret stringByAppendingString:temp];
        }
        else if([obj.type isEqualToString:@"NSNumber*"])
        {
            NSString *temp = [numberPart5 stringByReplacingOccurrencesOfString:@"numberMember" withString:obj.name];
            ret = [ret stringByAppendingString:temp];
        }
    
      
     
  
        
        else if([obj.type isEqualToString:@"NSMutableArray*"])
        {
            NSString *temp = [arrPart5 stringByReplacingOccurrencesOfString:@"arrMember" withString:obj.name];
            ret = [ret stringByAppendingString:temp];
        }
        
        else
        {
            NSString *temp = [objPart5 stringByReplacingOccurrencesOfString:@"ObjectMember" withString:[self getDaxieName:obj.name]];
            temp = [temp stringByReplacingOccurrencesOfString:@"objectMember" withString:obj.name];
            ret = [ret stringByAppendingString:temp];
        }
    }
    return ret;
}

-(NSString *)genPart6
{
    NSString *ret = @"";
    for (Member *obj in arr)
    {
        ret = [ret stringByAppendingFormat:@"    ret.%@ = theData.%@;\r\n",obj.name,obj.name];
    }
    
    return ret;
}

-(NSString *)genPart7
{
    NSString *ret = @"";
    for (Member *obj in arr)
    {
        ret = [ret stringByAppendingFormat:@"    ret.%@ = theData.%@;\r\n",obj.name,obj.name];
    }
    
    return ret;
}

-(NSString *)genHead
{
    NSString *part1 = [self genPart1];
    NSString *part2 = [self genPart2];
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"jsonHead" ofType:@"txt"];
    if (filePath)
    {
        NSError* error = nil;//先赋一个nil的值
        NSString *totalStr = [NSString stringWithContentsOfFile:filePath encoding:NSASCIIStringEncoding error:&error];
        
        if (totalStr)
        {
            totalStr = [totalStr stringByReplacingOccurrencesOfString:@"part1" withString:part1];
            totalStr = [totalStr stringByReplacingOccurrencesOfString:@"part2" withString:part2];
            totalStr = [totalStr stringByReplacingOccurrencesOfString:@"partCoreData1" withString:coredataPart1];
            
            totalStr = [totalStr stringByReplacingOccurrencesOfString:@"XXX" withString:className];
            return totalStr;
        }
    }
    return @"";
    
}

-(NSString *)genBody
{
    NSString *part3 = [self genPart3];
    NSString *part4 = [self genPart4];
    NSString *part5 = [self genPart5];
    NSString *part6 = [self genPart6];
    NSString *part7 = [self genPart7];
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"jsonM" ofType:@"txt"];
    if (filePath)
    {
        NSError* error = nil;//先赋一个nil的值
        NSString *totalStr = [NSString stringWithContentsOfFile:filePath encoding:NSASCIIStringEncoding error:&error];
        
        if (totalStr)
        {
            totalStr = [totalStr stringByReplacingOccurrencesOfString:@"part3" withString:part3];
            totalStr = [totalStr stringByReplacingOccurrencesOfString:@"part4" withString:part4];
            totalStr = [totalStr stringByReplacingOccurrencesOfString:@"part5" withString:part5];
            totalStr = [totalStr stringByReplacingOccurrencesOfString:@"partCoreData2" withString:coredataPart2];
            totalStr = [totalStr stringByReplacingOccurrencesOfString:@"part6" withString:part6];
            totalStr = [totalStr stringByReplacingOccurrencesOfString:@"part7" withString:part7];
            totalStr = [totalStr stringByReplacingOccurrencesOfString:@"XXX" withString:className];
            return totalStr;
        }
    }
    return @"";
}


-(IBAction)genCode:(id)sender
{
    NSString *ret = @"";
    ret= [ret stringByAppendingString:[self genHead]];
    ret= [ret stringByAppendingString:[self genBody]];
    
    ret = [ret stringByReplacingOccurrencesOfString:@"MyClassName" withString:className];
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"baseClass" ofType:@"txt"];
    if (filePath)
    {
        NSError* error = nil;//先赋一个nil的值
        NSString *totalStr = [NSString stringWithContentsOfFile:filePath encoding:NSASCIIStringEncoding error:&error];
        
        if (totalStr)
        {
            ret = [ret stringByReplacingOccurrencesOfString:@"BaseClassName" withString:totalStr];
        }
    }
    
    
    NSLog(@"%@",ret);
    
}


@end
