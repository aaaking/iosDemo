
import Foundation

// 重新实现 Swift 标准库中的可选类型
enum OptionalValue<Wrapped> {
    case none
    case some(Wrapped)
}

func anyCommonElements<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> [T.Element]
    where T.Element: Equatable, T.Element == U.Element
{
    var arr: [T.Element] = []
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                arr.append(lhsItem)
            }
        }
    }
    return arr
}


func main() {
    var possibleInteger1: OptionalValue<Int> = .none;
    var possibleInteger2: OptionalValue<Int> = .some(100);
    print("1=\(possibleInteger1) 2=\(possibleInteger2)")
    
    var aaa1 = anyCommonElements([1, 2, 3], [3, 4, 5])
    var aaa2 = anyCommonElements("abc", "cde")
    print("aaa1=\(aaa1)")
    print("aaa2=\(aaa2)")

    var airports = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
    airports["YYZ"] = nil;
    print("airports=\(airports)")
    var code = String("i = 3.1415926\n    print(\"pi=\\(pi)\")\n    var aaa = \"hello\"")
    print("zzht\(code)")
}

func greet(person: [String: String]) -> Void {
    guard let name = person["name"] else {
        return
    }
    print("Hello \(name)!")
}

func makeArray<Item>(fdd item: Item, numberOfTimes: Int) -> [Item] {
    var result: [Item] = []
    for _ in 0..<numberOfTimes {
        result.append(item)
    }
    return result
}


main()

