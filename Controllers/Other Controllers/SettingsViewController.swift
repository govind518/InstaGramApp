//
//  SettingsViewController.swift
//  InstagramApp
//
//  Created by Govind on 26/10/21.
//

import UIKit

class SettingsViewController: UIViewController {
    
    public func  logout ( completion :  ((Bool)  -> Void)) {
        completion(true)
     
        let currentvc = SettingsViewController()
        currentvc.dismiss(animated: false, completion: nil)
        print("function code is executing ")
    }
    public func  dismissviewcontroller ( completion :  ((Bool)  -> Void)) {
        completion(true)
        let currentvc = SettingsViewController()
        currentvc.dismiss(animated: false, completion: nil)
    }
    
    private var tableView : UITableView = {
        let tableView = UITableView(frame:.zero, style: .grouped)

        tableView.register(UITableViewCell.self , forCellReuseIdentifier:  "cell")
       return tableView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
      
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
}
extension SettingsViewController : UITableViewDelegate, UITableViewDataSource
{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 7
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section        {
        case 0:
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell" , for: indexPath)
        cell.textLabel?.text = "Log Out"
        return cell
        
        case 1:
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell" , for: indexPath)
        cell.textLabel?.text = "Edit Profile"
        return cell
        case 2:
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell" , for: indexPath)
        cell.textLabel?.text = "Terms of service"
        return cell
        case 3:
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell" , for: indexPath)
        cell.textLabel?.text = "Privacy Policies"
        return cell
        case 4:
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell" , for: indexPath)
        cell.textLabel?.text = "Help and Feedback"
        return cell
        case 5:
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell" , for: indexPath)
        cell.textLabel?.text = "Invite Friends"
        return cell
        case 6:
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell" , for: indexPath)
        cell.textLabel?.text = "Save Original Posts"
        return cell
            
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell" , for: indexPath)
            return cell
        }}
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section
        {
        case 0:
        DispatchQueue.main.async{
            self.logout(completion: { printing in
            
            if printing {
           
            print("compeletion code is exucuting ")
                
               
                let LoginVC = LoginViewController()
                LoginVC.modalPresentationStyle = .fullScreen
                self.present(LoginVC, animated: false)
                
            }
            else{
                print("logout not happening")
            }
        
        })
        }
        case 1: print("later")
        case 2: print("later")
        case 3: print("later")
        case 4: print("later")
        case 5: print("later")
        case 6: print("later")
            
        default : print("later")
            
        }
        
    }
    
}
