//
//  NSString+Trie.m
//  Trie
//
//  Created by Igor Novik on 2018-04-09.
//  Copyright © 2018 Appetize. All rights reserved.
//

#import "NSString+Trie.h"

@implementation NSString (Trie)

- (NSArray *)arrayOfLetters {
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:self.length];
    for (int i = 0; i < self.length; i++) {
        [array addObject:[self substringWithRange:NSMakeRange(i, 1)]];
    }
    
    return [NSArray arrayWithArray:array];
}

@end
