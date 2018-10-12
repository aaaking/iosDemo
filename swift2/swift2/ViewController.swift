//
//  ViewController.swift
//  swift2
//
//  Created by 周智慧 on 2018/9/29.
//  Copyright © 2018 周智慧. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    var view1: UIView!
    var view2: UIButton!
    var view3: UIView!
    var i = 0
    override func loadView() {
        super.loadView()
        print("1-----loadView")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print("1-----viewDidLoad")
//        self.view.window?.backgroundColor = UIColor.red
        self.view.backgroundColor = UIColor.purple
        self.view.frame = CGRect(x: 30, y: 30, width: UIScreen.main.bounds.width / 2, height: UIScreen.main.bounds.height / 2)
//        self.view.backgroundColor = UIColor.init(white: CGFloat(), alpha: 0)
        // Do any additional setup after loading the view, typically from a nib.
        self.view1 = UIView(frame: CGRect(x: 40, y: 50, width: 200, height: 120))
        self.view1.backgroundColor = UIColor.red
        self.view.addSubview(self.view1)
        //2
        self.view2 = UIButton(frame: CGRect(x: 90, y: 100, width: 200, height: 120))
        self.view2.backgroundColor = UIColor.blue
        self.view2.setTitle("点击跳转", for: UIControl.State.normal)
        self.view.addSubview(self.view2)
        //3
        self.view3 = UIView(frame: CGRect(x: 160, y: 190, width: 200, height: 40))
        self.view3.backgroundColor = UIColor.green
        self.view.addSubview(self.view3)
        //make view2 to bottom
        self.view.bringSubviewToFront(self.view2)
        //
        self.view2.addTarget(self, action: #selector((btnClick)), for: .touchUpInside)
        self.view2.layer.cornerRadius = 15
        self.view2.layer.masksToBounds = false
        UIImage.init().resizableImage(withCapInsets: UIEdgeInsets.init(top: 10, left: 10, bottom: 10, right: 10), resizingMode: UIImage.ResizingMode.stretch)
        //test self dimiss
        let dismissBtn = UIButton(frame: CGRect(x: 20, y: 320, width: 100, height: 40))
        dismissBtn.setTitle("click to dismiss", for: UIControl.State.normal)
        dismissBtn.addTarget(self, action: #selector(clickDismiss), for: .touchUpInside)
        dismissBtn.backgroundColor = UIColor.yellow
        self.view.addSubview(dismissBtn)
        //
        let pushBtn = UIButton(frame: CGRect(x: 20, y: 232, width: 60, height: 40))
        pushBtn.backgroundColor = UIColor.gray
        pushBtn.addTarget(self, action: #selector(pushBtnClick), for: .touchUpInside)
        self.view.addSubview(pushBtn)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        print("1--------viewWillAppear")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        print("1------viewDidAppear")
        print("self.window: \(self.view.window)------1")
    }
    override func viewWillDisappear(_ animated: Bool) {
        print("1------viewWillDisappear")
    }
    override func viewDidDisappear(_ animated: Bool) {
        print("1-------viewDidDisappear")
    }
    
    @objc func btnClick() {
        let screenW = UIScreen.main.bounds.width//self.view.frame.size.width
        let screenH = UIScreen.main.bounds.height//self.view.frame.size.height//375 - 667
        let controller2 = ViewController2()
        self.present(controller2, animated: true) {
            print("-----切换到了视图控制器2-----\(screenW)   \(screenH)")
        }
//        self.view.window?.backgroundColor = UIColor.green
    }
    
    @objc func clickDismiss() {
        print("1--clickDismiss")
        self.dismiss(animated: true) {
            print("controller 1 dismiss")
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIView.animate(withDuration: 5, animations: {
            self.view1.frame = CGRect(x: 10, y: 10, width: 100, height: 80)
            self.view1.backgroundColor = UIColor.purple
            if (self.i == 0) {
                self.view.bringSubviewToFront(self.view2)
                self.i = 1
            } else {
                self.view.sendSubviewToBack(self.view2)
                self.i = 0
            }
//            self.view.window?.backgroundColor = UIColor.green
            print("试图控制器1的touchesBegan")
        })
    }
    
    @objc func pushBtnClick() {
        self.navigationController?.pushViewController(ViewController2(), animated: true)
    }
}

