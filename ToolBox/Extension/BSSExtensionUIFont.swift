//
//  BSSExtensionUIFont.swift
//  IOSToolBox
//
//  Created by BSSCBC on 2024/10/13.
//

import UIKit

extension UIFont {
    public static func bcmediumfont( fontSize: CGFloat) -> UIFont {
        return UIFont.init(name: "PingFangSC-Medium", size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
    }
    
    public static func bcsemiboldfont( fontSize: CGFloat) -> UIFont {
        return UIFont.init(name: "PingFangSC-Semibold", size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
    }
}

extension UIFont {
    public static func bcAlimamaShuHeiTifont( fontSize: CGFloat) -> UIFont {
        return UIFont.init(name: "Alimama ShuHeiTi", size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
    }
    
    public static func bcsourceKeynoteartHansfont( fontSize: CGFloat) -> UIFont {
        return UIFont.init(name: "Source-KeynoteartHans", size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
    }
}

extension UIFont {
    public static func bcdinfont( fontSize: CGFloat) -> UIFont {
        return UIFont.init(name: "DIN Alternate", size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
    }
}

extension UIFont {
    public static func bcximaitifont( fontSize: CGFloat) -> UIFont {
        return UIFont.init(name: "ZiZhiQuXiMaiTi", size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
    }
}

extension UIFont {
    public static func bcgothamfont( fontSize: CGFloat) -> UIFont {
        return UIFont.init(name: "Gotham", size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
    }
}

extension UIFont {
    public static func bczihunxingshitifont( fontSize: CGFloat) -> UIFont {
        return UIFont.init(name: "zihunxingshiti", size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
    }
}

extension UIFont {
    public static func bcharmonyOSSansSCfont( fontSize: CGFloat) -> UIFont {
        return UIFont.init(name: "HarmonyOS Sans SC", size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
    }
}

extension UIFont {
    public static func bcarialroundedMTboldfont( fontSize: CGFloat) -> UIFont {
        return UIFont.init(name: "Arial Rounded MT Bold", size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
    }
}

extension UIFont {
    public static func bcxianertifont( fontSize: CGFloat) -> UIFont {
        return UIFont.init(name: "XianErTi", size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
    }
}

extension UIFont {
    public static func bcchillaxboldfont( fontSize: CGFloat) -> UIFont {
        return UIFont.init(name: "Chillax-Bold", size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
    }
}

extension UIFont {
    public static func bcchillaxmediumfont( fontSize: CGFloat) -> UIFont {
        return UIFont.init(name: "Chillax-Medium", size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
    }
}

extension UIFont {
    public static func bcchillaxSemiboldfont( fontSize: CGFloat) -> UIFont {
        return UIFont.init(name: "Chillax-Semibold", size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
    }
}

extension UIFont {
    public static func bcRobotoMediumfont( fontSize: CGFloat) -> UIFont {
        return UIFont.init(name: "Roboto-Medium", size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
    }
    
    public static func bcRobotoRegularfont( fontSize: CGFloat) -> UIFont {
        return UIFont.init(name: "Roboto-Regular", size: fontSize) ?? UIFont.init(name: "Roboto", size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
    }
}

extension UIFont {
    public static func bcDDINPROfont( fontSize: CGFloat) -> UIFont {
        return UIFont.init(name: "D-DIN-PRO", size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
    }
    
    public static func bcDDINPRO600font( fontSize: CGFloat) -> UIFont {
        return UIFont.bcDDINPROSemiboldfont(fontSize)
    }
    //  600
    public static func bcDDINPROSemiboldfont( fontSize: CGFloat) -> UIFont {
        return UIFont.init(name: "D-DIN-PRO-Semibold", size: fontSize) ?? UIFont.bcDDINPROfont(fontSize)
    }
    
    //  500
    public static func bcDDINPRO500font( fontSize: CGFloat) -> UIFont {
        return UIFont.bcDDINPROMediumfont(fontSize)
    }
    
    public static func bcDDINPROMediumfont( fontSize: CGFloat) -> UIFont {
        return UIFont.init(name: "D-DIN-PRO-Medium", size: fontSize) ?? UIFont.bcDDINPROfont(fontSize)
    }
    
    //  700
    public static func bcDDINPRO700font( fontSize: CGFloat) -> UIFont {
        return UIFont.bcDDINPROBoldfont(fontSize)
    }
    
    public static func bcDDINPROBoldfont( fontSize: CGFloat) -> UIFont {
        return UIFont.init(name: "D-DIN-PRO-Bold", size: fontSize) ?? UIFont.bcDDINPROfont(fontSize)
    }
    
    // 800
    public static func bcDDINPRO800font( fontSize: CGFloat) -> UIFont {
        return UIFont.bcDDINPROExtraBoldfont(fontSize)
    }
    
    public static func bcDDINPROExtraBoldfont( fontSize: CGFloat) -> UIFont {
        return UIFont.init(name: "D-DIN-PRO-ExtraBold", size: fontSize) ?? UIFont.bcDDINPROfont(fontSize)
    }
    
    public static func bcDINCondensedfont( fontSize: CGFloat) -> UIFont {
        return UIFont.init(name: "DIN Condensed", size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
    }
}
