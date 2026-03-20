//
//  BSSTextField.swift
//  IOSToolBox
//
//  Created by BSSCBC on 2024/10/13.
//

import UIKit

open class BSSTextField: UITextField {
    
    public lazy var bcscale: CGFloat = 1 {
        didSet {
            layoutSubviews()
        }
    }
    
    public var bcplaceholdercolor: UIColor? {
        didSet{
            bcchangeplaceholder();
        }
    }
    
    public var bcplaceholderfont: UIFont? {
        didSet{
            bcchangeplaceholder();
        }
    }
    
    public override var placeholder: String? {
        didSet{
            let p = placeholder
            bcchangeplaceholder()
            super.placeholder = p
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

extension BSSTextField {
    private func bcchangeplaceholder() {
        let ivar = classgetInstanceVariable(objectgetClass(UITextField()), "placeholderLabel")
        let placeholderLabel  = objectgetIvar(self, ivar!) as? UILabel
        placeholderLabel?.textColor = bcplaceholdercolor
        placeholderLabel?.font = bcplaceholderfont
    }
}

extension BSSTextField {
    @objc dynamic open func bcaddsubviews() { }
}
