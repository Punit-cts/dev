//
//  APIModel.swift
//
//  Created by Punit Thakali on 11/12/2023.
//

import Foundation



struct LoginModel: Encodable{
    
    let email: String
    let user_type: String
    let  password: String
    let device_id :String
}

struct LoginVerificationModel: Encodable{
    
    let email: String
    let data: String
    let device_id: String
    
    
}

protocol LoginVerificationViewModelDelegate: AnyObject{
    
    func didLoginSuccessfully()
    func loginFailed()
    
}

class LoginVerificationViewModel{
    
    weak var delegate: LoginViewModelDelegate?
    
    func loginverification( model: LoginVerificationModel){
        
        LoginVerificationNetworkManager.shared.loginverification(model: model) { [weak self] result in
            switch result{
                
            case .success:
                DispatchQueue.main.async{
                    
                    self?.delegate?.didLoginSuccessfully()
                }
                
            case .failure:
                DispatchQueue.main.async{
                    
                    self?.delegate?.loginFailed()
                    
                }
            }
        }
    }
}

protocol LoginViewModelDelegate: AnyObject {
    
    func didLoginSuccessfully()
    func loginFailed()
  
}

class LoginViewModel {
    
    public init(delegate: LoginViewModelDelegate? = nil) {
        self.delegate = delegate
    }
    
    weak var delegate: LoginViewModelDelegate?
        
    func login( model: LoginModel) {
        
        
        LoginNetworkManager.shared.login(model: model) { [weak self] result in
            switch result {
                
            case .success:
                DispatchQueue.main.async{
                    
                    self?.delegate?.didLoginSuccessfully()
                    
                }
                
            case .failure:
                DispatchQueue.main.async {
                    
                    self?.delegate?.loginFailed()
                }
            }
        }
    }
}





