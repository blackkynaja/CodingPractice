//
//  WordLadder.swift
//  Test
//
//  Created by Yutthapong Kawunruan on 2/12/22.
//

/*
 https://leetcode.com/problems/word-ladder/
 
 Topics: Hash Table, String, BFS
 */

class WordLadder {
    // MARK: - BFS + Set
    /*
     - Turn wordList array to Set (can do that because all items are unique)
     - Do BFS by adding next path if the current word "canTransform", increase depth, mark the next path as visited to prevent redundant
     - If next path is the begin word, return depth, otherwise return 0
     */
    func canTransform(_ word1: String, _ word2: String) -> Bool {
        var count = 0
        for (c1, c2) in zip(word1, word2) {
            if c1 != c2 {
                count += 1
            }
            if count > 1 {
                return false
            }
        }
        return count == 1
    }
    
    func ladderLength1(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
        var visited = Set<String>()
        var queue = [beginWord]
        var depth = 1
        var set = Set(wordList)
        
        while queue.count > 0 {
            var tempQ = [String]()
            let tempSet = set
            depth += 1
            
            for q in queue {
                set.remove(q)
                for word in Array(tempSet) {
                    if visited.contains(word) {
                        continue
                    }
                    if canTransform(q, word) {
                        if word == endWord {
                            return depth
                        }
                        visited.insert(word)
                        tempQ.append(word)
                    }
                }
            }
            queue = tempQ
        }
        
        return 0
    }
    
    // MARK: - BFS + Dict + Set
    /*
     - Create all possible transform word (like "hit" to "*it", "h*t", "hi*") and store transform one as a key and the word as a array of string
     - Do BFS, for the current path, find all transform, increase dept,
     - If dict contains the transform as key that means it has the next path, then add value of that key as the next path, if the next path is end word, return depth, otherwise return 0
     */
    func transfromString(_ word: String) -> [String] {
        let arr = Array(word)
        var transforms = [String]()
        
        for i in 0..<arr.count {
            var temp = arr
            temp[i] = "*"
            transforms.append(String(temp))
        }
        return transforms
    }
    
    func ladderLength2(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
        var queue = [beginWord]
        var dict = [String: [String]]()
        var visited = Set<String>()
        var depth = 1
        
        for word in wordList {
            let transforms = transfromString(word)
            for transform in transforms {
                if let _ = dict[transform] {
                    dict[transform]!.append(word)
                } else {
                    dict[transform] = [word]
                }
            }
        }
        
        while queue.count > 0 {
            var tempQ = [String]()
            depth += 1
            
            for q in queue {
                visited.insert(q)
                let transforms = transfromString(q)
                for transform in transforms {
                    if let words = dict[transform] {
                        for word in words {
                            if word == endWord {
                                return depth
                            }
                            if !visited.contains(word) {
                                tempQ.append(word)
                            }
                        }
                    }
                }
            }
            
            queue = tempQ
        }
        
        return 0
    }
    
    func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
        return ladderLength1(beginWord, endWord, wordList)
    }
}
