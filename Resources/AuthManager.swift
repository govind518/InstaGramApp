
import FirebaseAuth
public class AuthManager
{
    static let shared = AuthManager()
    public func registerNewUser(username:String ,email: String ,password: String, completion: @escaping (Bool) -> Void){
        DatabaseManager.shared.cancreatenewuser(email: email, username: username)
        Auth.auth().createUser(withEmail: email, password: password)
            DatabaseManager.shared.insertnewuser(email: email, username: username)
        print("new user inserted")
        }
    
    public func  loginuser (username:String? ,email: String? ,password: String, completion : @escaping ((Bool)  -> Void)){
        if let email = email{
            Auth.auth().signIn(withEmail: email, password: password){authResult,error in guard authResult != nil else{
                completion(false)
                return}
                completion(true)
        }
    }
        else if let username = username
        {
            
                Auth.auth().signIn(withEmail: username, password: password){authResult,error in guard authResult != nil else{
                    completion(false)
                    return}
                    completion(true)
            
        }
        }
}

    
}
