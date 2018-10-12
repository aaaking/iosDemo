//
//  DataModel.swift
//  swift2
//
//  Created by 周智慧 on 2018/10/7.
//  Copyright © 2018 周智慧. All rights reserved.
//

import UIKit

class DataModel: NSObject {
    var userList = [UserInfo]()
    
    override init() {
        super.init()
        print("沙盒路径\(documentDirectory())")
        print("文件路径\(dataFilePath())")
        print("userList类型\(type(of: userList))")
    }
    
    func saveData() {
//        let data = NSMutableData()
//        let archiver = NSKeyedArchiver.init(forWritingWith: data)
//        archiver.encode(userList, forKey: "userList")
//        archiver.finishEncoding()
//        data.write(toFile: dataFilePath(), atomically: true)
        var identifyInfoModel = String()
        let userNotificationSavedPath = ""
        NSKeyedArchiver.archiveRootObject(identifyInfoModel, toFile:userNotificationSavedPath)

        
        
        
        let coder = NSKeyedArchiver(requiringSecureCoding: false)
        coder.encode(userList, forKey: "userList")
        coder.finishEncoding()
        let data = coder.encodedData
        print("coder.encodedData ------\(data)--type--\(type(of: data))")
        try! data.write(to: URL(fileURLWithPath: dataFilePath()))
    }
    
    func loadData() -> Void {
        let path = self.dataFilePath()
        let defaultManager = FileManager()
        //通过文件地址判断数据是否存在
        let fileExists = defaultManager.fileExists(atPath: path)
        print("----fileExists---\(fileExists)")
        if (fileExists) {
            //read data
            let url = URL(fileURLWithPath: path)
            let data = try! Data(contentsOf: url)
//            let unarchiver2 = NSKeyedUnarchiver(forReadingWith: data)
//            userList = unarchiver2.decodeObject(forKey: "userList") as? Array ?? [UserInfo(name: "del", phone: "1")]
            
            let unarchiver = try! NSKeyedUnarchiver.init(forReadingFrom: data)
            unarchiver.requiresSecureCoding = false
            userList = unarchiver.decodeObject(forKey: "userList") as? Array ?? [UserInfo(name: "del", phone: "1")]
            print("load data ------\(userList)---\(userList.count)---\(userList[0].name)")
            
            
        }
    }
    
    //获取沙盒文件夹路径
    func documentDirectory() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documentDirectory = paths.first
        return documentDirectory ?? ""
    }
    
    func dataFilePath() -> String {
        return documentDirectory().appendingFormat("/userList.plist")
    }
}
