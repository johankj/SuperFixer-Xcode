//
//  SFCompletionItem.m
//  SuperFixer
//
//  Created by Johan K. Jensen on 14/10/2015.
//  Copyright © 2015 Johan K. Jensen. All rights reserved.
//

#import "SFCompletionItem.h"

@implementation SFCompletionItem {
    id<DVTTextCompletionItem> _item;
    NSString * _completionText;
}

@dynamic displayType, icon, displayText, descriptionText, priority, notRecommended, parentText, name;

+ (instancetype)completionItemForItem:(id<DVTTextCompletionItem>)item {
    SFCompletionItem * ret = [SFCompletionItem new];
    ret->_item = item;

    NSString * completionText = item.completionText;
    ret->_completionText = completionText;
    return ret;
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    return _item;
}

- (NSString *)completionText {
    return _completionText;
}

- (void)setCompletionText:(NSString*)completionText {
    _completionText = completionText;
}

@end
