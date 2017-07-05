//
//  ForismaticController.swift
//  Quote Pro
//
//  Created by Alex Lee on 2017-07-05.
//  Copyright © 2017 Alex Lee. All rights reserved.
//

import Foundation

class ForismaticController:NSObject {
    
    //fetches a quote from forismatic's api, and if successful, runs the completion block with the data obtained
    func generateQuote(completionHandler: @escaping (String, String) -> Void) {
        let url = URL(string: "http://api.forismatic.com/api/1.0/?method=getQuote&lang=en&format=json")
        let session = URLSession.shared
        let req = URLRequest(url: url!)
        let task = session.dataTask(with: req) { (data: Data?, resp: URLResponse?, err: Error?) in
            //don't run the completion block if anything the task returned was invalid and/or an error occurred
            guard let data = data else {
                
                print("no data returned from server \(String(describing: err))")
                return
            }
            
            guard let resp = resp as? HTTPURLResponse else {
                
                print("no response returned from server \(String(describing: err))")
                return
            }
            
            guard let rawJson = try? JSONSerialization.jsonObject(with: data, options: []) as! NSDictionary else {
                print("data returned is not json, or not valid")
                return
            }
            
            //200 for successful get, failed otherwise
            guard resp.statusCode == 200 else {
                
                print("quote get failed")
                return
            }
            
            let quote = rawJson["quoteText"] as! String
            let author = rawJson["quoteAuthor"] as! String
            completionHandler(quote,author)
            
        }
        task.resume()
        
    }
}
