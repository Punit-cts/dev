//
//  ViewController.swift
//
//  Created by Punit Thakali on 11/12/2023.
//

import UIKit



class LoginViewController: UIViewController, LoginViewModelDelegate, LoginVerificationViewModelDelegate{
    
    var loginviewModel: LoginViewModel!
    var loginverificationmodel: LoginVerificationViewModel!
    
    @IBOutlet weak var emailTextField: MaterialLikeTextField!
    @IBOutlet weak var passwordTextField: MaterialLikeTextField!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let deviceidgenerated = generateDeviceID()                   //generates deviceID
        print(deviceidgenerated)
        
        self.makeSpinner()
        
        self.loginviewModel = LoginViewModel()
        self.loginviewModel.delegate = self
        
        self.loginverificationmodel = LoginVerificationViewModel()
        self.loginverificationmodel.delegate = self
        
        setupViews()
        
    }
    
    private func setupViews() {
        
        self.emailTextField.backgroundColor = ThemeColor().BodyColor ?? UIColor.appF3F7FA
        self.emailTextField.setFieldLabel(with: "Email")
        self.emailTextField.setPlaceholderLabel(with: "Email")
        self.emailTextField.textField.keyboardType = .emailAddress
        self.emailTextField.textField.clearButtonMode = .whileEditing
        self.emailTextField.textField.delegate = self
        
        
        self.emailTextField.backgroundColor = ThemeColor().BodyColor ?? UIColor.appF3F7FA
        self.passwordTextField.setFieldLabel(with: "Password")
        self.passwordTextField.setPlaceholderLabel(with: "Password")
        self.passwordTextField.textField.keyboardType = .emailAddress
        self.emailTextField.textField.clearButtonMode = .whileEditing
        self.passwordTextField.textField.delegate = self
        self.passwordTextField.textField.isSecureTextEntry = true
        
        let passwordTrailingView = PasswordTrailingButton(frame: CGRect(x: 0, y: 0, width: 24.0, height: 24.0))
        passwordTrailingView.isSecureEntry = { (value) in
            self.passwordTextField.textField.isSecureTextEntry = value
        }
        self.passwordTextField.setTrailingItem(with: passwordTrailingView)
    }
    
    
    @IBAction func loginButton(_ sender: Any) {
    
        if validate(){
            
            self.present(loadingAlert, animated: true)
            
            let loginmodel  = LoginModel(email: self.emailTextField.text!, user_type: "A", password: self.passwordTextField.text!, device_id: self.generateDeviceID())
            self.loginviewModel.login(model: loginmodel)
            
            let verificationmodel = LoginVerificationModel(email: self.emailTextField.text!, data: "email", device_id: self.generateDeviceID())
            self.loginverificationmodel.loginverification(model: verificationmodel)
            
            let vc = UserSelectionViewController()
            navigationController?.pushViewController(vc, animated: true)
        }
        
        else{
            
            loginFailed()
            
        }
    }
    
    private func validate() -> Bool {
        guard var email = emailTextField.text, email != Strings.empty else {
            self.emailTextField.setErrorText(Strings.Authentication.required_field_error)
            return false
        }
        email = email.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if !email.isEmail {
            self.emailTextField.setErrorText(Strings.Authentication.invalid_email)
            return false
        }
        
        guard var password = passwordTextField.text, password != Strings.empty else {
            self.passwordTextField.setErrorText(Strings.Authentication.required_field_error)
            return false
        }
        password = password.trimmingCharacters(in: .whitespacesAndNewlines)
        
        return true
        
    }
    
    let loadingAlert = UIAlertController(title: nil, message: "\n\nLogging In", preferredStyle: .alert)
    
    private func makeSpinner() {
        
        let spinner = UIActivityIndicatorView(style: .medium)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.startAnimating()
        
        loadingAlert.view.addSubview(spinner)
        
        NSLayoutConstraint.activate([
            
            spinner.centerXAnchor.constraint(equalTo: loadingAlert.view.centerXAnchor),
            spinner.topAnchor.constraint(equalTo: loadingAlert.view.topAnchor, constant: 30),
        ])
        
    }
    
    func didLoginSuccessfully() {
        
        DispatchQueue.main.async { [weak self] in
            
            self?.loadingAlert.dismiss(animated: true)
                
            let vc = UserSelectionViewController()
            self?.navigationController?.pushViewController(vc, animated: true)
            
        }
    }
    
    func loginFailed() {
        
        DispatchQueue.main.async { [weak self] in
            
            self?.loadingAlert.dismiss(animated: true)
        }
        
        let failureAlert = UIAlertController(title: "Login Failed", message: nil, preferredStyle: .alert)
        failureAlert.addAction(UIAlertAction(title: "Back", style: .default, handler: nil))
        present(failureAlert, animated: true, completion: nil)
    }
    
    func generateDeviceID() -> String {                                             //generates the deviceID
        
        if let vendorID = UIDevice.current.identifierForVendor?.uuidString {
            
            return vendorID
        }
        else {
            
            return UUID().uuidString
        }
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        if textField == emailTextField.textField {
            self.emailTextField.setErrorText(nil)
            self.passwordTextField.setErrorText(nil)
        }
        if textField == passwordTextField.textField {
            self.emailTextField.setErrorText(nil)
            self.passwordTextField.setErrorText(nil)
        }
        
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailTextField.textField {
            self.emailTextField.textField.resignFirstResponder()
            self.passwordTextField.textField.becomeFirstResponder()
        }
        else if textField == passwordTextField.textField {
            self.passwordTextField.textField.resignFirstResponder()
        }
        return false
    }
    
}



