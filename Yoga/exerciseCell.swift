//
//  exerciseCell.swift
//  Yoga
//
//  Created by hutao on 2023/9/16.
//

import UIKit

class exerciseCell: UICollectionViewCell {
    
    lazy var infolabel:UILabel = {
        let label = UILabel(frame: CGRect(x: 20, y: 360, width: 350, height: 40))
        label.layer.cornerRadius = 10
        label.backgroundColor = .clear
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    
    lazy var effectView: UIVisualEffectView = {
        let effect = UIBlurEffect(style: UIBlurEffect.Style.light)
        let effectView = UIVisualEffectView(effect: effect)
        effectView.frame = CGRect(x: 20, y: 360, width: 350, height: 40)
        effectView.layer.masksToBounds = true
        effectView.layer.cornerRadius = 5
        return effectView
    }()
    
    
    //布局变化时调用
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 20
        self.layer.masksToBounds = true
        self.contentView.addSubview(effectView)
        self.contentView.addSubview(infolabel)
    }
    
}
