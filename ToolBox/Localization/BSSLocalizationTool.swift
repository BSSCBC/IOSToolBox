//
//  BSSLocalizationTool.swift
//  IOSToolBox
//
//  Created by BSSCBC on 2024/10/13.
//

import UIKit

public let bclocalizedmanager = BSSLocalizationTool.bcshared

open class BSSLocalizationTool: NSObject {
    
    static let bcshared = BSSLocalizationTool()
    
    open lazy var bccurrentlanguage: BSSEnumLanguage = .bcchinese
    
    private override init() {
        super.init()
        
       let currentLanguageValue = UserDefaults.standard.string(forKey: "bccurrentlanguagerawValue") ?? "bccurrentlanguagerawValue"
        bccurrentlanguage = BSSEnumLanguage(rawValue: currentLanguageValue) ?? .bcchinese
    }
}

extension BSSLocalizationTool {
    public func bcset(currentLanguage: BSSEnumLanguage) {
        bccurrentlanguage = currentLanguage
        
        UserDefaults.standard.set(currentLanguage.rawValue, forKey: "bccurrentlanguagerawValue")
    }
}

extension BSSLocalizationTool {
    public static func bclanguagestring( language: BSSEnumLanguage) -> String {
        
        if language == .bcenglish {
            return "English"
        }
        
        else if language == .bcenglishAustralia {
            return "English（Australia）"
        }
        
        else if language == .bcenglishUK {
            return "English（UK）"
        }
        
        else if language == .bcenglishCA {
            return "English（CA）"
        }

        else if language == .bcfrench {
            return "French"
        }
        
        else if language == .bcchinesetraditional {
            return "繁體中文"
        }
        
        else if language == .bcchinese {
            return "简体中文"
        }
        
        else if language == .bcchinesetraditionalhk {
            return "繁體中文（香港）"
        }
        
        else if language == .bcchinesetraditionaltw {
            return "繁體中文（台湾）"
        }
        
        else {
            return "未知"
        }
    }
}
