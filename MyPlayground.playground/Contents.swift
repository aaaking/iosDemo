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
var array1: Array<String> = ["zxy", "hz"]
var array2: [Any] = ["0", "1", "2", "3", "4", "5", "6", "7", 8]
array2.removeSubrange(1...1)
array2[1...3] = ["1", "2", "3"]
print(array2)
//print(array1 + array2)
print("------元组tuple------")
var num = (name: "zzh", age: 12, width: 23, height: 173)
var (name, age, height) = ("zzh", 17, 170)
var num2 = num
num2.0 = "fffffff"
print(num)
print(num2)
print("------字典dictionary------")
var dic: [String: Any] = ["a":"aV", "b":"bV", "c":"cV"]
for (k, v) in dic {
    print("key \(k) and value is \(v) and dic[k]! is \(dic[k]!)")
}

print("------闭包------")
var closureA = {
    print("print closureA")
}
closureA()
var closureAdd:(Int, Int)->(Int) = {
    (a:Int, b:Int)->Int in
    a + b//return 可以忽略
}
print(closureAdd(2,3))
func text(name: String, block: ()->(Void)) {
    print(name)
    block()
}
text(name: "我来送外卖", block: {print("开吃外卖")})
print("----------类class---------")

/**
 属性跟特定的类、结构体、枚举有关联
 计算属性可用于类、结构体、枚举中
 存储属性只能用于类和结构体
 属性分为存储属性、计算属性、类型属性(一个类只会有一份，多个实例对象共享这个类型属性)、延迟属性(lazy只有在使用到的时候才加载到内存中)
 用class关键字修饰的属性就是类型属性，只能是计算属性不能是存储属性
 */
class Person {
    var alias: String = String.init()
    var name: String = "f"
    var age: Int = 20
    func minuse(_ a: Int, _ b: Int) -> Int {
        return a - b
    }
    static var TYPE = 1
    //类属性
    class var PI: Double {
        return 3.1415926
    }
    class var URL_BASE: String { return "http://www.baidu.com" }
    //类方法
    class func add(a: Int, b: Int) -> (Int) {
        return a + b
    }
    init(age: Int) {
    }
    convenience init (name: String) {
        self.init(age: 3)
    }
    func setAge(ageP: Int) -> Void {
        self.age = ageP
    }
}
extension Person : ObjcPro {
    func extenAdd(a: Int, b: Int) -> Int {
        return a * b
    }
}
//--------------struct--------------
struct Zzh {
    var x = 1
    mutating func setX(xP: Int) -> Void {
        self.x = xP
    }
}
//--------------protocol--------------
protocol Pro {
    var fff: String{get set}
    static var number: Int {get}
    init(name: String)
}
//可选协议只能被类实现
@objc protocol ObjcPro {
    @objc optional func add()
}

class DDDF : ObjcPro {
}

