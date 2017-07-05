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

        var req = Request(url: url!)
        req.memoryCacheOptions.writeAllowed = false
        Manager.shared.loadImage(with: req) {
            response in
            completionHandler(response.value!)
        }
        
    }
}
