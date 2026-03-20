//
//  BSSJsonTool.swift
//  IOSToolBox
//
//  Created by BSSCBC on 2025/4/14.
//

import UIKit

public class BSSJsonTool {
    
}

//  MARK: 将[String: Any]转成对应的Json字符串
extension BSSJsonTool {
    /**
     将[String: Any]转成对应的Json字符串
     */
    public static func bcdictionarytoJSONString( dictionary: [String: Any]) -> String? {
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: dictionary, options: .prettyPrinted)
            if let jsonString = String(data: jsonData, encoding: .utf8) {
                return jsonString
            }
        } catch {
            print("Error converting dictionary to JSON: \(error)")
        }
        return nil
    }
}

//  MARK: 将[Any]转成对应的Json字符串
extension BSSJsonTool {
    /**
     将[Any]转成对应的Json字符串
     */
    public static func bcarraytoJSONString( array: [[Any]]) -> String? {
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: array, options: .prettyPrinted)
            if let jsonString = String(data: jsonData, encoding: .utf8) {
                return jsonString
            }
        } catch {
            print("将数组转为 JSON 时出错: \(error)")
        }
        return nil
    }
}

extension BSSJsonTool {
    /// json字符串转字典
    /// - Parameter jsonStirng: json字符串
    /// - Returns: 字典(类型[String : Any])
    public static func bcJSONStringtodictionary(from jsonStirng: String) -> [String : Any]? {
        guard let data = bcJSONStringtoObjc(from: jsonStirng) else {
            return nil
        }
        return data as? [String : Any]
    }
}

//  MARK: json字符串转对象
extension BSSJsonTool {
    /// json字符串转对象
    /// - Parameter jsonStirng: json字符串
    /// - Returns: 对象(类型Any)
    public static func bcJSONStringtoObjc(from jsonStirng: String) -> Any? {
        guard let data = jsonStirng.data(using: .utf8) else {
            return nil
        }
        
        let obj = try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers)
        
        return obj
    }
}
