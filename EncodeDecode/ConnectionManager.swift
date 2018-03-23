//
//  ConnectionManager.swift
//  EncodeDecode
//
//  Created by Appinventiv mac on 22/03/18.
//  Copyright © 2018 Appinventiv mac. All rights reserved.
//

import Foundation

class ConnectionManager {
    
    static let shared = ConnectionManager()
    private init() {}
    
    func callAPI(url:String, completion:@escaping (_ result:Data?, _ error:Error?)->()) {
        
        guard let url = URL.init(string: url) else {
            completion(nil,nil)
            return
        }
        
        let request = URLRequest(url:url)
        let task = URLSession.shared.dataTask(with: request) {
            (data, response, err) in
            if err == nil,let usableData = data {
               completion (usableData,err)
            } else {
                completion(nil,nil)
            }
        }
        task.resume()
    }
}
