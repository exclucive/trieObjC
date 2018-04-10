//
//  ViewController.m
//  Trie
//
//  Created by Igor Novik on 4/9/18.
//  Copyright © 2018 Appetize. All rights reserved.
//

#import "ViewController.h"
#import "Trie.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    Trie *trie = [[Trie alloc] init];
    [trie addNewWord:@"hack"];
    [trie addNewWord:@"hackerrank"];
    NSInteger numberofWords = [trie numberOfWordsWithPrefix:@"hac"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

    
@end
