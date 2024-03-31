//
//  Strings+Extensions.swift
//  ParentalControl Software
//
//  Created by Punit Thakali on 24/03/2024.
//

import Foundation
import UIKit


extension String {
    
    var acronym: String {
        var lists = self.components(separatedBy: " ")
        lists = lists.map{ $0.first }.flatMap{ $0 }.map{ String($0) }
        return lists.joined(separator: "").uppercased()
    }
    
    var acronymImage: UIImage? {
        let frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        let nameLabel = UILabel(frame: frame)
        nameLabel.textAlignment = .center
        nameLabel.backgroundColor = UIColor(red: 227/256, green: 229/256, blue: 241/256, alpha: 1.0)
        nameLabel.textColor = UIColor(red: 76/256, green: 39/256, blue: 109/256, alpha: 1.0)
        nameLabel.font = UIFont(name: "SFUIDisplay-Bold", size: self.acronym.count > 2 ? 32.0 : 36.0)
        nameLabel.text = self.acronym
        UIGraphicsBeginImageContext(frame.size)
        if let currentContext = UIGraphicsGetCurrentContext() {
            nameLabel.layer.render(in: currentContext)
            let nameImage = UIGraphicsGetImageFromCurrentImageContext()
            return nameImage
        }
        return nil
    }
    
    var first: String {
        return String(prefix(1))
    }
    
    var uppercasedFirst: String {
        return first.uppercased() + String(dropFirst())
    }
    
    public var isEmail: Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
    public var isHtml: Bool {
        let validateTest = NSPredicate(format:"SELF MATCHES %@", "<[a-z][\\s\\S]*>")
        return validateTest.evaluate(with: self)
    }
    
    public var isFullName: Bool {
        
        let name = self.trimmingCharacters(in: .whitespacesAndNewlines)
        let familyName = name.components(separatedBy: " ")
        if familyName.count <= 1 {
            return false
        }
        let check = familyName.compactMap ({ (text) -> Bool in
            text.count > 1
        })
        let val = check.first! && check.last!
        
        return val
    }
    
    public var isPassword:Bool {
        return self.count >= 8
    }
    
    public var isSingleNumber:Bool {
        let phoneRegEx = "[0-9]{1}"
        let phoneTest = NSPredicate(format:"SELF MATCHES %@", phoneRegEx)
        return phoneTest.evaluate(with: self)
    }
    
    public var isPin:Bool {
        let phoneRegEx = "[0-9]{4}"
        let phoneTest = NSPredicate(format:"SELF MATCHES %@", phoneRegEx)
        return phoneTest.evaluate(with: self)
    }
    
    public var doesContainsUpCase:Bool {
        let passwordRegEx = "^(?=.*[A-Z]).{8,}$"
        let passwordTest = NSPredicate(format:"SELF MATCHES %@", passwordRegEx)
        return passwordTest.evaluate(with: self)
    }
    
    public var doesContainsSpecCharacters:Bool {
        let passwordRegEx = "^(?=.*[!@#$%^&*]).{8,}$"
        let passwordTest = NSPredicate(format:"SELF MATCHES %@", passwordRegEx)
        return passwordTest.evaluate(with: self)
    }
    
    public var doesContainsLowCase:Bool {
        let passwordRegEx = "^(?=.*[a-z]).{8,}$"
        let passwordTest = NSPredicate(format:"SELF MATCHES %@", passwordRegEx)
        return passwordTest.evaluate(with: self)
    }
    
    public var doesContainsNumbers:Bool {
        let passwordRegEx = "^(?=.*[0-9]).{8,}$"
        let passwordTest = NSPredicate(format:"SELF MATCHES %@", passwordRegEx)
        return passwordTest.evaluate(with: self)
    }
    
    public var isPhone:Bool {
        let phoneRegEx = "[0-9]{10}"
        let phoneTest = NSPredicate(format:"SELF MATCHES %@", phoneRegEx)
        return phoneTest.evaluate(with: self)
    }
    
