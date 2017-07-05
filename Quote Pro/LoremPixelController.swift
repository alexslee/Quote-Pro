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
    //get an image from LoremPixel, using Nuke pod for cleaner syntax
    func generateImage(completionHandler: @escaping (UIImage) -> Void) {
        let url = URL(string: "http://lorempixel.com/300/300")

        var req = Request(url: url!)
        req.memoryCacheOptions.writeAllowed = false
        
        Manager.shared.loadImage(with: req) {
            response in
            //if get was successful, run the completion handler with the fetched image
            completionHandler(response.value!)
        }
        
    }
}
