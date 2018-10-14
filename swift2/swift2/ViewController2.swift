//
//  ViewController2.swift
//  swift2
//
//  Created by 周智慧 on 2018/10/6.
//  Copyright © 2018 周智慧. All rights reserved.
//

import UIKit

typealias textBlock = (String) -> ()//和oc的typedef类似

class ViewController2: UIViewController {
    var textStr = "controller 2"
    var tab1: Tab1?
    var block: textBlock?
    @objc dynamic var fs = "\(Float.random(in: 0...1))"
    @objc dynamic var textMessage: String = "textMessage"
    var textFiled1: UITextField = UITextField(frame: CGRect(x: 20, y: 165, width: 200, height: 40))
    override func loadView() {
        super.loadView()
        print("2-----loadView")
    }

    override func viewDidLoad() {
        fs = "\(Float.random(in: 0...1))"
        super.viewDidLoad()
        print("2-----viewDidLoad")
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.gray
        let label = UIButton()
        label.frame = CGRect(x: 20, y: 120, width: 200, height: 40)
//        label.sizeToFit()
        label.setTitle(self.textStr, for: .normal)
        label.backgroundColor = UIColor.red
        self.view.addSubview(label)
        print("2-----self.window: \(self.view.window)")
        //
        self.tabBarController?.tabBar.isHidden = true
        label.addTarget(self, action: #selector(clickBack), for: .touchUpInside)
        //
        self.textFiled1.backgroundColor = UIColor.blue
        self.view.addSubview(self.textFiled1)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        print("2--------viewWillAppear")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        print("2------viewDidAppear")
        print("2-----self.window: \(self.view.window)")
    }
    override func viewWillDisappear(_ animated: Bool) {
        print("2------viewWillDisappear")
    }
    override func viewDidDisappear(_ animated: Bool) {
        print("2-------viewDidDisappear")
        //////////
//        backToTab1()
        ////////////
        guard let block = self.block else {
            return
        }
        block("结果是\(Float.random(in: 0...1))")
        ////////notification
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        self.dismiss(animated: true) {
//            print("2------dismiss")
//        }
    }
    
    func backToTab1() {
        self.tab1?.dataFromOtherPage = "结果是2"
        self.tab1?.resultFrom2(data: "结果是\(Float.random(in: 0...1))")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func getBlock(block: textBlock?) {
        self.block = block
    }
    
    @objc func clickBack() {
        /////kvo
//        self.setValue(fs, forKey: textMessage)
//        self.navigationController?.popViewController(animated: true)
    }

}
