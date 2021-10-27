//
//  LoginViewController.swift
//  InstagramApp
//
//  Created by Govind on 25/10/21.

import UIKit
import SafariServices

class LoginViewController: UIViewController {
    
   
    
    private let usernameTextfield : UITextField =
    {
        let field = UITextField()
        field.placeholder = "UserName or Email.."
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
    private let passwordfield : UITextField =
    {
        let field = UITextField()
        
        field.placeholder = "Password..."
        field.returnKeyType = .continue
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.layer.masksToBounds = true
        field.layer.cornerRadius = 8.0
        field.backgroundColor = .secondarySystemBackground
        
        field.isSecureTextEntry = false
        return field
    }()
    private let loginbutton : UIButton =
    {
        let button = UIButton()
        button.setTitle("Log in", for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 8.0
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        
    return button    }()
    private let termsbutton : UIButton =
    {
        let button = UIButton()
        button.setTitle("Terms of Services", for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 8.0
       
        button.setTitleColor(.secondaryLabel, for: .normal)
        
    return button
    }()
    private let createaccount : UIButton =
        
    {
        let button = UIButton()
        button.setTitle("New User/Create a Account", for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 0.0
       
        button.setTitleColor(.secondaryLabel, for: .normal)
        
    return button
   
    }()
    private let privacybutton : UIButton =
    {
        
        let button = UIButton()
        button.setTitle("Privacy Policy", for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 8.0
       
        button.setTitleColor(.secondaryLabel, for: .normal)
        
    return button
    }()
    private let headerview : UIView =
    {
        let header = UIView()
        header.clipsToBounds = true
        let backgroundview = UIImageView(image: UIImage(named: "instagram"))
        header.addSubview(backgroundview)
    return header
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
addsubviews()
        view.backgroundColor = .systemBackground
        usernameTextfield.delegate = self
        passwordfield.delegate = self
        loginbutton.addTarget(self, action: #selector(didtaploginbutton), for: .touchUpInside)
        createaccount.addTarget(self, action: #selector(didtapcreateaccountbutton), for: .touchUpInside)
        termsbutton.addTarget(self, action: #selector(didtaptermsbutton), for: .touchUpInside)
        privacybutton.addTarget(self, action: #selector(didtapprivacybutton), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        headerview.frame = CGRect(x: 0, y: 0.0, width: view.width, height: view.height/3.0)
        configureheaderview()
        usernameTextfield.frame = CGRect(x: 25, y: headerview.bottom + 10, width: view.width - 50, height:52.0)
        passwordfield.frame = CGRect(x: 25, y: usernameTextfield.bottom + 10, width: view.width - 50, height:52.0)
        loginbutton.frame = CGRect(x: 25, y: passwordfield.bottom + 10, width: view.width - 50, height:52.0)
        createaccount.frame = CGRect(x: 25, y: loginbutton.bottom + 10, width: view.width - 50, height:52.0)
        termsbutton.frame = CGRect(x: 10, y: view.height - view.safeAreaInsets.bottom - 100, width: view.width - 20, height:50)
        privacybutton.frame = CGRect(x: 10, y: view.height - view.safeAreaInsets.bottom - 50, width: view.width - 20, height:50)
        
        
    }
    private func configureheaderview()
    {
        guard headerview.subviews.count == 1 else {
            return
        }
        guard var backgroundviews = headerview.subviews.first  else {
            return
        }
        backgroundviews.frame = headerview.bounds
        let textview = UIImageView(image: UIImage(named: "instatext"))
        headerview.addSubview(textview)
        textview.contentMode = .scaleAspectFit
        textview.frame = CGRect(x: 8.0, y: (view.safeAreaInsets.top) + 100, width: headerview.width, height: (headerview.height/2.0 - view.safeAreaInsets.top))
    }
private func addsubviews()
{
    view.addSubview(usernameTextfield)
    view.addSubview(passwordfield)
    view.addSubview(loginbutton)
    view.addSubview(termsbutton)
    view.addSubview(privacybutton)
    view.addSubview(headerview)
    view.addSubview(createaccount)
}
    @objc private func didtaploginbutton(){
        passwordfield.resignFirstResponder()
        usernameTextfield.resignFirstResponder()
        guard let usernameemail = usernameTextfield.text, !usernameemail.isEmpty, let password = passwordfield.text, !password.isEmpty  else{
            return
        }
        var username : String?
        var email : String?
        
        if usernameemail.contains("@"), usernameemail.contains("."){
            email = usernameemail
        }
        else{
            username = usernameemail
        }
        AuthManager.shared.loginuser(username: username, email: email, password: password){  success in
            DispatchQueue.main.async {
                if success {
                    let vc = HomeViewController()
                    vc.title = "Home"
                    let navvc = UINavigationController(rootViewController: vc)
                    self.present(navvc, animated: true)
                }
    
            else
            {
                let alert = UIAlertController(title: "Log in error", message: "We are unable to log you in", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
                self.present(alert, animated: true)
            }
            }
        }
    }
    
    @objc private func didtaptermsbutton(){
        guard let url = URL(string : "https://help.instagram.com/581066165581870") else{return}
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true, completion: nil)
    }
    @objc private func didtapprivacybutton(){
        guard let url = URL(string : "https://help.instagram.com/196883487377501") else{return}
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
    }
    @objc private func didtapcreateaccountbutton(){
        let vc = RegistrationViewController()
        present(vc, animated: true)
    }
    
}
extension LoginViewController : UITextFieldDelegate
{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameTextfield{
            passwordfield.becomeFirstResponder()
        }
        else if textField == passwordfield
        {
           didtaploginbutton()
        }
        return true
    }
}
