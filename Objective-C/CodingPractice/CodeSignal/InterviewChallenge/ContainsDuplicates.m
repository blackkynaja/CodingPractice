/*
 https://app.codesignal.com/interview-practice/task/CfknJzPmdbstXhsoJ/description
 */
#import <Foundation/Foundation.h>

BOOL containsDuplicates(NSMutableArray<NSNumber *> * a) {
    NSMutableSet *set = [[NSMutableSet alloc] init];
    
    for (NSNumber *number in a) {
        if ([set containsObject:number]) {
            return YES;
        }
        [set addObject:number];
    }
    return NO;
}
