/*
 https://leetcode.com/problems/design-add-and-search-words-data-structure/
 
 Topics: String, DFS, Design, Trie
 */

class DesignAddandSearchWordsDataStructure {
    
    let endChar = Character("0")
    var trie = TrieNode()
    
    /** Initialize your data structure here. */
    init() {
        
    }
    
    func addWord(_ word: String) {
        var node = trie
        for c in word {
            if let child = node.childs[c] {
                node = child
            } else {
                let newNode = TrieNode()
                node.childs[c] = newNode
                node = newNode
            }
        }
        node.childs[endChar] = TrieNode()
    }
    
    func dfs(_ word: [String.Element], _ startIndex: Int, _ trieNode: TrieNode) -> Bool {
        if startIndex == word.count && trieNode.get(endChar) != nil {
            return true
        }
        
        var node = trieNode
        for i in startIndex..<word.count {
            let c = word[i]
            if let child = node.childs[c] {
                node = child
            } else if c == "." {
                for (_, child) in node.childs {
                    let result = dfs(word, i+1, child)
                    if result == true {
                        return true
                    }
                }
                return false
            } else {
                return false
            }
        }
        
        return node.get(endChar) != nil
    }
    
    func search(_ word: String) -> Bool {
        return dfs(Array(word), 0, trie)
    }
}
