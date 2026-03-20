//
//  BSSBaseLoadingView.swift
//  IOSToolBox
//
//  Created by BSSCBC on 2024/10/13.
//

import UIKit

open class BSSBaseLoadingView: BSSView {
        
    private lazy var bcloadingview: UIActivityIndicatorView = UIActivityIndicatorView(style: .large)
}

extension BSSBaseLoadingView {
    open override func bcaddsubviews() {
        super.bcaddsubviews()
        
        addSubview(bcloadingview)
    }
}

extension BSSBaseLoadingView {
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        backgroundColor = UIColor.bccontrollerloadingbgColor()
        
        bcloadingview.frame.size = CGSize(width: 87 * bcscale, height: 87 * bcscale)
        
        bcloadingview.frame.origin = CGPoint(x: (frame.width - bcloadingview.frame.width) * 0.5, y: (frame.height - bcloadingview.frame.height) * 0.5)
        
        bcloadingview.layer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        bcloadingview.transform = CGAffineTransform(scaleX: 1.5 * bcscale, y: 1.5 * bcscale)
        
        bcloadingview.color = UIColor.bccontrollerloadingcolor()
    }
    
    public func bcshowloading() {
        bcloadingview.startAnimating()
        isHidden = false
    }
    
    public func bchiddenloading() {
        isHidden = true
        bcloadingview.stopAnimating()
    }
}
