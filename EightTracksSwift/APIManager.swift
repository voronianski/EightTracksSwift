//
//  APIManager.swift
//  EightTracksSwift
//
//  Created by Dmitri Voronianski on 16.06.14.
//  Copyright (c) 2014 Dmitri Voronianski. All rights reserved.
//

import UIKit

let _sharedAPIManager = APIManager(baseURL: NSURL(string: API_URL)!)

class APIManager: AFHTTPSessionManager {
    
    /**
     * Singleton service 
     * (https://github.com/hpique/SwiftSingleton)
     */
    class var sharedInstance : APIManager {
        return _sharedAPIManager
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init(baseURL url: NSURL!) {
        super.init(baseURL: url, sessionConfiguration: nil)
        
        self.responseSerializer = AFJSONResponseSerializer() as AFJSONResponseSerializer
        self.requestSerializer = AFJSONRequestSerializer() as AFJSONRequestSerializer
        
        self.requestSerializer.setValue(API_KEY, forHTTPHeaderField: "X-Api-Key")
        self.requestSerializer.setValue("3", forHTTPHeaderField: "X-Api-Version")
    }
    
    /**
     * https://8tracks.com/developers/api_v3#user_auth
     */
    func login(username: String, password: String, success: (NSURLSessionDataTask!, AnyObject!) -> Void, failure: ((NSURLSessionDataTask!, NSError!) -> Void)?) {
        let credentials = ["login": username, "password": password]
        
        self.POST(
            "/sessions.json",
            parameters: credentials,
            success: success,
            failure: failure
        )
    }
    
    func createUser(username: String, password: String, email: String, success: (NSURLSessionDataTask!, AnyObject!) -> Void, failure: ((NSURLSessionDataTask!, NSError!) -> Void)?) {
        self.POST(
            "/users.json",
            parameters: ["username": username, "password": password, "email": email, "agree_to_terms": true],
            success: success,
            failure: failure
        )
    }
}
