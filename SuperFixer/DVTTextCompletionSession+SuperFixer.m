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
    
    NSLog(@"SuperFixer [%@ %@]: %@", [completionItem class], NSStringFromSelector(_cmd), [completionItem completionText]);
    
    if ([[completionItem completionText] isEqualToString:@"override func viewWillAppear(animated: Bool) {\n<#code#>\n}"]) {
        NSMutableArray *filteredCompletionsAlpha = [[self filteredCompletionsAlpha] mutableCopy];
        SFCompletionItem *item = [SFCompletionItem completionItemForItem:completionItem];
        item.completionText = @"override func viewWillAppear(animated: Bool) {\nsuper.viewWillAppear(animated)\n<#code#>\n}";
        [filteredCompletionsAlpha replaceObjectAtIndex:index withObject:item];
        [self setFilteredCompletionsAlpha:[NSArray arrayWithArray:filteredCompletionsAlpha]];
    }
    
    return [self _sf_insertCurrentCompletion];
}

@end
