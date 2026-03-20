//
//  BSSImageView.swift
//  IOSToolBox
//
//  Created by BSSCBC on 2025/4/9.
//

import UIKit


open class BSSImageView: UIImageView {
    
    public lazy var bcscale: CGFloat = 1 {
        didSet {
            layoutSubviews()
        }
    }
    
    public lazy var bcimageName: String = "" {
        didSet {
            if bcimageName.count > 0 {
                image = UIImage(named: bcimageName)
            }
        }
    }
    
    public override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        
        bcaddsubviews()
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BSSImageView {
    
    @objc dynamic open func bcaddsubviews() { }
}
