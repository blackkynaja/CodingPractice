/*
 https://app.codesignal.com/interview-practice/task/4MoqQLaw22nrzXbgs/description
 */

#import <Foundation/Foundation.h>

long modulo(NSInteger a, NSInteger n) {
    if (a < 0) {
        return (n - labs(a)%n);
    }
    return a%n;
}

int sumInRange(NSMutableArray<NSNumber *> * nums, NSMutableArray<NSMutableArray<NSNumber *> *> * queries) {
    NSInteger modNum = pow(10, 9) + 7;
    
    NSMutableArray *sums = [[NSMutableArray alloc] init];
    NSInteger sum = 0;
    for (NSNumber *num in nums) {
        sum += [num integerValue];
        [sums addObject:[NSNumber numberWithInteger:sum]];
    }
    
    sum = 0;
    for (NSMutableArray *querie in queries) {
        NSNumber *first = querie[0];
        NSNumber *second = querie[1];
        
        if ([first integerValue] == 0) {
            NSInteger index = [second integerValue];
            sum += [sums[index] integerValue];
        } else {
            NSInteger index1 = [first integerValue] - 1;
            NSInteger index2 = [second integerValue];
            sum = sum + [sums[index2] integerValue] - [sums[index1] integerValue];
        }
    }
    
    return (int)modulo(sum, modNum);
}
