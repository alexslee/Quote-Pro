//
//  Quote.swift
//  Quote Pro
//
//  Created by Alex Lee on 2017-07-05.
//  Copyright © 2017 Alex Lee. All rights reserved.
//

import UIKit
import RealmSwift

class Quote: Object {
    //dynamic vars and subclass of Object for Realm compatibility
    dynamic var quoteText: String?
    dynamic var quoteAuthor: String?
    dynamic var image: Data?
    
}
