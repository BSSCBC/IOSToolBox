//
//  BSSDateTool.swift
//  IOSToolBox
//
//  Created by IOSToolBox on 2025/4/14.
//

import UIKit

public class BSSDateTool {

}

extension Int {
    public func bcsecondstominutesandsecond() -> String {
        let hours = self / 3600
          let minutes = (self % 3600) / 60
          let remainingSeconds = self % 60
        
        if hours > 0 {
            return String(format: "%02d:%02d:%02d", hours, minutes, remainingSeconds)
        }
        else{
            return String(format: "%02d:%02d", minutes, remainingSeconds)
        }
      }
}
