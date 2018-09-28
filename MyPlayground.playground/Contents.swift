//: Playground - noun: a place where people can play

import UIKit

var grade = 60
switch grade {
case 0...60:
    print("not pass")
//    fallthrough
case 60..<90:
    print("good")
    fallthrough
case 90..<99:
    print("excellent")
    fallthrough
case 99..<100:
    print("excellent222")
    fallthrough
default:
    print("nil")
}

print("----string demo---")
var strA = "1234567"
var strB = "89"
var str = String(format: "%@%@", strA, strB)
var strIndex = str.index(str.startIndex, offsetBy: 3)
var strIndex2 = str.index(str.endIndex, offsetBy: -2)
print(str.substring(to: strIndex))
print(str.substring(from: strIndex))
let range = strIndex..<strIndex2
print(str.substring(with: range))
print("----use NSString---")
print((str as NSString).substring(to: 3))
print((str as NSString).substring(from: 3))
print((str as NSString).substring(with: NSRange.init(location: 2, length: 4)))
// MARK: replace and insert
str.replacingOccurrences(of: "2", with: "eee")
str.insert("x", at: strIndex2)
// MARK: remove
//str.remove(at: strIndex)
//str.removeSubrange(strIndex...str.index(str.endIndex, offsetBy: -2))
//str.hasPrefix("1")
//str.hasSuffix("9")
// MARK: 数组Array
print("------数组Array------")
let array1: Array<String> = ["zxy", "hz"]
var array2: [Any] = ["0", "1", "2", "3", "4", "5", "6", "7", 8]
array2.removeSubrange(1...1)
array2[1...3] = ["1", "2", "3"]
print(array2)
//print(array1 + array2)
print("------元组tuple------")
var num = (name: "zzh", age: 12, width: 23, height: 173)
var (name, age, height) = ("zzh", 17, 170)
num.0
num.name
print(num)
print("------字典dictionary------")
var dic: [String: Any] = ["a":"aV", "b":"bV", "c":"cV"]
for (k, v) in dic {
    print("key \(k) and value is \(v) and dic[k]! is \(dic[k]!)")
}
