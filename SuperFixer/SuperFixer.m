//
//  SuperFixer.m
//  SuperFixer
//
//  Created by Johan K. Jensen on 13/10/2015.
//  Copyright © 2015 Johan K. Jensen. All rights reserved.
//

#import "SuperFixer.h"
#import "DVTTextCompletionSession+SuperFixer.m"

@interface SuperFixer()
@property (nonatomic, strong, readwrite) NSBundle *bundle;
@end

@implementation SuperFixer

+ (instancetype)sharedPlugin {
    return sharedPlugin;
}

- (id)initWithBundle:(NSBundle *)plugin {
    if (self = [super init]) {
        // reference to plugin's bundle, for resource access
        self.bundle = plugin;
        sharedPlugin = self;
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(didApplicationFinishLaunchingNotification:)
                                                     name:NSApplicationDidFinishLaunchingNotification
                                                   object:nil];
    }
    return self;
}

- (void)didApplicationFinishLaunchingNotification:(NSNotification *)noti {
    // Remove observer
    [[NSNotificationCenter defaultCenter] removeObserver:self name:NSApplicationDidFinishLaunchingNotification object:nil];
    
    // Load Substitutions from Resources/Substitutions.plist
    NSString *superSubstitutionsPath = [self.bundle pathForResource:@"SuperSubstitutions" ofType:@"plist"];
    self.substitutions = [NSDictionary dictionaryWithContentsOfFile:superSubstitutionsPath][@"Substitutions"];
    
    // Swizzle some methods
    [DVTTextCompletionSession sf_swizzleMethods];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
