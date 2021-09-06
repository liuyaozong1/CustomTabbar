//
//  CustomTabbar.swift
//  CustomTabbar
//
//  Created by liuyaozong on 2021/9/6.
//

import UIKit
import SnapKit


@objc class CustomTabbar: UITabBar {

    lazy var contentView = UIView()
    
    lazy var homeBtn = creatBtn(title: "探索")
    
    lazy var discoverBtn: UIButton = { [weak self] in
        let btn = UIButton()
        btn.setImage(UIImage(named: "add"), for: .normal)
        return btn
    }()
    
    lazy var personBtn = creatBtn(title: "空间")
    
    lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.alignment = .center
        view.axis = .horizontal
        view.distribution = .fillEqually
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .yellow
        homeBtn.tag = 0
        homeBtn.isSelected = true
        personBtn.tag = 1
        discoverBtn.contentMode = .scaleAspectFit
        configSubviews()
        discoverBtn.addTarget(self, action: #selector(clickDiscover), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame  = self.bounds
        stackView.frame = self.bounds
    }
    
    @objc func clickDiscover() {
        print("点击了发现")
    
    }
    
}

extension CustomTabbar {
    func configSubviews() {
        setupSubviews()
        measureSubviews()
    }
    
    func setupSubviews() {
        addSubview(contentView)
        contentView.backgroundColor = .white
        contentView.addSubview(homeBtn)
        contentView.addSubview(discoverBtn)
        contentView.addSubview(personBtn)
    }
    
    func measureSubviews() {
        
        let width = UIScreen.main.bounds.size.width
        
        discoverBtn.snp.makeConstraints { make in
            make.width.height.equalTo(40)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(10)
            
        }
        
        homeBtn.sizeToFit()
        homeBtn.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(width / 6 - homeBtn.bounds.size.width / 2)
            make.centerY.equalTo(discoverBtn)
        }
        personBtn.sizeToFit()
        personBtn.snp.makeConstraints { make in
            make.right.equalToSuperview().offset( -width / 6 + personBtn.bounds.size.width / 2)
            make.centerY.equalTo(discoverBtn)
        }
    }
}

extension CustomTabbar {
    func creatBtn(title: String) -> UIButton {
        let btn = UIButton(type: .custom)
        btn.setTitle(title, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 20)
        btn.setTitleColor(.blue, for: .normal)
        btn.setTitleColor(.black, for: .selected)
        btn.adjustsImageWhenHighlighted = false
        btn.addTarget(self, action: #selector(preventFlicker(btn:)), for: .allTouchEvents)
        return btn
    }
    
    @objc func preventFlicker(btn: UIButton) {
        btn.isHighlighted = false
    }
}
