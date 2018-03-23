//
//  APICaller.swift
//  EncodeDecode
//
//  Created by Appinventiv mac on 22/03/18.
//  Copyright © 2018 Appinventiv mac. All rights reserved.
//

import Foundation

class APICaller {
   
    static let shared = APICaller()
    private init() {}
    
    func fetchData(params:[String:Any]?=nil, completion:@escaping(_ success:Bool, _ message:String, _ news:MyNews?)->()) {
      //  let url = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=6b8d0cecf5d34d4f8857948bb65bf9dd"
        let url = "https://newsapi.org/v2/top-headlines?sources=google-news&apiKey=6b8d0cecf5d34d4f8857948bb65bf9dd"
        ConnectionManager.shared.callAPI(url: url) { (data, error) in
            
            if let error = error {
                completion(false, error.localizedDescription, nil)
                return
            }
            guard let data = data else {
                completion(false,"no data from url", nil)
                return
            }
            do {
                let decoder = JSONDecoder()
                decoder    .dateDecodingStrategy = .iso8601
                let newsArticle =  try decoder.decode(MyNews.self, from: data)
                completion(true, "parsed successful",newsArticle)
            }
            catch let jsonErr {
                completion(false,jsonErr.localizedDescription, nil)
            }
        }
    }
    
}

