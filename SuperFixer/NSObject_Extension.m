//
//  NSObject_Extension.m
//  SuperFixer
//
//  Created by Johan K. Jensen on 13/10/2015.
//  Copyright © 2015 Johan K. Jensen. All rights reserved.
//


#import "NSObject_Extension.h"
#import "SuperFixer.h"

@implementation NSObject (Xcode_Plugin_Template_Extension)

+ (void)pluginDidLoad:(NSBundle *)plugin
{
    static dispatch_once_t onceToken;
    NSString *currentApplicationName = [[NSBundle mainBundle] infoDictionary][@"CFBundleName"];
    if ([currentApplicationName isEqual:@"Xcode"]) {
        dispatch_once(&onceToken, ^{
            sharedPlugin = [[SuperFixer alloc] initWithBundle:plugin];
        });
    }
}

@end
