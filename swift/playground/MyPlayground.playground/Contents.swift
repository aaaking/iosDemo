import UIKit

import Foundation

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