    public var islocalPhone:Bool {
        let phoneRegEx = "[0-9]{8,10}"
        let phoneTest = NSPredicate(format:"SELF MATCHES %@", phoneRegEx)
        return phoneTest.evaluate(with: self)
    }
    
    public var isCode:Bool {
        let phoneRegEx = "[0-9]{5}"
        let phoneTest = NSPredicate(format:"SELF MATCHES %@", phoneRegEx)
        return phoneTest.evaluate(with: self)
    }
    
    public var isCVV:Bool {
        let phoneRegEx = "[0-9]{3}"
        let phoneTest = NSPredicate(format:"SELF MATCHES %@", phoneRegEx)
        return phoneTest.evaluate(with: self)
        // return self.characters.count == 3
    }
    
    public var isCreditCard:Bool {
        let phoneRegEx = "[0-9]{16}"
        let phoneTest = NSPredicate(format:"SELF MATCHES %@", phoneRegEx)
        return phoneTest.evaluate(with: self)
    }
    
    var isNumber : Bool {
        let phoneRegEx = "[0-9]{0,}"
        let phoneTest = NSPredicate(format:"SELF MATCHES %@", phoneRegEx)
        return phoneTest.evaluate(with: self)
    }
    
    var isAmountWithPaisa:Bool {
        let amountRegEx = "[0-9]{0,6}+(.{1}[0-9]{0,2})?"
        let amountTest = NSPredicate(format:"SELF MATCHES %@", amountRegEx)
        return amountTest.evaluate(with: self)
    }
    
    var isAmountWithoutPaisa:Bool {
        let amountRegEx = "[0-9]{0,6}?"
        let amountTest = NSPredicate(format:"SELF MATCHES %@", amountRegEx)
        return amountTest.evaluate(with: self)
    }
    
    func validateFormatYYYYMMDD(with string:String, removeText:String = "-") -> Bool {
        
        let cleanText = self.replacingOccurrences(of: removeText, with: "")
        var isValid = cleanText.isNumber && string.isNumber && self.count <= 7
        
        if cleanText.count == 0 {
            if let yearStart = Int(string) {
                isValid = yearStart <= 2
            }
        } else if cleanText.count == 4 {
            if let value = Int(string) {
                isValid = value <= 1
            }
        } else if cleanText.count == 5 {
            let lastText = String(cleanText.suffix(1))
            if let month = Int(lastText+string) {
                isValid = month <= 12
            }
        } else if cleanText.count == 6 {
            if let value = Int(string) {
                isValid = value <= 3
            }
        } else if cleanText.count == 7 {
            let lastText = String(cleanText.suffix(1))
            if let value = Int(lastText+string) {
                isValid = value <= 32
            }
        }
        return isValid
    }
    
    var stringWithoutdashes: String {
        return self.replacingOccurrences(of: "-", with: "")
    }
    
    var letterCapitalize:String {
        let parts = self.components(separatedBy: " ")
        let firstCapitalized = parts.map { String($0.capitalizedFirstLetter) }
        let joined = firstCapitalized.joined(separator: " ")
        return joined
    }
    
    var capitalizedFirstLetter: String {
        let first = String(prefix(1)).capitalized
        let other = String(dropFirst())
        return first + other
    }
    
    var createUSPhone:String {
        guard !self.isEmpty else { return "" }
        guard let regex = try? NSRegularExpression(pattern: "[\\s-\\(\\)]", options: .caseInsensitive) else { return "" }
        let r = NSString(string: self).range(of: self)
        var number = regex.stringByReplacingMatches(in: self, options: .init(rawValue: 0), range: r, withTemplate: "")

        if number.count > 10 {
            let tenthDigitIndex = number.index(number.startIndex, offsetBy: 10)
            number = String(number[number.startIndex..<tenthDigitIndex])
        }

        if number.count < 7 {
            let end = number.index(number.startIndex, offsetBy: number.count)
            let range = number.startIndex..<end
            number = number.replacingOccurrences(of: "(\\d{3})(\\d+)", with: "$1-$2", options: .regularExpression, range: range)

        } else {
            let end = number.index(number.startIndex, offsetBy: number.count)
            let range = number.startIndex..<end
            number = number.replacingOccurrences(of: "(\\d{3})(\\d{3})(\\d+)", with: "($1) $2-$3", options: .regularExpression, range: range)
        }

        return number
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizedFirstLetter
    }
    
