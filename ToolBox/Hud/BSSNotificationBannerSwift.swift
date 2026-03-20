//
//  BSSNotificationBannerSwift.swift
//  BSSSDKToolPackage
//
//  Created by BSSCBC on 2024/8/29.
//

import UIKit
import NotificationBannerSwift

extension BSSHUDTool {
   public static func bcshowsuccess(title: String? = nil, subTitle: String? = nil) {
        
        if ((title?.count ?? 0) <= 0) && ((subTitle?.count ?? 0) <= 0) {
            return
        }
        
        let banner = FloatingNotificationBanner(title: title,
                                                subtitle: subTitle,
                                                style: .success)
        
        banner.show(queuePosition: .back,
                    bannerPosition: .top,
                    cornerRadius: 10,
                    shadowBlurRadius: 15)
    }
    
    public static func bcshowdanger(title: String? = nil, subTitle: String? = nil) {
        
        if ((title?.count ?? 0) <= 0) && ((subTitle?.count ?? 0) <= 0) {
            return
        }
        
        let banner = FloatingNotificationBanner(title: title,
                                                subtitle: subTitle,
                                                style: .danger)
        
        banner.show(queuePosition: .back,
                    bannerPosition: .top,
                    cornerRadius: 10,
                    shadowBlurRadius: 15)
    }
}
