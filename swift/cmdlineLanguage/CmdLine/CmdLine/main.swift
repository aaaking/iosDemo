
import Foundation

enum PrinterError: Error {
    case outOfPaper
    case noToner
    case onFire
}

func send(job: Int, toPrinter printerName: String) throws -> String {
    if printerName == "Never Has Toner" {
        throw PrinterError.noToner
    }
    return "Job sent"
}


struct Person {
    var age = 1
}

class Test {
    var shoppingList: [Int] = [1, 2, 3]
    
    var occupations: [String:String] = [:]

    func test() {
        let fs = shoppingList.map{ number in
            3 * number
        }
        print("fs=\(fs)")
    }
    
}

func main() {
    let test = Test()
    test.test()
    
}

main()


var fridgeIsOpen = false
let fridgeContent = ["milk", "eggs", "leftovers"]

func fridgeContains(_ food: String) -> Bool {
    fridgeIsOpen = true
    defer {
        fridgeIsOpen = false
        print("2222=fridgeIsOpen\(fridgeIsOpen)")
    }
    
    let result = fridgeContent.contains(food)
    print("1111resulkt=\(result)")
    return result
}
fridgeContains("banana")
print(fridgeIsOpen)
