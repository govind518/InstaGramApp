//
//  StorageManager.swift
//  InstagramApp
//
//  Created by Govind on 25/10/21.
//

import FirebaseStorage


public class StorageManager
{
    static let shared = StorageManager()
    private let Bucket = Storage.storage().reference()
   public enum errormanager : Error
    {
       case failedtodownlad
    }
    public func uploadphoto(model : userpost  , compeletion: @escaping (Result<URL ,errormanager >) -> Void ){}
    
    
    public func downloadimage (with reference : String, compeletion: @escaping (Result<URL ,errormanager >) -> Void  ){
        
        Bucket.child(reference).downloadURL(completion:  {url, error in
            guard let url = url , error == nil else {
                compeletion(.failure(.failedtodownlad))
                return
                
            }
            compeletion(.success(url))
        })
        
    }
}
public enum userposttype
{
    case photo , video
}
public struct userpost{
    let posttype : userposttype
}
