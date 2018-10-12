//
//  UserInfo.swift
//  swift2
//
//  Created by 周智慧 on 2018/10/7.
//  Copyright © 2018 周智慧. All rights reserved.
//

import UIKit

class UserInfo: NSObject, NSCoding {
    
    var name: String
    var phone: String
    
    required init(name: String = "", phone: String = "") {
        self.name = name
        self.phone = phone
    }
    
    required init(coder decoder: NSCoder) {
        self.name = decoder.decodeObject(forKey: "name") as? String ?? ""
        self.phone = decoder.decodeObject(forKey: "phone") as? String ?? ""
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(self.name, forKey: "name")
        coder.encode(phone, forKey: "phone")
    }
}
