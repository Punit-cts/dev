//
//  AppColorList.swift
//

import UIKit

extension UIColor {
    
    @nonobjc public class var skeletonBGColor: UIColor {
        return UIColor(red: 196.0/255.0, green: 195.0/255.0, blue: 197.0/255.0, alpha: 1.0)
    }
    
    @nonobjc public class var appGradientStart: UIColor {
        return UIColor(0x0FC7EC)
    }
    @nonobjc public class var appGradientEnd: UIColor {
        return UIColor(0x0076FA)
    }
    @nonobjc public class var appBlue1: UIColor {
        return UIColor(0x0387D1)
    }
    @nonobjc public class var appBlue: UIColor {
        return UIColor(0x0387D1)
    }
    @nonobjc public class var appRed: UIColor {
        return UIColor(0xFF3D00)
    }
    @nonobjc public class var appBlueMedium: UIColor {
        return UIColor(0x1597B8)
    }
    @nonobjc public class var appBlueDark: UIColor {
        return UIColor(0x0567BC)
    }
    @nonobjc public class var appGreen: UIColor {
        return UIColor(0x48C741)
    }
    @nonobjc public class var appOrange: UIColor {
        return UIColor(0xFF7A00)
    }
    
    @nonobjc public class var appBGContent: UIColor {
        return UIColor(0xF3F7FA)
    }
    @nonobjc public class var appF3F7FA: UIColor {
        return UIColor(0xF3F7FA)
    }
    @nonobjc public class var appBGHeaderDark: UIColor {
        return UIColor(0x707070)
    }
    @nonobjc public class var appLighterGray: UIColor {
        return UIColor(0x707070).withAlphaComponent(0.2)
    }
    @nonobjc public class var appTextHeader: UIColor {
        return UIColor(0xA9B9C6)
    }
    @nonobjc public class var userTextLabel: UIColor {
        return UIColor(0x19496A)
    }
    @nonobjc public class var appTextDetail: UIColor {
        return UIColor(0x323C47)
    }
    @nonobjc public class var appPlaceHolderActive: UIColor {
        return UIColor(0x909090)
    }
    @nonobjc public class var appBGHeader: UIColor {
        return UIColor(0xD1DAE2)
    }
    @nonobjc public class var appBGHeader12: UIColor {
        return UIColor(0xD1DAE2).withAlphaComponent(0.12)
    }

    
    @nonobjc public class var appLightHeader: UIColor {
        return UIColor(0x707070)
    }
    
    @nonobjc public  class var appBlack: UIColor {
        return UIColor(0x323C47)
    }
    @nonobjc public  class var appBlackHeading: UIColor {
        return UIColor(0x1A051D)
    }
    @nonobjc public  class var appF7FAFC: UIColor {
        return UIColor(0xF7FAFC)
    }
    
    @nonobjc public  class var filled: UIColor {
        return UIColor(0xF7CB73)
    }
    
    @nonobjc public  class var unfilled: UIColor {
        return UIColor(0x929496)
    }
    
    @nonobjc public  class var border: UIColor {
        return UIColor(0xECEBED)
    }
    @nonobjc public  class var inactiveStatus: UIColor {
        return UIColor(0xC9C9C9)
    }
    @nonobjc public  class var swipeRed: UIColor {
        return UIColor(0xEA584E)
    }
    @nonobjc public  class var swipeOrange: UIColor {
        return UIColor(0xFF6D22)
    }
    @nonobjc public  class var swipeGreen: UIColor {
        return UIColor(0x3BB54A)
    }
    
