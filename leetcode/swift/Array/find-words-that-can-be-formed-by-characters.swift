//
//  find-words-that-can-be-formed-by-characters.swift
//  leetcode
//
//  Created by tisfeng on 2020/12/5.
//

import Foundation


/**
 1160. 拼写单词 https://leetcode-cn.com/problems/find-words-that-can-be-formed-by-characters/
 
 输入：words = ["cat","bt","hatt","tree"], chars = "atach"
 输出：3
 解释：
 可以形成字符串 "cat"，所以答案是 3
 */

/**
 双哈希表，比对
 
 执行用时：368 ms, 在所有 Swift 提交中击败了36.36%的用户
 内存消耗：14.2 MB, 在所有 Swift 提交中击败了63.64%的用户
 */
class CountCharacters {
    func countCharacters(_ words: [String], _ chars: String) -> Int {
        var count = 0
        let charsMap = mapFromChars(chars)
        
        for word in words {
            if word.count > chars.count {
                continue
            }
            var canSpell = true
            let wordMap = mapFromChars(word)
            for key in wordMap.keys {
                if charsMap[key] == nil || charsMap[key]! < wordMap[key]! {
                    canSpell = false
                    break
                }
            }
            if canSpell {
                count += word.count
            }
        }
        
        return count
    }
    
    /// 获取字符串的哈希表
    func mapFromChars(_ chars: String) -> [Character: Int] {
        var charsMap = [Character: Int]()
        for char in chars {
            charsMap[char] = (charsMap[char] ?? 0) + 1
        }
        
        return charsMap
    }
}

/**
 哈希表
 
 执行用时：280 ms, 在所有 Swift 提交中击败了36.36%的用户
 内存消耗：14.4 MB, 在所有 Swift 提交中击败了45.45%的用户
 */
class CountCharacters_36 {
    func countCharacters(_ words: [String], _ chars: String) -> Int {
        var count = 0
        var map = [Character: Int]()
        for char in chars {
            let value = map[char]
            if value != nil {
                map[char] = value! + 1
            } else {
                map[char] = 1
            }
        }
        
        for word in words {
            if word.count > chars.count {
                continue
            }
            var k = 0
            var tempMap = map
            for char in word {
                let charCount = tempMap[char]
                if charCount != nil && charCount! > 0 {
                    tempMap[char] = charCount! - 1
                    k += 1
                    if k == word.count {
                        count += word.count
                    }
                } else {
                    break;
                }
            }
        }
        
        return count
    }
}
