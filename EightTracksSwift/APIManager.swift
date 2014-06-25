//
//  APIManager.swift
//  EightTracksSwift
//
//  Created by Dmitri Voronianski on 16.06.14.
//  Copyright (c) 2014 Dmitri Voronianski. All rights reserved.
//

import UIKit

let _sharedAPIManager = APIManager()

class APIManager: AFHTTPSessionManager {
    
    /**
     * Singleton service 
     * (https://github.com/hpique/SwiftSingleton)
     */
    class var sharedInstance : APIManager {
        return _sharedAPIManager
    }
    
    init() {
        super.init()
        
        self.responseSerializer = AFJSONResponseSerializer()
        self.requestSerializer = AFJSONRequestSerializer()
        
        self.requestSerializer.setValue(API_KEY, forHTTPHeaderField: "X-Api-Key")
        self.requestSerializer.setValue("3", forHTTPHeaderField: "X-Api-Version")
    }
    
    init(baseURL url: NSURL!) {
        super.init(baseURL: url)
    }
    
    init(baseURL url: NSURL!, sessionConfiguration configuration: NSURLSessionConfiguration!) {
        super.init(baseURL: url, sessionConfiguration: configuration)
    }
    
    /**
     * https://8tracks.com/developers/api_v3#user_auth
     */
    func login(username: String, password: String, success: (NSURLSessionDataTask!, AnyObject!) -> Void, failure: ((NSURLSessionDataTask!, NSError!) -> Void)?) {
        println(username, password)
        //let credentials = NSDictionary(objects: [username, password], forKeys: ["username", "password"]) as NSDictionary
        var credentials = ["username": username, "password": password] as Dictionary
        
        self.POST(
            API_URL.stringByAppendingString("/sessions.json"),
            parameters: credentials,
            success: success,
            failure: failure
        )
    }
    
    func loginPlain(username: String, password: String) {
        
    }
    
    func createUser(username: String, password: String, email: String, success: (NSURLSessionDataTask!, AnyObject!) -> Void, failure: ((NSURLSessionDataTask!, NSError!) -> Void)?) {
        self.POST(
            API_URL.stringByAppendingString("/users.json"),
            parameters: ["username": username, "password": password, "email": email, "agree_to_terms": true],
            success: success,
            failure: failure
        )
    }
}
