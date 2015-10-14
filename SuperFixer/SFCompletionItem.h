//
//  SFCompletionItem.h
//  SuperFixer
//
//  Created by Johan K. Jensen on 14/10/2015.
//  Copyright © 2015 Johan K. Jensen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XcodeHeaders/DVTTextCompletionItem-Protocol.h"

@interface SFCompletionItem : NSObject <DVTTextCompletionItem>
+ (instancetype) completionItemForItem: (id<DVTTextCompletionItem>) item;
- (void)setCompletionText:(NSString*)completionText;
@end
