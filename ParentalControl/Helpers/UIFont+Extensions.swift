//
//  UIFont+Extensions.swift
//

import UIKit

var defaulttFontSize: CGFloat = 12.0
var headerFontSize: CGFloat = 20.0

enum FontStyle: String {
    case SFUIRegular = "SFUIDisplay-Regular"
    case SFUIMedium = "SFUIDisplay-Medium"
    case SFUISemiBold = "SFUIDisplay-Semibold"
    case SFUIBold = "SFUIDisplay-Bold"
    case SFUILight = "SFUIDisplay-Light"
    case SFUIHeavy = "SFUIDisplay-Heavy"
    case SFUIBlack = "SFUIDisplay-Black"
    case SFUITextSemiBold = "SFUIText-Semibold"
    case SFUITextRegular = "SFUIText-Regular"
    case SFUITextItalic = "SFUIText-RegularItalic"
    case SFProDisplayBold = "SFProDisplay-Bold"
    case SFProDisplayRegular = "SFProDisplay-Regular"
    case SFProDisplayMedium = "SFProDisplay-Medium"
    case SFProDisplaySemiBold = "SFProDisplay-Semibold"
}

extension UIFont {
    convenience init?(fontStyle: FontStyle, size: CGFloat) {
        self.init(name: fontStyle.rawValue, size: size)
    }
    
    var appSFUIDisplayRegular: UIFont {
        return UIFont(name: FontStyle.SFUIRegular.rawValue, size: defaulttFontSize) ?? UIFont.systemFont(ofSize: defaulttFontSize)
    }
    
    var appSFUIDisplayMedium: UIFont {
        return UIFont(name: FontStyle.SFUIMedium.rawValue, size: defaulttFontSize) ?? UIFont.systemFont(ofSize: defaulttFontSize)
    }
    
    var appSFUIDisplayBold: UIFont {
        return UIFont(name: FontStyle.SFUIBold.rawValue, size: defaulttFontSize) ?? UIFont.italicSystemFont(ofSize: defaulttFontSize)
    }
    
    var appSFUIDisplaySemiBold: UIFont {
        return UIFont(name: FontStyle.SFUISemiBold.rawValue, size: defaulttFontSize) ?? UIFont.boldSystemFont(ofSize: defaulttFontSize)
    }
    
    var appSFUITextRegular: UIFont {
        return UIFont(name: FontStyle.SFUITextRegular.rawValue, size: defaulttFontSize) ?? UIFont.italicSystemFont(ofSize: defaulttFontSize)
    }
    
    var appSFUITextItalic: UIFont {
        return UIFont(name: FontStyle.SFUITextItalic.rawValue, size: defaulttFontSize) ?? UIFont.boldSystemFont(ofSize: defaulttFontSize)
    }
    
    var appSFUITextSemiBold: UIFont {
        return UIFont(name: FontStyle.SFUITextSemiBold.rawValue, size: defaulttFontSize) ?? UIFont.boldSystemFont(ofSize: defaulttFontSize)
    }
    
    
    var appSFUIDisplayBlack: UIFont {
        return UIFont(name: FontStyle.SFUIBlack.rawValue, size: defaulttFontSize) ?? UIFont.systemFont(ofSize: defaulttFontSize)
    }
    
    var appSFUIDisplayLight: UIFont {
        return UIFont(name: FontStyle.SFUILight.rawValue, size: defaulttFontSize) ?? UIFont.italicSystemFont(ofSize: defaulttFontSize)
    }
    
    var appSFUIDisplayHeavy: UIFont {
        return UIFont(name: FontStyle.SFUIHeavy.rawValue, size: defaulttFontSize) ?? UIFont.italicSystemFont(ofSize: defaulttFontSize)
    }
    
}

extension UILabel {
    func font(_ font: UIFont) {
        self.font = UIFontMetrics(forTextStyle: .body).scaledFont(for: font)
        self.adjustsFontForContentSizeCategory = true
    }
}

extension UIButton {
    func font(_ font: UIFont) {
        self.titleLabel?.font = UIFontMetrics(forTextStyle: .body).scaledFont(for: font)
        self.titleLabel?.adjustsFontForContentSizeCategory = true
    }
}

extension UITextField {
    func font(_ font: UIFont) {
        self.font = UIFontMetrics(forTextStyle: .body).scaledFont(for: font)
        self.adjustsFontForContentSizeCategory = true
    }
}

extension UITextView {
    func font(_ font: UIFont) {
        self.font = UIFontMetrics(forTextStyle: .body).scaledFont(for: font)
        self.adjustsFontForContentSizeCategory = true
    }
}



