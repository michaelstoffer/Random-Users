//
//  UserController.swift
//  Random Users
//
//  Created by Michael Stoffer on 11/13/19.
//  Copyright © 2019 Michael Stoffer. All rights reserved.
//

import UIKit

let baseURL = URL(string: "https://randomuser.me/api/")!

@objc (MJSUserController)
class UserController: NSObject {
    typealias CompletionHandler = ([MJSUser]?, Error?) -> Void
    
    @objc(sharedController) static let shared = UserController()
        
    @objc func fetchUsers(completion: @escaping CompletionHandler = { _,_  in }) {
        var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        let jsonQueryItem = URLQueryItem(name: "format", value: "json")
        let incQueryItem = URLQueryItem(name: "inc", value: "name,email,phone,picture")
        let resultsQueryItem = URLQueryItem(name: "results", value: "1000")
        
        urlComponents?.queryItems = [jsonQueryItem, incQueryItem, resultsQueryItem]
        
        guard let requestURL = urlComponents?.url else { NSLog("requestURL is nil"); completion(nil, NSError(domain: "UserControllerErrorDomain", code: 0, userInfo: nil)); return }
        var request = URLRequest(url: requestURL)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { (data, _, error) in
            if let error = error {
                NSLog("Error fetching data: \(error)")
                DispatchQueue.main.async {
                    completion(nil, error)
                }
                return
            }
            
            guard let data = data else {
                NSLog("No data returned from data task");
                DispatchQueue.main.async {
                    completion(nil, NSError(domain: "UserControllerErrorDomain", code: 1, userInfo: nil))
                }
                return
            }
            
            do {
                guard let dictionary = try JSONSerialization.jsonObject(with: data, options: []) as? [String : Any] else {
                    let error = NSError(domain: "UserControllerErrorDomain", code: 2, userInfo: nil);
                    
                    throw error
                }
                
                guard let userDictionaries = dictionary["results"] as? [[String : Any]] else {
                    let error = NSError(domain: "UserControllerErrorDomain", code: 3, userInfo: nil);
                    
                    throw error
                }
                
                let users = userDictionaries.compactMap { MJSUser(dictionary: $0) }
                
                DispatchQueue.main.async {
                    completion(users, nil)
                }
            } catch {
                DispatchQueue.main.async {
                    completion(nil, error)
                }
            }
        }.resume()
    }
}
