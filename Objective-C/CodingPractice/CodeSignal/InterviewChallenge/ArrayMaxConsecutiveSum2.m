/*
 https://app.codesignal.com/interview-practice/task/dQD4TCunke2JQ98rj/description
 */

#import <Foundation/Foundation.h>

int arrayMaxConsecutiveSum2(NSMutableArray<NSNumber *> * inputArray) {
    NSInteger max = [inputArray[0] integerValue];
    NSInteger startIndex = 0;
    NSInteger endIndex = 0;
    NSInteger tempIndex = 0;
    NSInteger currentSum = 0;
    
    for (NSInteger i = 0; i < [inputArray count]; i++) {
        NSInteger currentValue = [inputArray[i] integerValue];
        currentSum += currentValue;
        
        if (currentSum < 0) {
            currentSum = 0;
            tempIndex = i + 1;
            if (max < currentValue) {
                max = currentValue;
            }
        } else if (max < currentSum) {
            max = currentSum;
            startIndex = tempIndex;
            endIndex = i;
        }
        
    }
    return (int)max;
}
