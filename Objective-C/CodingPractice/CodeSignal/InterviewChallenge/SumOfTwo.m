/*
 https://app.codesignal.com/interview-practice/task/Hm98RnqK9Be575yoj/description
 */

#import <Foundation/Foundation.h>

BOOL sumOfTwo(NSMutableArray<NSNumber *> * a, NSMutableArray<NSNumber *> * b, int v) {
     NSMutableSet *set = [[NSMutableSet alloc] init];
     
     for (NSNumber *number in a) {
         int num = v - [number intValue];
         [set addObject:[NSNumber numberWithInt:num]];
     }
     
     for (NSNumber *number in b) {
         if ([set containsObject:number]) {
             return YES;
         }
     }
     
     return NO;
 }
