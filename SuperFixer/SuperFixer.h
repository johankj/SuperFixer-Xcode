//
//  SuperFixer.h
//  SuperFixer
//
//  Created by Johan K. Jensen on 13/10/2015.
//  Copyright © 2015 Johan K. Jensen. All rights reserved.
//

#import <AppKit/AppKit.h>

@class SuperFixer;

static SuperFixer *sharedPlugin;

@interface SuperFixer : NSObject

+ (instancetype)sharedPlugin;
- (id)initWithBundle:(NSBundle *)plugin;

@property (nonatomic, strong, readonly) NSBundle *bundle;
@property (nonatomic, strong) NSArray<NSDictionary<NSString*, NSString*>*> *substitutions;
@end