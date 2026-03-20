//
//  BSSView.swift
//  IOSToolBox
//
//  Created by BSSCBC on 2025/4/9.
//

import UIKit

open class BSSView: UIView {
    
    public lazy var bcscale: CGFloat = 1 {
        didSet {
            layoutSubviews()
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

extension BSSView {
    @objc dynamic open func bcaddsubviews() { }
}
