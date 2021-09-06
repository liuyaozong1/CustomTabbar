//
//  TabbarViewController.swift
//  CustomTabbar
//
//  Created by liuyaozong on 2021/9/6.
//

import UIKit

 class TabbarViewController: UITabBarController {
    let cusTabbar = CustomTabbar()
    
    lazy var preBtn: UIButton = cusTabbar.homeBtn
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let home =  addChindVC(title: "首页")
        home.view.backgroundColor = .red
        let person = addChindVC(title: "个人中心")
        person.view.backgroundColor = .blue
        self.tabBar.addSubview(cusTabbar)
        cusTabbar.personBtn.addTarget(self, action: #selector(click(btn:)), for: .touchUpInside)
        cusTabbar.homeBtn.addTarget(self, action: #selector(click(btn:)), for: .touchUpInside)

    }
    
    func addChindVC(title: String) -> TestViewController {
        let vc = TestViewController()
        addChild(vc)
        return vc
    }
    
    //移除
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        for item in self.tabBar.subviews {
            if item.isKind(of: CustomTabbar.self) {
                print("进来了")
            } else {
                item.removeFromSuperview()
            }
        }
        cusTabbar.frame = self.tabBar.bounds
    }
    
    @objc func click(btn: UIButton) {
        if btn.isSelected {
            return
        }
        //上次选中的取消
        preBtn.isSelected = false
        //本次选中
        btn.isSelected = true
        preBtn = btn
        self.selectedIndex = btn.tag
    }
    
    
    
}
