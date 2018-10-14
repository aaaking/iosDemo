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
    var btn1: UIButton?
    @objc dynamic var textMessage: String = "textMessage"
    @objc dynamic var controller2 = ViewController2()
    //
    var dataFromOtherPage = ""
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
        self.btn1 = UIButton(frame: CGRect(x: btnRead.frame.origin.x + btnRead.frame.size.width + 5, y: statusBarHeight + navBarHeight, width: 0, height: 0))
        self.btn1?.setTitle("页面跳转", for: .normal)
        self.btn1?.sizeToFit()
        self.btn1?.addTarget(self, action: #selector(jumpPage), for: .touchUpInside)
        self.view.addSubview(self.btn1!)
        //
        self.controller2.addObserver(self, forKeyPath: textMessage, options: NSKeyValueObservingOptions(rawValue: NSKeyValueObservingOptions.new.rawValue), context: nil)
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
        self.controller2.textStr = "告诉我1+1=？"
        self.controller2.tab1 = self
        self.controller2.getBlock { (value) in
            self.btn1?.setTitle(value, for: .normal)
        }
//        self.present(controller2, animated: true) {
//            print("-----切换到了视图控制器2-----")
//        }
        self.navigationController?.pushViewController(self.controller2, animated: true)
//        self.tabBarController?.navigationController?.pushViewController(controller2, animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func viewDidAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
    
    func resultFrom2(data: Any) {
        self.btn1?.setTitle("\(data)", for: .normal)
    }
    
    //oc--dealloc
    deinit {
        self.controller2.removeObserver(self, forKeyPath: textMessage)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        self.btn1?.setTitle(String(describing: change!), for: .normal)
    }
}
