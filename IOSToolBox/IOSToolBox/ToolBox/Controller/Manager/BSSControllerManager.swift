//
//  BSSControllerManager.swift
//  IOSToolBox
//
//  Created by BSSCBC on 2025/1/17.
//

import UIKit

public let bccontrollermanager = BSSControllerManager.bcshared

public class BSSControllerManager {
    
    static let bcshared: BSSControllerManager = BSSControllerManager()

    private(set) lazy var bcisinitialize: Bool = false
    
    private lazy var bclog: String = ""
    
    private lazy var bcisdebug: Bool = false
    
    private init() {}
    
    open func bcinitializemanager() {
        if bcisinitialize == true {
            return
        }
        
        bcisinitialize = true
    }
    
    open func bcaddlog(controllerName: String, status: String) {
        let time = bcdateFormat()
        
        let log = "time: " + time + " | " + "controllerName: " + controllerName + " | "  + "status: " + status + "\n"
        
        bclog = bclog + log
        
        if bcisdebug == true {
            print(log)
        }
    }

    open func bcsetlog(log: String) {
        bclog = log
    }

    open func bcset(isDebug: Bool) {
        bcisdebug = isDebug
    }
}

extension BSSControllerManager {
    private func bcdateFormat() -> String {
        let date = Date()
        let dateFormatter = DateFormatter()

        dateFormatter.dateFormat = "yyyy年MM月dd日 HH:mm:ss"
        
        return dateFormatter.string(from: date)
    }
}
