//
//  DatabaseManger.swift
//  Driver
//
//  Created by Basma Alqethami on 28/11/1443 AH.
//

import Foundation
import FirebaseDatabase
final class DatabaseManger {
    static let shared = DatabaseManger()
    
    private let database = Database.database().reference()
}

extension DatabaseManger {
    
    public func userExists(with phoneNumber: String, completion: @escaping ((Bool) -> Void)) {
        
        database.child(phoneNumber).observeSingleEvent(of: .value) { snapshot in
            // snapshot has a value property that can be optional if it doesn't exist
            guard snapshot.value as? [String: Any] != nil else {
                // otherwise... let's create the account
                completion(false)
                return
            }
            completion(true) // the caller knows the email exists already
        }
    }
    
    /// Insert new user to database
    public func insertUser(with user: User, completion: @escaping (Bool) -> Void){
        
        database.child(user.Phone).setValue(["name":user.Name,"phone":user.Phone,"password":user.Password, "promo_code": user.PromoCode]) { error, _ in
            guard error  == nil else {
                print("failed to write to database")
                completion(false)
                return
            }
            
            self.database.child("users").observeSingleEvent(of: .value) { snapshot in
                // snapshot is not the value itself
                if var usersCollection = snapshot.value as? [[String: String]] {
                    
                    let newElement = [
                        "name": user.Name,
                        "phone": user.Phone,
                        "promo_code": user.PromoCode
                    ]
                    usersCollection.append(newElement)
                    
                    self.database.child("users").setValue(usersCollection) { error, _ in
                        guard error == nil else {
                            completion(false)
                            return
                        }
                        completion(true)
                    }
                    
                }else{
                    // create that array
                    let newCollection: [[String: String]] = [
                        [
                            "name": user.Name,
                            "phone": user.Phone,
                            "promo_code": user.PromoCode
                        ]
                    ]
                    self.database.child("users").setValue(newCollection) { error, _ in
                        guard error == nil else {
                            completion(false)
                            return
                        }
                        completion(true)
                    }
                }
            }
        }
    }
    
    public enum DatabaseError: Error {
        case faildToFetch
    }
    
}

extension DatabaseManger {
    
    // Retrieve user details from database
    public func getUserInfo ( with UID: String, completion: @escaping (Result<User, Error>) ->  Void) {
        
        database.child(UID).observeSingleEvent(of: .value, with:  { snapshot in
            
            if (snapshot.value is NSNull ) {
                completion(.failure(DatabaseError.faildToFetch))
                print(" Data not found")
            }
            
            else {
                // if data found
                guard let userData = snapshot.value as? [String: Any],
                      let name = userData["name"] as? String,
                      let phone = userData["phone"] as? String,
                      let password = userData["password"] as? String,
                      let promoCode = userData["promo_code"] as? String else {
                    return
                }
                let userInfo = User(Name: name, Phone: phone, Password: password, PromoCode: promoCode)
                completion(.success(userInfo))
            }
        })
    }
    
    
    public func ubdatePassword( with phone: String, password: String) {
        
        database.child(phone).updateChildValues(
            [
                "password": password,
            ])
    }
}
