//
//  BSSControllerConfig.swift
//  IOSToolBox
//
//  Created by BSSCBC on 2024/12/30.
//

import UIKit

extension UIColor {
    //  控制器背景色
    static func bccontrollerbgColor() -> UIColor {
        return UIColor(named: "viewBgColor") ?? UIColor(named: "bcbaseControllerbgColor") ?? UIColor.bccolor(red: 248, green: 248, blue: 248)
    }
    
    
    
    //  MARK: LoadingView
    //  Loading背景颜色
    static func bccontrollerloadingbgColor() -> UIColor {
        return UIColor(named: "loadingBgColor") ?? UIColor(named: "bccontrollerloadingViewbgColor") ?? UIColor.bccolor(red: 28, green: 28, blue: 28).withAlphaComponent(0.45)
    }
    
    //  Loading颜色
    static func bccontrollerloadingcolor() -> UIColor? {
        return UIColor(named: "loadingColor") ?? UIColor(named: "bccontrollerloadingViewcolor") ?? UIColor(named: "AccentColor")
    }
    
    
    
    //  MARK: StatusLabel
    static func bcstatuslabeltextColor() -> UIColor {
        return UIColor(named: "viewStatusTextColor") ?? UIColor(named: "bcbasestatuslabeltextColor") ?? UIColor.bccolor(red: 250, green: 250, blue: 250).withAlphaComponent(0.75)
    }
}


extension UIImage {
    static func bccontrollerheaderimage() -> UIImage? {
        return UIImage(named: "bccontrollerheaderimage")
    }
}
