//
//  Tab1.swift
//  swift2
//
//  Created by 周智慧 on 2018/10/7.
//  Copyright © 2018 周智慧. All rights reserved.
//

import UIKit

class Tab1: UIViewController {
    var dataModel = DataModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        createData()
        self.view.backgroundColor = UIColor.red
        self.navigationItem.title = "nav1"
        self.title = "homehome"
        // Do any additional setup after loading the view.
        let statusBarHeight = UIApplication.shared.statusBarFrame.size.height // 20
        let navBarHeight = self.navigationController?.navigationBar.frame.size.height ?? 0 // 44
        let btnSaveData = UIButton(frame: CGRect(x: 0, y: statusBarHeight + navBarHeight, width: 50, height: 0))//UIApplication.shared.keyWindow!.safeAreaInsets.top
        btnSaveData.setTitle("saveData", for: UIControl.State.normal)
        btnSaveData.backgroundColor = UIColor.blue
        btnSaveData.sizeToFit()
        btnSaveData.addTarget(self, action: #selector(clickSave), for: .touchUpInside)
        self.view.addSubview(btnSaveData)
        //
        let btnRead = UIButton(frame: CGRect(x: btnSaveData.frame.origin.x + btnSaveData.frame.size.width + 5, y: statusBarHeight + navBarHeight, width: 0, height: 0))
        btnRead.setTitle("readData", for: UIControl.State.normal)
        btnRead.sizeToFit()
        btnRead.backgroundColor = UIColor.green
        btnRead.addTarget(self, action: #selector(clickRead), for: .touchUpInside)
        self.view.addSubview(btnRead)
        //
        let btn1 = UIButton(frame: CGRect(x: btnRead.frame.origin.x + btnRead.frame.size.width + 5, y: statusBarHeight + navBarHeight, width: 0, height: 0))
        btn1.setTitle("页面跳转", for: .normal)
        btn1.addTarget(self, action: #selector(jumpPage), for: .touchUpInside)
        self.view.addSubview(btn1)
    }
    
    @objc func clickSave() {
        dataModel.saveData()
    }

    @objc func clickRead() {
        dataModel.loadData()
    }
    
    func createData() {
        dataModel.userList.append(UserInfo(name: "zzh1", phone: "1311111111"))
        dataModel.userList.append(UserInfo(name: "zzh2", phone: "1311111112"))
        dataModel.userList.append(UserInfo(name: "zzh3", phone: "1311111113"))
        dataModel.userList.append(UserInfo(name: "zzh4", phone: "1311111114"))
    }
    
    @objc func jumpPage() {
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
