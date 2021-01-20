/*
 https://app.codesignal.com/interview-practice/task/izLStwkDr5sMS9CEm/description
 */

#import <Foundation/Foundation.h>

NSMutableArray<NSNumber *> * findLongestSubarrayBySum(int s, NSMutableArray<NSNumber *> * arr) {
    NSInteger startIndex = 0, startSubIndex = -1;
    NSInteger endIndex = 0, endSubIndex = -1;
    NSInteger currentSum  = 0;
    NSMutableArray *subArray = [[NSMutableArray alloc] init];
    BOOL isFounded = NO;
    if ([arr count] > 0) {
        currentSum = [[arr firstObject] integerValue];
        [subArray addObject:[arr firstObject]];
    } else {
        return [NSMutableArray arrayWithObject:@-1];
    }
    while (YES) {
        NSLog(@"%li %li :%li",(long)startIndex,(long)endIndex,(long)currentSum);
        if (endIndex < [arr count]) {
            if (currentSum <= s) {
                if (currentSum == s) {
                    if (!isFounded) {
                        endSubIndex = endIndex;
                        startSubIndex = startIndex;
                    } else {
                        if (endIndex - startIndex > endSubIndex - startSubIndex) {
                            endSubIndex = endIndex;
                            startSubIndex = startIndex;
                        }
                    }
                    isFounded = YES;
                }
                endIndex++;
                if (endIndex < [arr count]) {
                    currentSum += [arr[endIndex] integerValue];
                }
            } else {
                if (startIndex <= endIndex) {
                    currentSum -= [arr[startIndex] integerValue];
                    startIndex++;
                }
            }
        } else {
            break;
        }
    }
    
    if (isFounded) {
        return [NSMutableArray arrayWithArray:@[@(startSubIndex+1), @(endSubIndex+1)]];
    }
    return [NSMutableArray arrayWithObject:@-1];
}
