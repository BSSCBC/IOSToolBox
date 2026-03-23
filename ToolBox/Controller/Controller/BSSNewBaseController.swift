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
    public lazy var bccontroller_status: BSSEnumNewBaseControllerStatus = .bcdefault {
        didSet {
            bccontroller_status_change()
        }
    }

    public private(set) lazy var bcscale: CGFloat = 1.0
    open func bcset(scale: CGFloat) {
         if bcscale != scale {
             bcscale = scale
             bclayoutsubviewsframe()
         }
     }
    
    private lazy var bccurrent_size: CGSize = .zero
    
    public lazy var bcis_push: Bool = true
    
    public lazy var bccontent_view: BSSView = BSSView()
    
    public lazy var bcbackground_content_view: BSSView = BSSView()
    
    //  用于解决,左滑返回于scrollView等控件左右滑动冲突,牺牲左侧宽度10的所有事件
    private(set) lazy var bcleft_tap_view: BSSView = BSSView()
    
    public lazy var bcrequest_loading_view: BSSView = BSSView()
    
    public lazy var bcstatus_view: BSSView = BSSView()
    
    deinit {
        print(String(format: "%@", self) + "被销毁了")
    }
}

extension BSSNewBaseController {
    override open func viewDidLoad() {
        super.viewDidLoad()
        
        bcsetInterface()
        bcsetNavigationBar()
        
        bccontroller_status = .bcdefault
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
        bccontroller_status = .bcloading
    }
}

extension BSSNewBaseController {
    @objc dynamic open func bcsetInterface() {
        
        view.addSubview(bcbackground_content_view)
        bcbackground_content_view.isUserInteractionEnabled = false
        
        view.addSubview(bcstatus_view)
        
        view.addSubview(bcrequest_loading_view)
        bcrequest_loading_view.isUserInteractionEnabled = false
        
        view.addSubview(bccontent_view)
    }
    
    public func bccontent_addSubview(_ view: UIView) {
        bccontent_view.addSubview(view)
    }
    
    public func bcrequest_loading_addSubview(_ view: UIView) {
        for subView in bcrequest_loading_view.subviews {
            subView.removeFromSuperview()
        }
        
        bcrequest_loading_view.addSubview(view)
    }
    
    public func bcstatus_addSubview(_ view: UIView) {
        for subView in bcstatus_view.subviews {
            subView.removeFromSuperview()
        }
        
        bcstatus_view.addSubview(view)
    }
}

extension BSSNewBaseController {
    @objc dynamic open func bcsetNavigationBar() {
        
        view.addSubview(bcleft_tap_view)
    }
    
    @objc dynamic open func bcsetSubviewsFrame() {
        
        let scale = view.frame.bcscaletowidth(originalWidth: 375)
        bcset(scale: scale)
        
        bclayoutsubviewsframe()
    }
    
    private func bclayoutsubviewsframe() {
        
        let size = view.frame.size
        if bccurrent_size.width > 0 && bccurrent_size.height > 0 && size.width > 0 && size.height > 0 && bccurrent_size.width == size.width && bccurrent_size.height == size.height {
            return
        }
                
        bccurrent_size = view.bounds.size
        
        bcbackground_content_view.frame = view.bounds
        bccontent_view.frame = view.bounds
        
        bcrequest_loading_view.frame = view.bounds
        bcrequest_loading_view.bcset(scale: bcscale)
        
        bcstatus_view.frame = view.bounds
        bcstatus_view.bcset(scale: bcscale)
                
        bcleft_tap_view.frame = CGRect(x: 0, y: bccurrentdevice.bcnavigationBarmaxY(), width: 15 * bcscale, height: view.frame.height - bccurrentdevice.bcnavigationBarmaxY())
    }
}

extension BSSNewBaseController {
    private func bccontroller_status_change() {
        
        if bccontroller_status == BSSEnumNewBaseControllerStatus.bcloading {
            
            bcshow_loadingView()
        }else if bccontroller_status == .bcdata_loaded || bccontroller_status == .bcdefault {
            
            bcshow_contentView()
        }else if bccontroller_status == .bcshow_status {
            
            bcshow_statusView()
        }
    }
}

extension BSSNewBaseController {
    private func bcshow_loadingView() {
        bccontent_view.isHidden = true
        bcstatus_view.isHidden = true
        bcrequest_loading_view.isHidden = false
    }
    
    private func bcshow_contentView() {
        bcrequest_loading_view.isHidden = true
        bccontent_view.isHidden = false
        bcstatus_view.isHidden = true
    }
    
    private func bcshow_statusView() {
        bccontent_view.isHidden = true
        bcstatus_view.isHidden = false
        bcrequest_loading_view.isHidden = true
    }
}

public extension BSSNewBaseController {
    class func bcID() -> String {
        let name = ("\(self)" + "\(#function)")
        return name.bcmd5()
    }
}
