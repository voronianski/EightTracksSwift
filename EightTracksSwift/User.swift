//
//  User.swift
//  EightTracksSwift
//
//  Created by Dmitri Voronianski on 28.06.14.
//  Copyright (c) 2014 Dmitri Voronianski. All rights reserved.
//

import UIKit

class User: NSObject {
    var user_token:String?
    var email:String?
    
    override init() {
        
    }
    
    func isLogined() -> Bool {
        let storage = NSHTTPCookieStorage.sharedHTTPCookieStorage()
        let apiURL = NSURL(string: API_URL)
        let cookies = NSHTTPCookieStorage.cookiesForURL(storage)(apiURL!)
        
        if (cookies?.count > 0) {
            return true
        }
        
        return false
    }
    
    func logout() {
        let storage = NSHTTPCookieStorage.sharedHTTPCookieStorage()
        let apiURL = NSURL(string: API_URL)
        let cookies = NSHTTPCookieStorage.cookiesForURL(storage)(apiURL!)
        
//        for cookie:AnyObject in cookies {
//            storage.deleteCookie(cookie as NSHTTPCookie)
//        }
    }
}
