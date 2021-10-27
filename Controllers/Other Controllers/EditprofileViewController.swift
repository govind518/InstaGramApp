//
//  EditprofileViewController.swift
//  InstagramApp
//
//  Created by Govind on 27/10/21.
//

import UIKit

class EditprofileViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview
            .dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
    }
    
    private let tableview: UITableView =
        {
            let tableview = UITableView()
            tableview.register (UITableViewCell.self, forCellReuseIdentifier: "cell" )
            return tableview
        }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableview)
        tableview.delegate = self
        tableview.dataSource = self
        tableview.tableHeaderView = createheaderview()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(savebutton))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(cancelbutton))
    }
    public func createheaderview() -> UIView
    {
        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.width, height: view.height/3.0))
        return header
    }
    
@objc public func savebutton()
{
    
}
    @objc public func cancelbutton(){}

}
