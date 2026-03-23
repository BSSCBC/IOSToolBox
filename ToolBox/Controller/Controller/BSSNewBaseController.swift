//
//  BSSNewBaseController.swift
//  IOSToolBox
//
//  Created by BSSCBC on 2024/10/13.
//

import UIKit

public enum BSSEnumNewBaseControllerStatus: Int {
    //  默认状态下 显示contentView
    case bcdefault = -99
    
    case bcloading = -98
    
    //  显示已经加载过数据
    case bcdata_loaded = -97
    
    case bcshow_status = 1
}

open class BSSNewBaseController: UIViewController {

    //  状态栏颜色
    open override var preferredStatusBarStyle: UIStatusBarStyle {
        get {
            return .lightContent
        }
    }

    //  控制器状态
    public lazy var bccontrollerstatus: BSSEnumNewBaseControllerStatus = .bcdefault {
        didSet {
            bccontrollerstatus_change()
        }
    }

    public private(set) lazy var bcscale: CGFloat = 1.0
    open func bcset(scale: CGFloat) {
         if bcscale != scale {
             bcscale = scale
             bclayoutsubviewsframe()
         }
     }
    
    private lazy var bccurrentsize: CGSize = .zero
    
    public lazy var bcispush: Bool = true
    
    public lazy var bccontentview: BSSView = BSSView()
    
    public lazy var bcbackgroundcontentview: BSSView = BSSView()
    
    //  用于解决,左滑返回于scrollView等控件左右滑动冲突,牺牲左侧宽度10的所有事件
    private(set) lazy var bclefttapview: BSSView = BSSView()
    
    public lazy var bcrequestloadingview: BSSView = BSSView()
    
    public lazy var bcstatusview: BSSView = BSSView()
    
    deinit {
        print(String(format: "%@", self) + "被销毁了")
    }
}

extension BSSNewBaseController {
    override open func viewDidLoad() {
        super.viewDidLoad()
        
        bcsetInterface()
        bcsetNavigationBar()
        
        bccontrollerstatus = .bcdefault
    }
    
    override open func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        bcsetSubviewsFrame()
    }
    
    open override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        bcsetSubviewsFrame()
    }
    
    override open func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        
    }
}

extension BSSNewBaseController {
    
    @objc dynamic open func bcretry_request_click() {
        bccontrollerstatus = .bcloading
    }
}

extension BSSNewBaseController {
    @objc dynamic open func bcsetInterface() {
        
        view.addSubview(bcbackgroundcontentview)
        bcbackgroundcontentview.isUserInteractionEnabled = false
        
        view.addSubview(bcstatusview)
        
        view.addSubview(bcrequestloadingview)
        bcrequestloadingview.isUserInteractionEnabled = false
        
        view.addSubview(bccontentview)
    }
    
    public func bccontentaddSubview(_ view: UIView) {
        bccontentview.addSubview(view)
    }
    
    public func bcrequestloadingaddSubview(_ view: UIView) {
        for subView in bcrequestloadingview.subviews {
            subView.removeFromSuperview()
        }
        
        bcrequestloadingview.addSubview(view)
    }
    
    public func bcstatusaddSubview(_ view: UIView) {
        for subView in bcstatusview.subviews {
            subView.removeFromSuperview()
        }
        
        bcstatusview.addSubview(view)
    }
}

extension BSSNewBaseController {
    @objc dynamic open func bcsetNavigationBar() {
        
        view.addSubview(bclefttapview)
    }
    
    @objc dynamic open func bcsetSubviewsFrame() {
        
        let scale = view.frame.bcscaletowidth(originalWidth: 375)
        bcset(scale: scale)
        
        bclayoutsubviewsframe()
    }
    
    private func bclayoutsubviewsframe() {
        
        let size = view.frame.size
        if bccurrentsize.width > 0 && bccurrentsize.height > 0 && size.width > 0 && size.height > 0 && bccurrentsize.width == size.width && bccurrentsize.height == size.height {
            return
        }
                
        bccurrentsize = view.bounds.size
        
        bcbackgroundcontentview.frame = view.bounds
        bccontentview.frame = view.bounds
        
        bcrequestloadingview.frame = view.bounds
        bcstatusview.bcscale = bcscale
        
        bcstatusview.frame = view.bounds
        bcstatusview.bcscale = bcscale
                
        bclefttapview.frame = CGRect(x: 0, y: bccurrentdevice.bcnavigationBarmaxY(), width: 15 * bcscale, height: view.frame.height - bccurrentdevice.bcnavigationBarmaxY())
    }
}

extension BSSNewBaseController {
    private func bccontrollerstatus_change() {
        
        if bccontrollerstatus == BSSEnumNewBaseControllerStatus.bcloading {
            
            bcshow_loadingView()
        }else if bccontrollerstatus == .bcdata_loaded || bccontrollerstatus == .bcdefault {
            
            bcshow_contentView()
        }else if bccontrollerstatus == .bcshow_status {
            
            bcshow_statusView()
        }
    }
}

extension BSSNewBaseController {
    private func bcshow_loadingView() {
        bccontentview.isHidden = true
        bcstatusview.isHidden = true
        bcrequestloadingview.isHidden = false
    }
    
    private func bcshow_contentView() {
        bcrequestloadingview.isHidden = true
        bccontentview.isHidden = false
        bcstatusview.isHidden = true
    }
    
    private func bcshow_statusView() {
        bccontentview.isHidden = true
        bcstatusview.isHidden = false
        bcrequestloadingview.isHidden = true
    }
}

public extension BSSNewBaseController {
    class func bcID() -> String {
        let name = ("\(self)" + "\(#function)")
        return name.bcmd5
    }
}
