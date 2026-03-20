//
//  JY_Refresh_BaseView.swift
//  JY_Refresh_CollectionView
//
//  Created by JYYQLin on 2024/8/21.
//

import UIKit

open class JY_Base_TableViewCell: UITableViewCell {
    
    public lazy var yq_scale: CGFloat = 1 {
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
        
        yq_add_subviews()
    }
    
    @objc dynamic open func yq_add_subviews() { }
    
    public static func yq_ID() -> String {
        return "\(self)"
    }
    
    required public init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}

open class JY_Base_CollectionViewCell: UICollectionViewCell {
    
    public lazy var yq_scale: CGFloat = 1 {
        didSet {
            layoutSubviews()
        }
    }
    
    public override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        
        yq_add_subviews()
    }
    
    @objc dynamic open func yq_add_subviews() { }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        
        self.isHidden = frame.height < 0.25
    }
    
    public static func yq_ID() -> String {
        return "\(self)"
    }
    
    required public init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}


open class JY_Base_CollectionReusableView: UICollectionReusableView {
    public lazy var yq_scale: CGFloat = 1 {
        didSet {
            layoutSubviews()
        }
    }
    
    public override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        
        yq_add_subviews()
    }
    
    @objc dynamic open func yq_add_subviews() { }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        
        self.isHidden = frame.height < 0.25
    }
    
    public static func yq_ID() -> String {
        return "\(self)"
    }
    
    required public init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}

open class JY_Base_TableViewHeaderFooterView: UITableViewHeaderFooterView {
    
    public lazy var yq_scale: CGFloat = 1 {
        didSet {
            layoutSubviews()
        }
    }
    
    public override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        yq_add_subviews()
    }
    
    @objc dynamic open func yq_add_subviews() { }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        
        self.isHidden = frame.height < 0.25
    }
    
    public static func yq_ID() -> String {
        return "\(self)"
    }
    
    required public init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
