//
//  ViewController2.swift
//  swift2
//
//  Created by 周智慧 on 2018/10/6.
//  Copyright © 2018 周智慧. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {
    override func loadView() {
        super.loadView()
        print("2-----loadView")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("2-----viewDidLoad")
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.gray
        let label = UILabel()
        label.frame = CGRect(x: 20, y: 120, width: 100, height: 40)
        label.text = "controller 2"
        label.backgroundColor = UIColor.red
        self.view.addSubview(label)
        print("2-----self.window: \(self.view.window)")
        //
        self.tabBarController?.tabBar.isHidden = true
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
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        self.dismiss(animated: true) {
//            print("2------dismiss")
//        }
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
