//
//  BSSStatusView.swift
//  IOSToolBox
//
//  Created by BSSCBC on 2024/10/13.
//

import UIKit

class BSSStatusView: BSSView {
    
    var bcretryrequestclickBlock: (() -> Void)?
    
    private lazy var bcstatus: BSSEnumBaseControllerStatus = .bcdefault
    
    private lazy var bciconName: String? = nil
    private lazy var bciconSize: CGSize? = nil
    
    private lazy var bcstatusText: String? = nil
    private lazy var bcstatusTextColor: UIColor? = nil
    private lazy var bcstatusFont: UIFont? = nil

    private lazy var bciconimageView: UIImageView = UIImageView()

    private lazy var bcstatuslabel: UILabel = {
        let view = UILabel()
        view.numberOfLines = 0
        view.textAlignment = .center
        return view
    }()

    private lazy var bcretrybutton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(bcretryrequestclick), for: .touchUpInside)
        return button
    }()
}

extension BSSStatusView {
    override func bcaddsubviews() {
        super.bcaddsubviews()
        
        addSubview(bcretrybutton)
        addSubview(bciconimageView)
        addSubview(bcstatuslabel)
    }
}

extension BSSStatusView {
    @objc private func bcretryrequestclick() {
        if bcretryrequestclickBlock != nil {
            bcretryrequestclickBlock!()
        }
    }
    
    /**
     status: 只有在状态是 bcnointernet || bcnomessage || bcnodata || bcnocomment || bcother 才会显示 BSSStatusView
        
     iconName: 如果传入 就会显示改图片,  默认为空, 显示状态预设的图片
     iconSize:  默认为空, 会显示预设的大小, 可以传入值修改
     statusText: 默认为空, 会显示预设的文字, 可以传入值修改
     statusTextColor:  默认为空, 会显示预设的文字颜色, 可以传入值修改
     statusFont: 默认为空, 会显示预设的文字字体, 可以传入值修改
     */
    func bcset(status: BSSEnumBaseControllerStatus, iconName: String? = nil, iconSize: CGSize? = nil, statusText: String? = nil, statusTextColor: UIColor? = nil, statusFont: UIFont? = nil) {
        bcstatus = status
        bcstatusText = statusText
        bciconName = iconName
        bcstatusFont = statusFont
        bcstatusTextColor = statusTextColor
        bciconSize = iconSize
        
        isHidden = status == .bcdefault || status == .bcfirstrequest || status == .bcdataloaded
        
        layoutSubviews()
    }
}

extension BSSStatusView {
    override func layoutSubviews() {
        super.layoutSubviews()
        
         bciconimageView.frame.origin = {
            
            if bciconName == nil {
                bciconimageView.image = UIImage(named: bcstatusimageName(status: bcstatus))
            }else{
                bciconimageView.image = UIImage(named: bciconName!)
            }
            
            if bciconSize == nil {
                bciconimageView.frame.size = CGSize(width: 140 * bcscale, height: 140 * bcscale)
            }
            else{
                bciconimageView.frame.size = bciconSize!
            }
            
            bciconimageView.contentMode = .scaleAspectFit
            
            return CGPoint(x: (frame.width - bciconimageView.frame.width) * 0.5, y: (frame.height * 0.5 - bciconimageView.frame.height))
        }()
        
        bcstatuslabel.frame.origin = {
            
            if bcstatusText == nil {
                bcstatuslabel.text = bccontrollerstatusstring(status: bcstatus).bclocalized(languageType: bclocalizedmanager.bccurrentlanguage)
            }else{
                bcstatuslabel.text = bcstatusText!
            }
            
            
            if bcstatusTextColor == nil {
                bcstatuslabel.textColor = UIColor.bcstatuslabeltextColor()
            }
            else{
                bcstatuslabel.textColor = bcstatusTextColor!
            }
            
            
            if bcstatusFont == nil {
                bcstatuslabel.font = UIFont.systemFont(ofSize: 12 * bcscale)
            }
            else{
                bcstatuslabel.font = bcstatusFont!
            }
            
            bcstatuslabel.frame.size.width = bciconimageView.frame.width + 50 * bcscale
            bcstatuslabel.sizeToFit()
            
            return CGPoint(x: bciconimageView.frame.midX - bcstatuslabel.frame.width * 0.5, y: bciconimageView.frame.maxY + 8 * bcscale)
        }()
        
        bcretrybutton.frame = {
           
            let x = bciconimageView.frame.minX <= bcstatuslabel.frame.minX ? bciconimageView.frame.minX : bcstatuslabel.frame.minX
            
            let width = (bciconimageView.frame.width >= bcstatuslabel.frame.width ? bciconimageView.frame.width : bcstatuslabel.frame.width)
            
            let height = bcstatuslabel.frame.maxY - bciconimageView.frame.minY
            
            return CGRect(x: x, y: bciconimageView.frame.minY, width: width, height: height)
        }()
    }
}

extension BSSStatusView {
    func bcstatusimageName(status: BSSEnumBaseControllerStatus) -> String {
        if status == .bcnodata {
            return "bcnodataicon"
        }
        
        else if status == .bcnointernet {
            return "bcnointerneticon"
        }
        
        else if status == .bcnomessage {
            return "bcnomessageicon"
        }
        
        else if status == .bcnocomment {
            return "bcnocommenticon"
        }
        
        else {
            return "bcstatusimageNameicon"
        }
    }
    
    
    public func bccontrollerstatusstring(status: BSSEnumBaseControllerStatus) -> String {
        
        if status == .bcnodata {
            return "bcnodatastring"
        }
        
        else if status == .bcnointernet {
            return "bcnointernetstring"
        }
        
        else if status == .bcdataloaded {
            return "bcdataloadedstring"
        }
        
        else if status == .bcnomessage {
            return "bcnomessagestring"
        }
        
        else if status == .bcnocomment {
            return "bcnocommentstring"
        }
        
        else if status == .bcfirstrequest {
            return "bcfirstrequeststring"
        }
        
        else {
            return "bcdefaultstring"
        }
    }
}