    @nonobjc public  class var textActiveColor: UIColor {
        return UIColor(0x000E11)
    }
    @nonobjc public  class var textDark: UIColor {
        return ThemeColor().TextLabel1 ?? UIColor(0x1A051D)
    }
    @nonobjc public  class var textDarkLight: UIColor {
        return UIColor(0xC5C5C5)
    }
    @nonobjc public  class var textMedium: UIColor {
        return UIColor(0x646464)
    }
    @nonobjc public  class var textLight: UIColor {
        return UIColor(0xCCCCCC)
    }
    @nonobjc public class var textLightC: UIColor {
        return UIColor(0xCCCCCC)
    }
    @nonobjc public class var textLightD: UIColor {
        return UIColor(0xDDDDDD)
    }
    @nonobjc public  class var textInactive: UIColor {
        return UIColor(0xA9B9C6)
    }
    @nonobjc public  class var textLightWhite: UIColor {
        return UIColor(0xEFEFEF)
    }
    @nonobjc public  class var appBlue03C3EC: UIColor {
        return UIColor(0x03C3EC)
    }
    @nonobjc public  class var appRed1: UIColor {
        return UIColor(0xF44336)
    }
    @nonobjc public class var upCommingRed: UIColor {
        return UIColor(0x844D0E)
    }
    @nonobjc public  class var appDarkRed: UIColor {
        return UIColor(0x800000)
    }
    @nonobjc public  class var appCheckGreen: UIColor {
        return UIColor(0x2CC877)
    }
    @nonobjc public  class var appGreen1: UIColor {
        return UIColor(0x2CC877)
    }
    @nonobjc public  class var appLightBlue: UIColor {
        return UIColor(0xA3DEFD)
    }
    @nonobjc public  class var appHeaderBlue: UIColor {
        return UIColor(0xEAFAFF)
    }
    @nonobjc public  class var appHeaderBlueTint: UIColor {
        return UIColor(0x00CCFF)
    }
    @nonobjc public  class var appHeaderRed: UIColor {
        return UIColor(0xFDEFEE)
    }
    @nonobjc public  class var appHeaderRedTint: UIColor {
        return UIColor(0xEA584E)
    }
    @nonobjc public  class var appLightGreen: UIColor {
        return UIColor(0xD7FFD9)
    }
    @nonobjc public  class var appNotify: UIColor {
        return UIColor(0x155F80)
    }
    @nonobjc public  class var lightSeaGreen: UIColor {
        return UIColor(0x20B2AA) // 32,178,170
    }
    @nonobjc public  class var darkGreen: UIColor {
        return UIColor(0x006400) // 0,100,0
    }
    @nonobjc public  class var lightGreen: UIColor {
        return UIColor(0xAED581) // 0,100,0
    }
    @nonobjc public  class var appYellow: UIColor {
        return UIColor(0xF3CD09)
    }
    @nonobjc public  class var appYellow1: UIColor {
        return UIColor(0xFFC107)
    }
    @nonobjc public  class var headerBackground: UIColor {
        return UIColor(0xEEEEEE)
    }
    @nonobjc public  class var appDarkGrey: UIColor {
        return UIColor(0x9B9B9B)
    }
    @nonobjc public  class var appDarkBlue: UIColor {
        return UIColor(0x155F80)
    }
    @nonobjc public  class var brightSkyBlue: UIColor {
        return .appBlue
    }
    @nonobjc public  class var petrol: UIColor {
        return UIColor(red: 0.0, green: 85.0 / 255.0, blue: 106.0 / 255.0, alpha: 1.0)
    }
    @nonobjc public  class var warmGrey: UIColor {
        return UIColor(white: 112.0 / 255.0, alpha: 1.0)
    }
    @nonobjc public  class var warmGreyTwo: UIColor {
        return UIColor(white: 114.0 / 255.0, alpha: 1.0)
    }
    @nonobjc public  class var black35: UIColor {
        return UIColor(white: 0.0, alpha: 0.35)
    }
    @nonobjc public  class var greenBar: UIColor {
        return .appGreen
    }
    @nonobjc public  class var redBar: UIColor {
        return .appRed
    }
    @nonobjc public  class var yellowBar: UIColor {
        return .appYellow
    }
    
    @nonobjc public class var me: UIColor {
        return UIColor(0xBEE8FC)
    }
    @nonobjc public class var other: UIColor {
        return UIColor(0xE8EAEB)
    }
    @nonobjc public class var dddddd: UIColor {
        return UIColor(red: 221.0/255.0, green: 221.0/255.0, blue: 221.0/255.0, alpha: 1.0)
    }
    @nonobjc public class var CCFF: UIColor {
        return UIColor(red: 0.0/255.0, green: 204.0/255.0, blue: 255.0/255.0, alpha: 1.0)
    }
    
    private convenience init(_ hex: UInt, alpha: CGFloat = 1.0) {
        self.init(
            red: CGFloat((hex & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((hex & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(hex & 0x0000FF) / 255.0,
            alpha: alpha
        )
    }
    
    private convenience init(colorCode: String, alpha: Float = 1.0){
        let scanner = Scanner(string:colorCode)
        var color:UInt64 = 0;
        scanner.scanHexInt64(&color)
        
        let mask = 0x000000FF
        let red = CGFloat(Float(Int(color >> 16) & mask)/255.0)
        let green = CGFloat(Float(Int(color >> 8) & mask)/255.0)
        let blue = CGFloat(Float(Int(color) & mask)/255.0)
        
        self.init(red: red, green: green, blue: blue, alpha: CGFloat(alpha))
    }
    
    
    public func image(of size: CGSize = CGSize(width: 1, height: 1)) -> UIImage {
        let rect = CGRect(origin: .zero, size: size)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        self.setFill()
        UIRectFill(rect)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
}

extension UIColor {
    var hexString:String? {
        if let components = self.cgColor.components {
            let r = components[0]
            let g = components[1]
            let b = components[2]
            return  String(format: "%02X%02X%02X", (Int)(r * 255), (Int)(g * 255), (Int)(b * 255))
        }
        return nil
    }
}
