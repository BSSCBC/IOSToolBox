//
//  BSSEnumBaseControllerStatus.swift
//  IOSToolBox
//
//  Created by BSSCBC on 2024/10/13.
//

public enum BSSEnumBaseControllerStatus: String {
    //  默认状态下 显示contentView
    case bcdefault = "bcdefault"
    //  显示 requestloadingView
    case bcfirstrequest = "bcfirstrequest"
    //  显示
    case bcdataloaded = "bcdataloaded"
    
    case bcnointernet = "bcnointernet"
    case bcnomessage = "bcnomessage"
    case bcnodata = "bcnodata"
    case bcnocomment = "bcnocomment"
    
    case bcother = "bcother"
}
