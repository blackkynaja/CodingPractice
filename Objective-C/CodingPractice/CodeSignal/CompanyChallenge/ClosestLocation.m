/*
 Company: Uber
 https://app.codesignal.com/company-challenges/uber/aPzqJJmy7xWi5zHmi
 */

#import <Foundation/Foundation.h>

CGFloat findMin(CGFloat x, CGFloat y) {
    if (x > y) {
        return y;
    }
    return x;
}

CGFloat findMax(CGFloat x, CGFloat y) {
    if (x < y) {
        return y;
    }
    return x;
}

CGFloat distanceBetweenPointAndLine(NSArray *points, NSArray *point) {
    NSPoint p = NSMakePoint([point[0] floatValue], [point[1] floatValue]);
    
    NSPoint l1 = NSMakePoint([points[0] floatValue], [points[1] floatValue]);
    NSPoint l2 = NSMakePoint([points[2] floatValue], [points[3] floatValue]);
    
    CGFloat distance = 0.0;
    
    if ((p.x >= findMin(l1.x, l2.x) && p.x <= findMax(l1.x, l2.x)) || (p.y >= findMin(l1.y, l2.y) && p.y <= findMax(l1.y, l2.y))) {
        if (l1.y == p.y && l2.y == p.y) {
            if (p.x >= findMin(l1.x, l2.x) && p.x <= findMax(l1.x, l2.x)) {
                return 0.0;
            }
            return fabs(findMin(fabs(l1.x), fabs(l2.x))-p.x);
        }
        
        if (l1.x == p.x && l2.x == p.x) {
            if (p.y >= findMin(l1.y, l2.y) && p.y <= findMax(l1.y, l2.y)) {
                return 0.0;
            }
            return fabs(findMin(fabs(l1.y), fabs(l2.y))-p.y);
        }
        
        CGFloat a = l1.y - l2.y;
        CGFloat b = l2.x - l1.x;
        CGFloat c = l1.x*l2.y - l2.x*l1.y;
        
        distance = fabs(a*p.x + b*p.y + c)/sqrtf(a*a+b*b);
    } else {
        CGFloat distanceFromL1 = sqrtf((p.x-l1.x)*(p.x-l1.x)+(p.y-l1.y)*(p.y-l1.y));
        CGFloat distanceFromL2 = sqrtf((p.x-l2.x)*(p.x-l2.x)+(p.y-l2.y)*(p.y-l2.y));
        distance = findMin(distanceFromL1, distanceFromL2);
    }
    
//    NSLog(@"%f",distance);
    return distance;
}

CGFloat distanceBetweenTwoPoint(NSArray *point1, NSArray *point2) {
    NSPoint p1 = NSMakePoint([point1[0] floatValue], [point1[1] floatValue]);
    NSPoint p2 = NSMakePoint([point2[0] floatValue], [point2[1] floatValue]);
    
    return sqrtf((p1.x-p2.x)*(p1.x-p2.x)+(p1.y-p2.y)*(p1.y-p2.y));
}

BOOL findMatchStringHelper(NSString *pattern, NSString *word, NSUInteger startIndex, BOOL canSkipp) {
    NSUInteger wordLength = word.length;
    unichar bufferWord[wordLength+1];
    [word getCharacters:bufferWord range:NSMakeRange(0, wordLength)];
    
    NSUInteger patternLength = pattern.length;
    unichar bufferPattern[pattern.length+1];
    [pattern getCharacters:bufferPattern range:NSMakeRange(0, patternLength)];
    
    NSUInteger patternIndex = canSkipp ? 0 : 1;
    NSUInteger wordIndex = startIndex;
    
    while (patternIndex < patternLength) {
        if (bufferPattern[patternIndex] == bufferWord[wordIndex]) {
            patternIndex++;
            wordIndex++;
        } else {
            if (canSkipp) {
                patternIndex++;
                canSkipp = NO;
            } else {
                return NO;
            }
        }
    }
    
    return YES;
}

BOOL findMatchString(NSString *pattern, NSString *word) {
    pattern = [pattern lowercaseString];
    word = [word lowercaseString];
    NSUInteger wordLength = word.length;
    unichar bufferWord[wordLength+1];
    [word getCharacters:bufferWord range:NSMakeRange(0, wordLength)];
    
    NSUInteger patternLength = pattern.length;
    unichar bufferPattern[pattern.length+1];
    [pattern getCharacters:bufferPattern range:NSMakeRange(0, patternLength)];

    for(NSUInteger i = 0; i < 3; i++) {
        BOOL isMatch = NO;
        if (bufferWord[i] == bufferPattern[0]) {
            isMatch = findMatchStringHelper(pattern, word, i, YES);
        } else if (bufferWord[i] == bufferPattern[1]) {
            isMatch = findMatchStringHelper(pattern, word, i, NO);
        }
        
        if (isMatch) {
            return YES;
        }
    }
    
    return NO;
}

NSString * closestLocation(NSString * address, NSMutableArray<NSMutableArray<NSNumber *> *> * objects, NSMutableArray<NSString *> * names) {
    NSMutableArray *matchIndex = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < [objects count]; i++) {
        NSString *name = names[i];
        if (findMatchString(address, name)) {
            [matchIndex addObject:[NSNumber numberWithInteger:i]];
        }
    }
    
    NSMutableArray *distanceMatchIndex = [[NSMutableArray alloc] initWithCapacity:[matchIndex count]];
    for (NSNumber *indexNumber in matchIndex) {
        NSInteger index = [indexNumber integerValue];
        NSArray *object = objects[index];
        NSArray *riderPoint = @[@0,@0];
        if ([object count] == 2) {
            CGFloat distance = distanceBetweenTwoPoint(riderPoint, object);
            [distanceMatchIndex addObject:[NSNumber numberWithFloat:distance]];
        } else {
            CGFloat distance = distanceBetweenPointAndLine(object, riderPoint);
            [distanceMatchIndex addObject:[NSNumber numberWithFloat:distance]];
        }
    }
    
    NSLog(@"%@",matchIndex);
    NSLog(@"%@",distanceMatchIndex);
    if ([distanceMatchIndex count] > 0) {
        CGFloat minValue = [distanceMatchIndex[0] floatValue];
        NSInteger index = 0;
        for (NSInteger i = 1; i < [distanceMatchIndex count]; i++) {
            NSNumber *number = distanceMatchIndex[i];
            if ([number floatValue] < minValue) {
                minValue = [number floatValue];
                index = i;
            }
        }
        NSInteger minIndex = [matchIndex[index] integerValue];
        return names[minIndex];
    } else {
        return @"";
    }
}
