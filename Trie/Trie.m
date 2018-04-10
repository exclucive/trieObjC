//
//  Trie.m
//  Trie
//
//  Created by Igor Novik on 4/9/18.
//  Copyright © 2018 Appetize. All rights reserved.
//

#import "Trie.h"

@interface TrieNode: NSObject

@property (nonatomic, assign) char data;
@property (nonatomic, strong) NSMutableDictionary *children;
@property (nonatomic, assign) BOOL isTerminating;

@end

@implementation TrieNode

- (instancetype)init:(char)data terminating:(BOOL)terminating {
    self = [super init];
    if (self) {
        _data = data;
        _isTerminating = terminating;
    }
    return self;
}

@end


@interface Trie()
@property (nonatomic, strong) TrieNode *root;
@end

@implementation Trie

- (instancetype)init {
    self = [super init];
    if (self) {
        _root = [[TrieNode alloc] init];
    }
    
    return self;
}

- (TrieNode *)lastNodeForWord:(NSString *)word {
    const char *characters = [word UTF8String];
    int lettersCount = sizeof(characters);
    TrieNode *currentNode = self.root;
    int counter = 0;
    
    while (counter < lettersCount) {
        NSNumber *c = @(characters[counter]);
        
        TrieNode *tmpNode = currentNode.children[c];
        if (tmpNode) {
            currentNode = tmpNode;
        }
        else {
            break;
        }
        
        counter++;
    }
    
    return currentNode;
}

- (void)addNewWord:(NSString *)word {
    const char *characters = [word UTF8String];
    int lettersCount = sizeof(characters);
    
    TrieNode *currentNode = self.root;
    int counter = 0;
    
    while (counter < lettersCount) {
        char c = characters[counter];
        NSNumber *cObj = @(c);
        
        TrieNode *tmpNode = currentNode.children[cObj];
        if (tmpNode) {
            currentNode = tmpNode;
        }
        else {
            BOOL terminating = (counter == lettersCount - 1) ? YES : NO;
            TrieNode *newNode = [[TrieNode alloc] init:c terminating:terminating];
            [currentNode.children setObject:newNode forKey:cObj];
            currentNode = newNode;
        }
        counter++;
    }
}

- (NSUInteger)numberOfWordsWithPrefix:(NSString *)prefix {
    TrieNode *lastNode = [self lastNodeForWord:prefix];
    
    NSUInteger numberOfWords = [self numberOfWordsForNode:lastNode];
    if (lastNode.isTerminating) {
        numberOfWords += 1; 
    }
    
    return numberOfWords;
}

- (NSUInteger)numberOfWordsForNode:(TrieNode *)node {
    NSArray *children = node.children.allValues;
    NSUInteger numberOfWords = 0;
    
    for (TrieNode *child in children) {
        if (child.isTerminating) {
            numberOfWords += 1;
        }
        numberOfWords = [self numberOfWordsForNode:child];
    }
    
    return numberOfWords;
}

@end
