//
//  JY_Extension_Int.swift
//  JYYQToolBox
//
//  Created by JYYQLin on 2024/10/13.
//

import UIKit

extension Int {
    public func yq_power(_ exponent: Int) -> Int {
        var result = 1
        for _ in 0..<exponent {
            result *= self
        }
        return result
    }
}

extension Double {
    public func yq_power(_ exponent: Int) -> Double {
        var result = 1.0
        for _ in 0..<exponent {
            result *= self
        }
        return result
    }
}

extension Int {
    public func yq_to_unitString() -> String {
        let numABS = abs(self)
        let sign = (self < 0) ? "-" : ""

        switch numABS {
        case 1_0000...:
            let formatted = Double(numABS) / 1_0000
            return "\(sign)\(formatted.yq_format(f: ".2"))w"
        case 1_000...:
            let formatted = Double(numABS) / 1_000
            return "\(sign)\(formatted.yq_format(f: ".2"))k"
        default:
            return "\(self)"
        }
    }
}

extension Double {
    public func yq_format(f: String) -> String {
         return String(format: "%\(f)f", self)
     }
}


//extension Int {
//    public func yq_to_unitString() -> String {
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
