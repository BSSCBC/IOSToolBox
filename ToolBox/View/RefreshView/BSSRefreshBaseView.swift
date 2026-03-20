//
//  BSSRefreshBaseView.swift
//  BSSRefreshCollectionView
//
//  Created by BSSCBC on 2024/8/21.
//

import UIKit

open class BSSBaseTableViewCell: UITableViewCell {
    
    public lazy var bcscale: CGFloat = 1 {
        didSet {
            layoutSubviews()
        }
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        
        self.isHidden = frame.height < 0.25
    }
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        bcaddsubviews()
    }
    
    @objc dynamic open func bcaddsubviews() { }
    
    public static func bcID() -> String {
        return "\(self)"
    }
    
    required public init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}

open class BSSBaseCollectionViewCell: UICollectionViewCell {
    
    public lazy var bcscale: CGFloat = 1 {
        didSet {
            layoutSubviews()
        }
    }
    
    public override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        
        bcaddsubviews()
    }
    
    @objc dynamic open func bcaddsubviews() { }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        
        self.isHidden = frame.height < 0.25
    }
    
    public static func bcID() -> String {
        return "\(self)"
    }
    
    required public init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}


open class BSSBaseCollectionReusableView: UICollectionReusableView {
    public lazy var bcscale: CGFloat = 1 {
        didSet {
            layoutSubviews()
        }
    }
    
    public override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        
        bcaddsubviews()
    }
    
    @objc dynamic open func bcaddsubviews() { }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        
        self.isHidden = frame.height < 0.25
    }
    
    public static func bcID() -> String {
        return "\(self)"
    }
    
    required public init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}

open class BSSBaseTableViewHeaderFooterView: UITableViewHeaderFooterView {
    
    public lazy var bcscale: CGFloat = 1 {
        didSet {
            layoutSubviews()
        }
    }
    
    public override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        bcaddsubviews()
    }
    
    @objc dynamic open func bcaddsubviews() { }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        
        self.isHidden = frame.height < 0.25
    }
    
    public static func bcID() -> String {
        return "\(self)"
    }
    
    required public init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
