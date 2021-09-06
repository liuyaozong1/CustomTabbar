//
//  ContainView.swift
//  CustomTabbar
//
//  Created by liuyaozong on 2021/9/6.
//

import UIKit

class ContainView: UIView {

    var btn = UIButton()
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        
        return btn
    }

}
