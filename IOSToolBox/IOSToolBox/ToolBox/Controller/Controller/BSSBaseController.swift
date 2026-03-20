//
//  BSSBaseController.swift
//  IOSToolBox
//
//  Created by BSSCBC on 2024/10/13.
//

import UIKit

open class BSSBaseController: UIViewController {

    //  状态栏颜色
    open override var preferredStatusBarStyle: UIStatusBarStyle {
        get {
            return .lightContent
        }
    }

    //  控制器状态
    public lazy var bccontrollerstatus: BSSEnumBaseControllerStatus = .bcdefault {
        didSet {
            bccontrollerstatuschange()
        }
    }

    public lazy var bcscale: CGFloat = 1.0
    public lazy var bcispush: Bool = true
    public lazy var bcistabBarchild: Bool = false
    
    public lazy var bccontentview: UIView = UIView()
    
    public lazy var bcbackgroundcontentview: UIView = UIView()
    public lazy var bcbackgroundheaderimageView: UIImageView = UIImageView()
    
    //  用于解决,左滑返回于scrollView等控件左右滑动冲突,牺牲左侧宽度10的所有事件
    private(set) lazy var bclefttapview: UIView = UIView()
    
    private(set) lazy var bcrequestloadingview: BSSBaseLoadingView = BSSBaseLoadingView()
    
    private(set) lazy var bcstatusview: BSSStatusView = {
        let view = BSSStatusView()
        
        view.bcretryrequestclickBlock = { [weak self] in
            self?.bcretryrequestclick()
        }
        
        return view
    }()
    
    deinit {
        print(String(format: "%@", self) + "被销毁了")
    }
}

extension BSSBaseController {
    override open func viewDidLoad() {
        super.viewDidLoad()
        
        bcsetInterface()
        bcsetNavigationBar()
        
        bccontrollerstatus = .bcdefault

        bccontrollermanager.bcaddlog(controllerName: "\(self)", status: "viewDidLoad")
    }
    
    override open func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        bcsetSubviewsFrame()
        
        bccontrollermanager.bcaddlog(controllerName: "\(self)", status: "viewWillLayoutSubviews")
    }
    
    override open func viewWillDisappear( animated: Bool) {
        super.viewWillDisappear(animated)
        
        bccontrollermanager.bcaddlog(controllerName: "\(self)", status: "viewWillDisappear")
    }
}

extension BSSBaseController {
    
    @objc dynamic open func bcretryrequestclick() {
        bccontrollerstatus = .bcfirstrequest
    }
}

extension BSSBaseController {
    @objc dynamic open func bcsetInterface() {
        
        view.addSubview(bcbackgroundcontentview)
        view.addSubview(bcstatusview)
        
        view.addSubview(bcrequestloadingview)
        view.addSubview(bccontentview)
        
        bcbackgroundcontentview.addSubview(bcbackgroundheaderimageView)
    }
    
    @objc dynamic open func bcsetNavigationBar() {
        
        view.addSubview(bclefttapview)
    }
    
    @objc dynamic open func bcsetSubviewsFrame() {
        
        let scale = view.frame.bcscaletowidth(originalWidth: 375)
        bcscale = scale
        
        bcbackgroundcontentview.frame = view.bounds
        bccontentview.frame = view.bounds
        
        bcrequestloadingview.frame = view.bounds
        bcrequestloadingview.bcscale = scale
        
        bcstatusview.frame = view.bounds
        bcstatusview.bcscale = scale
        
        bcbackgroundcontentview.backgroundColor = BSSBaseController.bcbackgroundcolor()
        
        bclefttapview.frame = CGRect(x: 0, y: bccurrentdevice.bcnavigationBarmaxY(), width: 15 * scale, height: view.frame.height - bccurrentdevice.bcnavigationBarmaxY())
        
        bcbackgroundheaderimageView.frame.origin = {
            bcbackgroundheaderimageView.frame.size = CGSize(width: bcbackgroundcontentview.frame.width, height: bcbackgroundcontentview.frame.height)
            bcbackgroundheaderimageView.image = UIImage.bccontrollerheaderimage()
            return .zero
        }()
    }
    
    public func bchiddenbackgroundheaderimageView() {
        bcbackgroundheaderimageView.isHidden = true
    }
}

extension BSSBaseController {
    private func bcshowrequestloading() {
        bccontentview.isHidden = true
        bcrequestloadingview.bcshowloading()
    }
    
    private func bcshowcontentView() {
        bcrequestloadingview.bchiddenloading()
        bccontentview.isHidden = false
    }
}

extension BSSBaseController {
    private func bccontrollerstatuschange(iconName: String? = nil, iconSize: CGSize? = nil, statusText: String? = nil, statusTextColor: UIColor? = nil, statusFont: UIFont? = nil) {
        
        bcstatusview.bcset(status: bccontrollerstatus, iconName: iconName, iconSize: iconSize, statusText: statusText,  statusTextColor: statusTextColor, statusFont: statusFont)
        
        if bccontrollerstatus == BSSEnumBaseControllerStatus.bcfirstrequest {
            bcshowrequestloading()
            
        }else if bccontrollerstatus == .bcdataloaded || bccontrollerstatus == .bcdefault {
            bcshowcontentView()
            
        }else if bccontrollerstatus == .bcnodata || bccontrollerstatus == .bcnointernet || bccontrollerstatus == .bcnomessage || bccontrollerstatus == .bcnocomment {
            
            bcrequestloadingview.bchiddenloading()
            bccontentview.isHidden = true
            
        }else if bccontrollerstatus == .bcother {
            
            bcrequestloadingview.bchiddenloading()
            bccontentview.isHidden = true
        }
    }
    
    public func bccontrollerstatusother(iconName: String? = nil, iconSize: CGSize? = nil, statusText: String? = nil, statusTextColor: UIColor? = nil, statusFont: UIFont? = nil) {
        
        bccontrollerstatus = .bcother
        bccontrollerstatuschange(iconName: iconName, iconSize: iconSize, statusText: statusText, statusTextColor: statusTextColor, statusFont: statusFont)
    }
}

public extension BSSBaseController {
    static func bcID() -> String {
        return "\(self)"
    }
    
    static func bcbackgroundcolor() -> UIColor? {
        return UIColor.bccontrollerbgColor()
    }
}
