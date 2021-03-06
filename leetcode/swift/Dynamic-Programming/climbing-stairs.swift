//
//  climbing-stairs.swift
//  leetcode
//
//  Created by tisfeng on 2020/10/29.
//

import Foundation


/**
0,1,1,2,3,5,8,11
 滚动数组，循环
 
 执行用时：4 ms, 在所有 Swift 提交中击败了74.77%的用户
 内存消耗：13.3 MB, 在所有 Swift 提交中击败了61.37%的用户
 */
class ClimbStairs {
    func climbStairs(_ n: Int) -> Int {
        var p = 0, q = 1, r = 1
        for i in 1...n {
            r = p + q
            p = q
            q = r
            print("i = \(i), r = \(r)")
        }
        return r
    }
}


/**
 递归，数组保存
 
 执行用时：4 ms, 在所有 Swift 提交中击败了75.39%的用户
 内存消耗：13.4 MB, 在所有 Swift 提交中击败了56.93%的用户
 */
class ClimbStairs_76 {
    var arr = Array(repeating: 0, count: 100)
    func climbStairs(_ n: Int) -> Int {
        if n < 3 {
            arr[n] = n
            return n
        }
        
        if arr[n] != 0 {
            return arr[n]
        }
        
        arr[n] = climbStairs(n - 1) + climbStairs(n - 2)
        return arr[n]
    }
}


/** 1,1,2,3,5,8,11
 数学通项公式求解（注意，斐波那契数列, n + 1）
 
 执行用时：4 ms, 在所有 Swift 提交中击败了74.19%的用户
 内存消耗：13.4 MB, 在所有 Swift 提交中击败了57.76%的用户
 */
class ClimbStairs_72 {
    func climbStairs(_ n: Int) -> Int {
        let sqrt5 = sqrt(5)
        let fibn = pow((1 + sqrt5) / 2, Double(n + 1)) -
            pow((1 - sqrt5) / 2, Double(n + 1))
        
        return Int(fibn / sqrt5)
    }
}





/**
 递归，内部函数
 
 执行用时：4 ms, 在所有 Swift 提交中击败了74.77%的用户
 内存消耗：13.3 MB, 在所有 Swift 提交中击败了64.26%的用户
 */
class ClimbStairs_74 {
    func climbStairs(_ n: Int) -> Int {
        var cache = [Int](repeating: 0, count: n + 1)
        
        func dfs(_ n: Int) -> Int {
            if cache[n] != 0 {
                return cache[n]
            }
            if n <= 2 {
                return n
            }
            cache[n] = dfs(n - 1) +  dfs(n - 2)
            
            return cache[n]
        }
        
        return dfs(n)
    }
}

/**
 递归，字典保存

 执行用时：4 ms, 在所有 Swift 提交中击败了75.39%的用户
 内存消耗：13.5 MB, 在所有 Swift 提交中击败了56.93%的用户
 */
class ClimbStairs_75 {
    var map = [Int: Int]()
    func climbStairs(_ n: Int) -> Int {
        if n < 3 {
            map[n] = n
            return n
        }
        
        if let count = map[n] {
            return count
        }
        
        let count = climbStairs(n - 1) + climbStairs(n - 2)
        map[n] = count
        print("map[\(n)] = \(map[n]!)")
        return count
    }
}


/**
 直接递归，超时
 */
class Solution0 {
    func climbStairs(_ n: Int) -> Int {
        if n <= 2 {
            return n
        }
        return climbStairs(n - 1) + climbStairs(n - 2)
    }
}
