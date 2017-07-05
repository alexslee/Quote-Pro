//
//  LoremPixelController.swift
//  Quote Pro
//
//  Created by Alex Lee on 2017-07-05.
//  Copyright © 2017 Alex Lee. All rights reserved.
//

import UIKit
import Nuke
class LoremPixelController: NSObject {
    func generateImage(completionHandler: @escaping (UIImage) -> Void) {
        let url = URL(string: "http://lorempixel.com/300/300")
//        let session = URLSession.shared
        let req = Request(url: url!)//URLRequest(url: url!)
        
        Manager.shared.loadImage(with: req) {
            response in
            completionHandler(response.value!)
        }
        
//        let task = session.dataTask(with: req) { (data: Data?, resp: URLResponse?, err: Error?) in
//            
//            guard let data = data else {
//                
//                print("no data returned from server \(String(describing: err))")
//                return
//            }
//            
//            guard let resp = resp as? HTTPURLResponse else {
//                
//                print("no response returned from server \(String(describing: err))")
//                return
//            }
//            
//            guard let rawJson = try? JSONSerialization.jsonObject(with: data, options: []) as! NSDictionary else {
//                print("data returned is not json, or not valid")
//                return
//            }
//            
//            guard resp.statusCode == 200 else {
//                
//                print("photo post failed")
//                return
//            }
//            
//            completionHandler(err!)
//            
//        }
//        task.resume()
        
    }
}
