//
//  BSSLocalizationToolExtension.swift
//  IOSToolBox
//
//  Created by BSSCBC on 2024/10/13.
//

import UIKit

extension UIApplication {
    public static func bcprojectName() -> String {
        let bundle = Bundle.main
        let projectName = bundle.infoDictionary?["CFBundleName"] as? String ?? "Unknown Project Name"

        return projectName
    }
}

extension String {
    /**
     tableName: 本地化表名
     languageType: 预设的语言, 不传入则从bclocalizedmanager去出当前设置的语言
     languageRawValue: 如果预设语言没包括所需要的语言, 这自己传入language表的真是名. 优先级大于languageType
     */
    public func bclocalized(tableName: String? = nil, languageType: BSSEnumLanguage? = nil, languageRawValue: String? = nil) -> String {
        
        let systemLanguage = languageType == nil ? bclocalizedmanager.bccurrentlanguage : languageType
                
        if languageRawValue != nil {
            return NSLocalizedString(self, tableName: (tableName == nil ? UIApplication.bcprojectName() : tableName!), bundle:  Bundle(path: Bundle.main.path(forResource: languageRawValue!, ofType: "lproj") ?? "") ?? Bundle.main, value: "", comment: "")
        }
        else{
            return NSLocalizedString(self, tableName: (tableName == nil ? UIApplication.bcprojectName() : tableName!), bundle:  Bundle(path: Bundle.main.path(forResource: systemLanguage?.rawValue, ofType: "lproj") ?? "") ?? Bundle.main, value: "", comment: "")
        }
    }
}
