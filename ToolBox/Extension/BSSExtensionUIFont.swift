//
//  BSSExtensionUIFont.swift
//  IOSToolBox
//
//  Created by BSSCBC on 2024/10/13.
//

import UIKit

extension UIFont {
    public static func bcmediumfont(_ fontSize: CGFloat) -> UIFont {
        return UIFont.init(name: "PingFangSC-Medium", size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
    }
    
    public static func bcsemiboldfont(_ fontSize: CGFloat) -> UIFont {
        return UIFont.init(name: "PingFangSC-Semibold", size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
    }
}

extension UIFont {
    public static func bcAlimamaShuHeiTifont(_ fontSize: CGFloat) -> UIFont {
        return UIFont.init(name: "Alimama ShuHeiTi", size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
    }
    
    public static func bcsourceKeynoteartHansfont(_ fontSize: CGFloat) -> UIFont {
        return UIFont.init(name: "Source-KeynoteartHans", size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
    }
}

extension UIFont {
    public static func bcdinfont(_ fontSize: CGFloat) -> UIFont {
        return UIFont.init(name: "DIN Alternate", size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
    }
}

extension UIFont {
    public static func bcximaitifont(_ fontSize: CGFloat) -> UIFont {
        return UIFont.init(name: "ZiZhiQuXiMaiTi", size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
    }
}

extension UIFont {
    public static func bcgothamfont(_ fontSize: CGFloat) -> UIFont {
        return UIFont.init(name: "Gotham", size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
    }
}

extension UIFont {
    public static func bczihunxingshitifont(_ fontSize: CGFloat) -> UIFont {
        return UIFont.init(name: "zihunxingshiti", size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
    }
}

extension UIFont {
    public static func bcharmonyOSSansSCfont(_ fontSize: CGFloat) -> UIFont {
        return UIFont.init(name: "HarmonyOS Sans SC", size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
    }
}

extension UIFont {
    public static func bcarialroundedMTboldfont(_ fontSize: CGFloat) -> UIFont {
        return UIFont.init(name: "Arial Rounded MT Bold", size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
    }
}

extension UIFont {
    public static func bcxianertifont(_ fontSize: CGFloat) -> UIFont {
        return UIFont.init(name: "XianErTi", size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
    }
}

extension UIFont {
    public static func bcchillaxboldfont(_ fontSize: CGFloat) -> UIFont {
        return UIFont.init(name: "Chillax-Bold", size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
    }
}

extension UIFont {
    public static func bcchillaxmediumfont(_ fontSize: CGFloat) -> UIFont {
        return UIFont.init(name: "Chillax-Medium", size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
    }
}

extension UIFont {
    public static func bcchillaxSemiboldfont(_ fontSize: CGFloat) -> UIFont {
        return UIFont.init(name: "Chillax-Semibold", size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
    }
}

extension UIFont {
    public static func bcRobotoMediumfont(_ fontSize: CGFloat) -> UIFont {
        return UIFont.init(name: "Roboto-Medium", size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
    }
    
    public static func bcRobotoRegularfont(_ fontSize: CGFloat) -> UIFont {
        return UIFont.init(name: "Roboto-Regular", size: fontSize) ?? UIFont.init(name: "Roboto", size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
    }
}

extension UIFont {
    public static func bcDDINPROfont(_ fontSize: CGFloat) -> UIFont {
        return UIFont.init(name: "D-DIN-PRO", size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
    }
    
    public static func bcDDINPRO600font(_ fontSize: CGFloat) -> UIFont {
        return UIFont.bcDDINPROSemiboldfont(fontSize)
    }
    //  600
    public static func bcDDINPROSemiboldfont(_ fontSize: CGFloat) -> UIFont {
        return UIFont.init(name: "D-DIN-PRO-Semibold", size: fontSize) ?? UIFont.bcDDINPROfont(fontSize)
    }
    
    //  500
    public static func bcDDINPRO500font(_ fontSize: CGFloat) -> UIFont {
        return UIFont.bcDDINPROMediumfont(fontSize)
    }
    
    public static func bcDDINPROMediumfont(_ fontSize: CGFloat) -> UIFont {
        return UIFont.init(name: "D-DIN-PRO-Medium", size: fontSize) ?? UIFont.bcDDINPROfont(fontSize)
    }
    
    //  700
    public static func bcDDINPRO700font(_ fontSize: CGFloat) -> UIFont {
        return UIFont.bcDDINPROBoldfont(fontSize)
    }
    
    public static func bcDDINPROBoldfont(_ fontSize: CGFloat) -> UIFont {
        return UIFont.init(name: "D-DIN-PRO-Bold", size: fontSize) ?? UIFont.bcDDINPROfont(fontSize)
    }
    
    // 800
    public static func bcDDINPRO800font(_ fontSize: CGFloat) -> UIFont {
        return UIFont.bcDDINPROExtraBoldfont(fontSize)
    }
    
    public static func bcDDINPROExtraBoldfont(_ fontSize: CGFloat) -> UIFont {
        return UIFont.init(name: "D-DIN-PRO-ExtraBold", size: fontSize) ?? UIFont.bcDDINPROfont(fontSize)
    }
    
    public static func bcDINCondensedfont(_ fontSize: CGFloat) -> UIFont {
        return UIFont.init(name: "DIN Condensed", size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
    }
}
