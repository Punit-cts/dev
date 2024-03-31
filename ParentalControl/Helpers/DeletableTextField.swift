//
//  DeletableTextField.swift
//

import UIKit

protocol DeleteDetectTextFieldDelegate: AnyObject {
    func textFieldDidDelete(textField: UITextField)
}

class DeleteDetectTextField: UITextField {
    
    weak var myDelegate: DeleteDetectTextFieldDelegate?
    
    override func deleteBackward() {
        super.deleteBackward()
        myDelegate?.textFieldDidDelete(textField: self)
    }
    
}
