/*
 https://app.codesignal.com/interview-practice/task/rak3HBvHDAjHRkTCW/description
 */

#import <Foundation/Foundation.h>

NSString * adjustSpace(NSArray *words, int l, int spaceCount, BOOL isLast) {
    NSLog(@"%@, %i, %i", words,l,spaceCount);
    int wordSpace = (int)[words count]-1;
    if (wordSpace <= 0) {
        wordSpace = 1;
    }
    int space = (l-spaceCount)/wordSpace;
    int extraSpace = (l-spaceCount)%wordSpace;
    if (isLast) {
        space = 1;
        extraSpace = 0;
    }
    NSMutableString *spaceString = [[NSMutableString alloc] initWithString:@""];
    for (NSString *word in words) {
        [spaceString appendString:word];
        for (int i = 0; i < space && [spaceString length] < l; i++) {
            [spaceString appendString:@" "];
        }
        if (extraSpace > 0) {
            [spaceString appendString:@" "];
            extraSpace--;
        }
    }
    int length = (int)[spaceString length];
    if (length < l) {
        for (int i = 0; i < l-length; i++) {
            [spaceString appendString:@" "];
        }
    }
    return (NSString *)spaceString;
}

NSMutableArray<NSString *> * textJustification(NSMutableArray<NSString *> * words, int l) {
    NSMutableArray *array = [[NSMutableArray alloc] init];
    NSMutableArray *temp = [[NSMutableArray alloc] init];
    int spaceCount = 0;
    for (int i = 0; i < [words count]; i++) {
        int length = (int)[words[i] length];
        if (length + spaceCount + [temp count] <= l) {
            spaceCount += length;
            [temp addObject:words[i]];
        } else {
            NSLog(@"c %i",spaceCount);
            int space = (int)[temp count]-1;
            if (space == 0) {
                space = 1;
            }
            [array addObject:adjustSpace(temp, l, spaceCount, NO)];
            [temp removeAllObjects];
            spaceCount = (int)[words[i] length];
            [temp addObject:words[i]];
        }
    }
    
    if ([temp count] > 0) {
        int space = (int)[temp count]-1;
        if (space == 0) {
            space = 1;
        }
        [array addObject:adjustSpace(temp, l, spaceCount, YES)];
    }

    return array;
}
