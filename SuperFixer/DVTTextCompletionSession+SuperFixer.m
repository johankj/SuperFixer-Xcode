//
//  DVTTextCompletionSession+SuperFixer.m
//  SuperFixer
//
//  Created by Johan K. Jensen on 13/10/2015.
//  Copyright © 2015 Johan K. Jensen. All rights reserved.
//

#import "DVTTextCompletionSession+SuperFixer.h"
#import "DVTTextCompletionItem-Protocol.h"
#import "JRSwizzle.h"
#import "SFCompletionItem.h"
#import "SuperFixer.h"

@implementation DVTTextCompletionSession (SuperFixer)

+ (void) sf_swizzleMethods {
    [self jr_swizzleMethod: @selector(insertCurrentCompletion)
                withMethod: @selector(_sf_insertCurrentCompletion)
                     error: NULL];
}

#pragma mark - Overrides

- (BOOL)_sf_insertCurrentCompletion {

    long long index = [self selectedCompletionIndex];
    id<DVTTextCompletionItem> completionItem = [[self filteredCompletionsAlpha] objectAtIndex:index];

    for (NSDictionary<NSString*, NSString*> *subst in [[SuperFixer sharedPlugin] substitutions]) {

        // TODO: The substitution-dict should really be split out into it’s own object, which takes care of all of this, and makes it prettier.
        NSString *find = [subst[@"Find"] stringByReplacingOccurrencesOfString:@"\\n" withString:@"\n"];
        NSString *replace = [subst[@"Replace"] stringByReplacingOccurrencesOfString:@"\\n" withString:@"\n"];

        if ([[completionItem completionText] isEqualToString:find]) {

            NSMutableArray *filteredCompletionsAlpha = [[self filteredCompletionsAlpha] mutableCopy];
            SFCompletionItem *item = [SFCompletionItem completionItemForItem:completionItem];
            item.completionText = replace;
            [filteredCompletionsAlpha replaceObjectAtIndex:index withObject:item];
            [self setFilteredCompletionsAlpha:[NSArray arrayWithArray:filteredCompletionsAlpha]];

            break;
        }
    }

    return [self _sf_insertCurrentCompletion];
}

@end
