//
//  PasswordTrailingButton.swift
//
//

import UIKit

class PasswordTrailingButton: UIButton {
 
    private var isPasswordVisible: Bool = false
    
    var isSecureEntry: ((Bool) -> ())?
    
    private lazy var passwordVisibilityButton: UIButton = {
        var trailingButton = UIButton()
        trailingButton.tintColor = ThemeColor().NavBar
        trailingButton.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
        trailingButton.addTapGesture(tapNumber: 1, target: self, action: #selector(passwordButtonTapAction))
        trailingButton.setImage(passwordVisibilityOnImage, for:  .normal)
        return trailingButton
    }()
    
    @objc func passwordButtonTapAction(_ sender: UIGestureRecognizer) {
        isPasswordVisible = !isPasswordVisible
        let image = isPasswordVisible ? passwordVisibilityOffImage : passwordVisibilityOnImage
        self.isSecureEntry?(!isPasswordVisible)
        self.passwordVisibilityButton.setImage(image, for:  .normal)
    }
    
    @objc func passwordButtonClicked(_ sender: UIButton) {
        isPasswordVisible = !isPasswordVisible
        let image = isPasswordVisible ? passwordVisibilityOffImage : passwordVisibilityOnImage
        self.isSecureEntry?(!isPasswordVisible)
        sender.setImage(image, for:  .normal)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor.clear
        self.commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    private func commonInit() {
        self.addSubview(passwordVisibilityButton)
        self.passwordVisibilityButton.center = self.center
        self.passwordVisibilityButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.passwordVisibilityButton.topAnchor.constraint(equalTo: self.topAnchor),
            self.passwordVisibilityButton.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.passwordVisibilityButton.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.passwordVisibilityButton.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
        self.passwordVisibilityButton.bringSubviewToFront(self)
    }
    
    public func toogleStateForTrailingButton() {
        self.passwordButtonClicked(self.passwordVisibilityButton)
    }
    
}
