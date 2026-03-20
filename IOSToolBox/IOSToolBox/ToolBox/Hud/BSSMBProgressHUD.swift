//
//  BSSHUDTool.swift
//  BSSSDKToolPackage
//
//  Created by BSSCBC on 2024/8/29.
//

import UIKit
import MBProgressHUD

public let BSSHUDkeywindow = UIWindow.bcHUDkeywindow()

extension UIWindow {
    static func bcHUDkeywindow() -> UIWindow? {
        let scenes = UIApplication.shared.connectedScenes
        let windowScene = scenes.first as? UIWindowScene
        let window = windowScene?.windows.first
        return window
    }
}

/// 默认HUD显示时间
public let defaultHUDShowTime = 1.5

open class BSSHUDTool {
    
    static var hud: MBProgressHUD?
    
    private class func bccreateHUD(view: UIView? = BSSHUDkeywindow, isMask: Bool = false) -> MBProgressHUD? {
        
        guard let superView = view else { return nil }
        let HUD = MBProgressHUD.showAdded(to: superView, animated: true)
        
        HUD.frame = CGRect(x: 0, y: 0, width: superView.frame.width, height: superView.frame.height)
        HUD.animationType = .zoom
                if isMask {
            HUD.backgroundView.color = UIColor(named: "BSSHUDToolbackgroundColor")
        } else {
            HUD.bezelView.style = .solidColor
            HUD.backgroundView.color = UIColor.clear
            HUD.bezelView.backgroundColor = UIColor(named: "BSSHUDToolbezelViewbackgroundColor")
            HUD.contentColor = UIColor(named: "BSSHUDToolcontentColor")
        }
        HUD.removeFromSuperViewOnHide = true
        HUD.show(animated: true)
        return HUD
    }
    
    private class func bccreateHUD(message: String?, iconName: String?, view: UIView? = BSSHUDkeywindow) -> MBProgressHUD? {
        
        let HUD = bccreateHUD(view: view, isMask: false)
        if let iconName = iconName {
            HUD?.mode = .customView
            HUD?.customView = UIImageView(image: UIImage(named: iconName))
        } else {
            HUD?.mode = .text
        }
        HUD?.label.text = message
        HUD?.label.numberOfLines = 0
        return HUD
    }
}

extension BSSHUDTool {
    
    /// Tost弹窗
    /// - Parameters:
    ///   - message: 提示文字
    ///   - view: 加载到的视图
    ///   - isMask: 是否显示遮罩视图
    ///   - isCoverNavi: 是否覆盖导航
    ///   - showTime: 显示时长
    public class func bcshowtipMessage( message: String?, view: UIView? = BSSHUDkeywindow, isMask: Bool = false, isCoverNavi: Bool = true, showTime: Double = defaultHUDShowTime, completeClosure: (() -> Void)? = nil) {
        
        bcshowtipMessage(message, iconName: nil, view: view, isMask: isMask, isCoverNavi: isCoverNavi, showTime: showTime, completeClosure: completeClosure)
    }
    
    /// 显示图片加文字的弹窗
    /// - Parameters:
    ///   - message: 提示文字
    ///   - iconName: 图片名称
    ///   - view: 加载的视图
    ///   - isMask: 是否有遮罩
    ///   - isCoverNavi: 是否盖着导航
    ///   - showTime: 提示时长
    public class func bcshowtipMessage( message: String?, iconName: String?, view: UIView? = BSSHUDkeywindow, isMask: Bool = false, isCoverNavi: Bool = true, showTime: Double = defaultHUDShowTime, completeClosure: (() -> Void)? = nil) {
        
        bchiddenHUD()
        
        let HUD = bccreateHUD(message: message, iconName: iconName, view: view)
        if completeClosure != nil {
            HUD?.completionBlock = completeClosure
        }
        HUD?.hide(animated: true, afterDelay: showTime)
    }
    
    /// 显示加载数据
    /// - Parameters:
    ///   - message: 提示内容
    ///   - view: 添加到的视图
    ///   - isMask: 是否显示遮罩视图
    ///   - isCoverNavi: 是否覆盖导航视图
    public class func bcshowloadingHUD(message: String? = nil, view : UIView? = BSSHUDkeywindow, isMask : Bool = false) {
        
        if let HUD = hud {
            HUD.hide(animated: false)
        }
        
        let HUD = bccreateHUD(view: view, isMask: isMask)
        HUD?.mode = .indeterminate
        HUD?.label.text = message
        hud = HUD
    }
    
    /// 隐藏菊花
    public class func bchiddenHUD(animated: Bool = true) {
        guard let HUD = hud else {
            return
        }
        HUD.hide(animated: animated)
//        hud = nil
    }
}
