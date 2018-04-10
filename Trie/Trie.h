//
//  Trie.h
//  Trie
//
//  Created by Igor Novik on 4/9/18.
//  Copyright © 2018 Appetize. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Trie : NSObject

//
- (void)addNewWord:(NSString *)word;
- (NSUInteger)numberOfWordsWithPrefix:(NSString *)prefix;

@end
