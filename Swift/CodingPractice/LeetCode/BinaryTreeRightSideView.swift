/*
 https://leetcode.com/problems/binary-tree-right-side-view/
 */

//Definition for a binary tree node.
class BinaryTreeRightSideView {
    func rightSideViewHelper(_ root: TreeNode?,_ level: Int) -> [[Int:Int]] {
        guard let tree = root else { return [[Int:Int]]() }
        var result = [[Int:Int]]()
        result.append([tree.val:level])
        if let rightTree = tree.right {
            result += rightSideViewHelper(rightTree, level+1)
        }

        if let leftTree = tree.left {
            result += rightSideViewHelper(leftTree, level+1)
        }
        return result
    }

    func rightSideView(_ root: TreeNode?) -> [Int] {
        let dicts = rightSideViewHelper(root, 0)
        var setLevel = Set<Int>()
        var results = [Int]()
        
        for dict in dicts {
            if !setLevel.contains(dict.values.first!) {
                results.append(dict.keys.first!)
                setLevel.insert(dict.values.first!)
            }
        }
        
        return results
    }
}
