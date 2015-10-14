//
//  DVTTextCompletionSession+SuperFixer.h
//  SuperFixer
//
//  Created by Johan K. Jensen on 13/10/2015.
//  Copyright © 2015 Johan K. Jensen. All rights reserved.
//

#import "XcodeHeaders/DVTTextCompletionSession.h"

@interface DVTTextCompletionSession (SuperFixer)
+ (void) sf_swizzleMethods;
@end
