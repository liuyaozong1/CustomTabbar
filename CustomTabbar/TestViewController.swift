//
//  TestViewController.swift
//  CustomTabbar
//
//  Created by liuyaozong on 2021/9/6.
//

import UIKit

class TestViewController: UIViewController {

    lazy var containView = ContainView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.addSubview(containView)
        containView.backgroundColor = .red
    
    }
 
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        containView.frame = view.bounds
    }

}
