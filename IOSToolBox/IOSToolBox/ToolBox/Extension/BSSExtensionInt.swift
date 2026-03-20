//
//  BSSExtensionInt.swift
//  IOSToolBox
//
//  Created by BSSCBC on 2024/10/13.
//

import UIKit

extension Int {
    public func bcpower( exponent: Int) -> Int {
        var result = 1
        for _ in 0..<exponent {
            result *= self
        }
        return result
    }
}

extension Double {
    public func bcpower( exponent: Int) -> Double {
        var result = 1.0
        for _ in 0..<exponent {
            result *= self
        }
        return result
    }
}

extension Int {
    public func bctounitString() -> String {
        let numABS = abs(self)
        let sign = (self < 0) ? "-" : ""

        switch numABS {
        case 10000...:
            let formatted = Double(numABS) / 10000
            return "\(sign)\(formatted.bcformat(f: ".2"))w"
        case 1000...:
            let formatted = Double(numABS) / 1000
            return "\(sign)\(formatted.bcformat(f: ".2"))k"
        default:
            return "\(self)"
        }
    }
}

extension Double {
    public func bcformat(f: String) -> String {
         return String(format: "%\(f)f", self)
     }
}


//extension Int {
//    public func bctounitString() -> String {
//        if self > 1000 && self < 10000 {
//            return String(format: "%.1f", Double(self) / 1000.0) + "k"
//        }else if self > 10000 {
//            let count = Double(self) / 10000.0
//            return String(format: "%.1f", count) + "w"
//        }else{
//            return "\(self)"
//        }
//    }
//}