    public var isValidLength:Bool{
        let characterLength:Int = self.count
        return characterLength >= 8 && characterLength <= 12
    }
    
    public var isValidEmail: Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
    public var isValidPassword:Bool {
        let passwordRegEx = "^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*-_=+?<]).{8,}$"
        let passwordTest = NSPredicate(format:"SELF MATCHES %@", passwordRegEx)
        return passwordTest.evaluate(with: self)
    }
    
    public var containsAlphabet: Bool{
        let numberRegEx  = ".*[a-z A-Z]+.*"
        let testCase = NSPredicate(format:"SELF MATCHES %@", numberRegEx)
        let containsNumber = testCase.evaluate(with: self)
        return containsNumber
    }
    
    public var isAlphabet: Bool{
        let numberRegEx  = "[a-z A-Z]"
        let testCase = NSPredicate(format:"SELF MATCHES %@", numberRegEx)
        let containsNumber = testCase.evaluate(with: self)
        return containsNumber
    }
    
    public var isFullNamee:Bool {
        let numberRegEx  = "^[a-zA-Z][ ]*$"
        let testCase = NSPredicate(format:"SELF MATCHES %@", numberRegEx)
        let containsNumber = testCase.evaluate(with: self)
        return containsNumber
    }
    
    public var containsNumber:Bool {
        let numberRegEx  = ".*[0-9]+.*"
        let testCase = NSPredicate(format:"SELF MATCHES %@", numberRegEx)
        let containsNumber = testCase.evaluate(with: self)
        return containsNumber
    }
    
    /// Check whether date is in format YYYY-MM-DD
    public var isDateOFFormatYYYYMMDD:Bool {
        let dateRegex = "^(20[0-9]{2}-(0[1-9]|1[0-2])-(0[1-9]|[12][0-9]|3[01]))$"
        let testCase = NSPredicate(format:"SELF MATCHES %@", dateRegex)
        let isValid = testCase.evaluate(with: self)
        return isValid
    }
    
    /// date in format YYYY-MM-DD
    public var createDateTextYYYYMMDD:String {
        var val = self
        let counte = val.count
        if counte == 4 || counte == 7 {
            val += "-"
        }
        return val
    }
    
    /// Check whether date is in format DD-MM-YYYY
    public var isDateOfFormatDDMMYYYY:Bool {
        let dateRegex = "^((0[1-9]|[12][0-9]|3[01])-(0[1-9]|1[0-2])-(19|20)[0-9]{2})$"
        let testCase = NSPredicate(format:"SELF MATCHES %@", dateRegex)
        let isValid = testCase.evaluate(with: self)
        return isValid
    }
    
    /// date in format DD-MM-YYYY
    public var createDateTextDDMMYYYY:String {
        var val = self
        let counte = val.count
        if counte == 2 || counte == 5 {
            val += "-"
        }
        return val
    }
    
    public var boolValue:Bool? {
        if self == "false" || self == "0" { return false }
        else if self == "true"  || self == "1" { return true }
        else { return nil }
    }
    
}

extension NSMutableAttributedString {
    
    public func setAsLink(textToFind:String, linkURL:String) -> Bool {
        
        guard let url = URL(string: linkURL) else {
            return false
        }
        
        let foundRange = self.mutableString.range(of: textToFind)
        if foundRange.location != NSNotFound {
            self.addAttribute(.link, value: url, range: foundRange)
            return true
        }
        return false
    }
    
    public func setAsLink(for data: [(String,String)]) {
        _ = data.map { self.setAsLink(textToFind: $0.0, linkURL: $0.1) }
    }
    
}
