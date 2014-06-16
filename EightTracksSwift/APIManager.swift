//
//  APIManager.swift
//  EightTracksSwift
//
//  Created by Dmitri Voronianski on 16.06.14.
//  Copyright (c) 2014 Dmitri Voronianski. All rights reserved.
//

import UIKit

let _sharedAPIManager = APIManager()

class APIManager: AFHTTPRequestOperationManager {
    
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
    }
    
    init(baseURL url: NSURL!) {
        super.init(baseURL: baseURL)
    }
    
    /**
     * https://8tracks.com/developers/api_v3#user_auth
     */
    func login(username: String, password: String, success: (AFHTTPRequestOperation!, AnyObject!) -> Void, failure: ((AFHTTPRequestOperation!, NSError!) -> Void)?) {
        self.POST(
            API_KEY.stringByAppendingString("/sessions.json"),
            parameters: ["username": username, "password": password],
            success: success,
            failure: failure
        )
    }
    
    func createUser(username: String, password: String, email: String, success: (AFHTTPRequestOperation!, AnyObject!) -> Void, failure: ((AFHTTPRequestOperation!, NSError!) -> Void)?) {
        self.POST(
            API_KEY.stringByAppendingString("/sessions.json"),
            parameters: ["username": username, "password": password, "email": email, "agree_to_terms": true],
            success: success,
            failure: failure
        )
    }
}
