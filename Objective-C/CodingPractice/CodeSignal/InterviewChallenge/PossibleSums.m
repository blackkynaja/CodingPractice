/*
 https://app.codesignal.com/interview-practice/task/rMe9ypPJkXgk3MHhZ/description
 */

#import <Foundation/Foundation.h>

int possibleSums(NSMutableArray<NSNumber *> * coins, NSMutableArray<NSNumber *> * quantity) {
    NSMutableSet *sumSet = [[NSMutableSet alloc] init];
    [sumSet addObject:[NSNumber numberWithInt:0]];
    for (int i = 0; i < [coins count]; i++) {
        NSNumber *round = quantity[i];
        NSNumber *value = coins[i];
        NSArray *objects = [sumSet allObjects];
        for (int j = 1; j <= [round intValue]; j++) {
            for (int k = 0; k < [objects count]; k++) {
                [sumSet addObject:[NSNumber numberWithInt:j*[value intValue]+[objects[k] intValue]]];
            }
        }
    }
    
    int sum = (int)[sumSet count]-1;
    return sum;
}
