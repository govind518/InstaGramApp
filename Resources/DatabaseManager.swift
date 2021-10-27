//
//  DatabaseManager.swift
//  InstagramApp
//
//  Created by Govind on 25/10/21.
//

import FirebaseDatabase

public class DatabaseManager
{
    static let shared = DatabaseManager()
    private let database = Database.database().reference()
    public func cancreatenewuser(email : String, username : String ){
        
    }
    
    public func insertnewuser(email : String, username : String ){
      
        
     var  key1 = email.replacingOccurrences(of: ".", with: "-")
      var  key2 = username.replacingOccurrences(of: ".", with: "-")
        print(key1)
        print(key2)
        
        database.child(key1).setValue(key2)
    }
}
