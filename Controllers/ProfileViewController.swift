//
//  ProfileViewController.swift
//  InstagramApp
//
//  Created by Govind on 24/10/21.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gear"), style: .done, target: self, action: #selector (didtapsettingsbutton))
    }
    
    @objc private func didtapsettingsbutton(){
        let vc = SettingsViewController()
        vc.modalPresentationStyle = .fullScreen
        vc.title = "Settings"
        let navvc = UINavigationController(rootViewController: vc)
        self.present(navvc, animated: true)
    }
    
}
