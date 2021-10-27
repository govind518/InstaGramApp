//
//  RegistrationViewController.swift
//  InstagramApp
//
//  Created by Govind on 25/10/21.
//

import UIKit

class RegistrationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(usernameTextfield)
        view.addSubview(email)
        view.addSubview(password)
        view.addSubview(regiter1)
        
   
        view.backgroundColor = .systemBackground
        usernameTextfield.delegate = self
        email.delegate = self
        password.delegate = self
        regiter1.addTarget(self, action: #selector(register), for: .touchUpInside)
       

        view.backgroundColor = .red
    }
    
    private let usernameTextfield : UITextField =
    {
        let field = UITextField()
        field.placeholder = "UserName..."
        field.returnKeyType = .next
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.layer.masksToBounds = true
        field.layer.cornerRadius = 8.0
        field.backgroundColor = .secondarySystemBackground
        return field
    }()

    private let email : UITextField =
    {
        let field = UITextField()
        field.placeholder = "Email..."
        field.returnKeyType = .next
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.layer.masksToBounds = true
        field.layer.cornerRadius = 8.0
        field.backgroundColor = .secondarySystemBackground
        return field
    }()
    private let password : UITextField =
    {
        let field = UITextField()
        field.placeholder = "Password..."
        field.returnKeyType = .next
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.layer.masksToBounds = true
        field.layer.cornerRadius = 8.0
        field.backgroundColor = .secondarySystemBackground
        return field
    }()
    private let regiter1 : UIButton =
    {
        let button = UIButton()
        button.setTitle("Register", for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 8.0
        button.backgroundColor = .systemGreen
        button.setTitleColor(.white, for: .normal)
        
    return button    }()
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
       
      
        usernameTextfield.frame = CGRect(x: 20, y:view.safeAreaInsets.top + 10 , width: view.width - 40, height:50.0)
       
        email.frame = CGRect(x: 20, y: usernameTextfield.bottom + 10, width: view.width - 50, height:50.0)
        password.frame = CGRect(x: 20, y: email.bottom + 10, width: view.width - 40, height:50.0)
        regiter1.frame = CGRect(x: 20, y:password.bottom + 10 , width: view.width - 40, height:50)
       
        
        
    }
    @objc private func register(){
        email.resignFirstResponder()
        usernameTextfield.resignFirstResponder()
        guard let usernameemail = usernameTextfield.text, !usernameemail.isEmpty, let email = email.text, !email.isEmpty,let password = password.text, !password.isEmpty  else{
            return
        }
        print("registered new user")
        AuthManager.shared.registerNewUser(username: usernameemail, email: email, password: password) {register in
            if register{}
            else{}
        }
    }
}
extension RegistrationViewController : UITextFieldDelegate
{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameTextfield{
            email.becomeFirstResponder()
        }
        else if textField == email
        {
            
            password.becomeFirstResponder()
        }
        else{
            register()
        }
        return true
    }
}
