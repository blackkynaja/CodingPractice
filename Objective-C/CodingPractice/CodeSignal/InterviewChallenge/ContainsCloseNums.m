/*
 https://app.codesignal.com/interview-practice/task/njfXsvjRthFKmMwLC/description
 */

#import <Foundation/Foundation.h>

BOOL containsCloseNums(NSMutableArray<NSNumber *> * nums, int k) {
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    for (int i = 0; i < [nums count]; i++) {
        NSNumber *index = [dict objectForKey:[nums[i] stringValue]];
        if (index != nil) {
            if (i - [index intValue] <= k) {
                return YES;
            } else {
                NSString *key = [nums[i] stringValue];
                [dict setValue:[NSNumber numberWithInt:i] forKey:key];
            }
        } else {
            NSString *key = [nums[i] stringValue];
            [dict setValue:[NSNumber numberWithInt:i] forKey:key];
        }
    }
    return NO;
}
