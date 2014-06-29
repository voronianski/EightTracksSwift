//
//  User.swift
//  EightTracksSwift
//
//  Created by Dmitri Voronianski on 28.06.14.
//  Copyright (c) 2014 Dmitri Voronianski. All rights reserved.
//

import UIKit

class User: NSObject {
    let user_token:String?
    
    init() {
        
    }
    
    func isLogined() -> Bool {
        let storage = NSHTTPCookieStorage.sharedHTTPCookieStorage()
        let cookies = NSHTTPCookieStorage.cookiesForURL(storage)(NSURL.URLWithString(API_URL))
        
        if (cookies.count > 0) {
            return true
        }
        
        return false
    }
    
    func logout() {
        let storage = NSHTTPCookieStorage.sharedHTTPCookieStorage()
        let cookies = NSHTTPCookieStorage.cookiesForURL(storage)(NSURL.URLWithString(API_URL))
        
        for cookie:AnyObject in cookies {
            storage.deleteCookie(cookie as NSHTTPCookie)
        }
    }
}
