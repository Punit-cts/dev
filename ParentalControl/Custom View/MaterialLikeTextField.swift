//
//  MaterialLikeTextField.swift
//
//  Created by Punit Thakali on 22/12/2023.
//

import UIKit

public class MaterialLikeTextField: UIView, UITextFieldDelegate {
    
    @IBOutlet weak var contentView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        let bundle = Bundle(for: type(of: self))
        let name = String(describing: type(of: self))
        bundle.loadNibNamed(name, owner: self, options: nil)
        self.addSubview(self.contentView)
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.contentView.topAnchor.constraint(equalTo: self.topAnchor),
            self.contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
    }
    
    @IBOutlet public weak var fieldLabel: UILabel!
    @IBOutlet private weak var textFieldContainer: UIView!
    @IBOutlet public weak var textField: UITextField!
    @IBOutlet private weak var trailingView: UIView!
    @IBOutlet private weak var errorContainer: UIView!
    @IBOutlet private weak var errorLabel: UILabel!
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        self.textField.delegate = self
        self.errorContainer.isHidden = true
        self.errorLabel.text = nil
        self.trailingView.isHidden = true
    }
    
    public func setFieldLabel(with value: String, bGcolor: UIColor? = nil) {
        self.fieldLabel.text = " \(value)  "
        self.fieldLabel.backgroundColor =  bGcolor ?? ThemeColor().BodyColor ?? self.backgroundColor
    }
    
    public func setFieldLabel(with value: NSAttributedString, bGcolor: UIColor? = nil) {
        self.fieldLabel.attributedText = value
        self.fieldLabel.backgroundColor =  bGcolor ?? ThemeColor().BodyColor ?? self.backgroundColor
    }
    
    public func setPlaceholderLabel(with value: String?) {
        self.textField.placeholder = value
    }
    
    public var text:String? {
        self.textField.text
    }
    
    public func setErrorText(_ text: String?) {
        if let text = text {
            self.errorContainer.isHidden = false
            self.errorLabel.text = text
        } else {
            self.errorLabel.text = nil
            self.errorContainer.isHidden = false
        }
    }
    
    private func updateFieldState() {
        if textField.isFirstResponder {
            self.setErrorText(nil)
            self.textFieldContainer.set(borderWidth: 1.0, of: UIColor.appBlue1)
        } else {
            self.textFieldContainer.set(borderWidth: 1.0, of: UIColor.inactiveStatus)
        }
    }
    
    public func setTrailingItem(with item: UIView?) {
        if let val = item {
            self.trailingView.subviews.forEach { $0.removeFromSuperview() }
            self.trailingView.isHidden = false
            val.frame = CGRect(x:0, y: 0, width: self.trailingView.frame.width, height: self.trailingView.frame.height)
            self.trailingView.addSubview(val)
            let padding: CGFloat = 5.0
            val.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                // constrain it to all 4 sides of the "holder" view
                val.topAnchor.constraint(equalTo: self.trailingView.topAnchor, constant: padding),
                val.leadingAnchor.constraint(equalTo: self.trailingView.leadingAnchor, constant: padding),
                val.trailingAnchor.constraint(equalTo: self.trailingView.trailingAnchor, constant: -padding),
                val.bottomAnchor.constraint(equalTo: self.trailingView.bottomAnchor, constant: -padding),
            ])
            val.tintColor = ThemeColor().UserTextLabel ?? UIColor.userTextLabel
        } else {
            self.trailingView.isHidden = true
        }
    }
    
    public func validate() -> Bool {
        guard let value = self.text, value != "" else {
            let errorText = "This field is required"
            self.setErrorText(errorText)
            return false
        }
        return true
    }
}

extension MaterialLikeTextField {
    
    func addRequiredAsterisk() {
        
        let asterisk =  UILabel()
        let string = ("*" as NSString).range(of: "*")
        asterisk.frame =  CGRect.init(x: self.frame.size.width-5, y: self.frame.size.height/2, width: 10, height: 10)
        let redAst = NSMutableAttributedString(string: "*", attributes: [.foregroundColor: UIColor.red])
        redAst.addAttribute(NSAttributedString.Key.font,value:UIFont.systemFont(ofSize: 12, weight: .regular), range: string)
        asterisk.attributedText = redAst
        self.addSubview(asterisk)
    }
}
