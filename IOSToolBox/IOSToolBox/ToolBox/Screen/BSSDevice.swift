//
//  BSSDevice.swift
//  IOSToolBox
//
//  Created by BSSCBC on 2024/10/13.
//

import UIKit

/// 设备的硬件信息
/// - deviceName: 设备名
/// - modelName: 设备型号
/// - width: 宽度
/// - height: 高度
/// - statusHeightV: 竖屏 - 状态栏高度
/// - navigationBarHeightV: 竖屏 - 导航栏高度
/// - statusHeightH: 横屏 - 状态栏高度
/// - navigationBarHeightH: 横屏 - 导航栏高度
/// - tabBarHeightV: 竖屏 - TabBar高度
/// - tabBarHeightH: 横屏 - TabBar高度
/// - screenScale: 分辨率比例
/// - isFullScreen: 是否全面屏
/// - isDynamicIsland: 是否灵动岛
/// - isPad: 是否是平板
public typealias BSSDeviceType = (width: CGFloat, height: CGFloat, statusHeightV: CGFloat, navigationBarHeightV: CGFloat, statusHeightH: CGFloat, navigationBarHeightH: CGFloat, tabBarHeightV: CGFloat, tabBarHeightH: CGFloat, screenScale: CGFloat, isFullScreen: Bool, isDynamicIsland: Bool, deviceName: String, modelName: [String], isPad: Bool)

public let bccurrentdevice = BSSDevice.bcshared

//  MARK: BSSDevice
public class BSSDevice: NSObject {
    
    //  单例
    static let bcshared = BSSDevice()
    
    private lazy var bctype: BSSDeviceType? = nil
    
    public func bcdevicetype() -> BSSDeviceType {
        return bctype ?? UIDevice.bccurrentdevicetype()
    }
}

extension BSSDevice {
    /** TabBar高度 */
    public func bctabBarheight() -> CGFloat {
        
        let scenes = UIApplication.shared.connectedScenes
        let windowScene = scenes.first as? UIWindowScene
        let window = windowScene?.windows.first
        
        let screenHeight = window?.bounds.height ?? 0
        let screenWidth = window?.bounds.width ?? 0
        
        if screenWidth > screenHeight { //   横屏
            return bcdevicetype().tabBarHeightH
        }else{
            return bcdevicetype().tabBarHeightV
        }
    }
    
    /**
     给全面屏小横条预留的安全区域
     15这个值是个人试验后觉得比较合适的值
     */
    public func bctabBarsafeheight() -> CGFloat {
        let deviceType = self.bcdevicetype()
        
        if deviceType.isFullScreen == false {
            return 0
        }else{ //  新推出的产品多为全面屏, 所以全面屏是默认值
            return 15
        }
    }
}

extension BSSDevice {
    /** navigationBar高度 */
    public func bcnavigationBarheight() -> CGFloat {
        let scenes = UIApplication.shared.connectedScenes
        let windowScene = scenes.first as? UIWindowScene
        let window = windowScene?.windows.first
        
        let screenHeight = window?.bounds.height ?? 0
        let screenWidth = window?.bounds.width ?? 0
        
        if screenWidth > screenHeight { //   横屏
            return bcdevicetype().navigationBarHeightH
        }else{
            return bcdevicetype().navigationBarHeightV
        }
    }
    
    
    /** 状态栏的高度 */
    public func bcstatusBarheight() -> CGFloat {
        let scenes = UIApplication.shared.connectedScenes
        let windowScene = scenes.first as? UIWindowScene
        let window = windowScene?.windows.first
        
        let screenHeight = window?.bounds.height ?? 0
        let screenWidth = window?.bounds.width ?? 0
        
        if screenWidth > screenHeight { //   横屏
            return bcdevicetype().statusHeightH
        }else{
            return bcdevicetype().statusHeightV
        }
    }
    
    /** 导航条默认高度 + 状态栏高度 */
    public func bcnavigationBarmaxY() -> CGFloat {
        return bcnavigationBarheight() + bcstatusBarheight()
    }
}
