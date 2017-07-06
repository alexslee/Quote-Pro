//
//  NewImageViewController.swift
//  Quote Pro
//
//  Created by Alex Lee on 2017-07-05.
//  Copyright © 2017 Alex Lee. All rights reserved.
//

import UIKit
import RealmSwift
import TBDropdownMenu
class NewImageViewController: UIViewController {
    
    // MARK: properties
    
    @IBOutlet weak var showFormattedQuoteView: UIView!
    
    var quotePreview:FormattedQuoteView!
    
    var quoteGetter: ForismaticController!
    
    var imageGetter: ImageSourceController?
    
    var newQuote: Quote!
    
    var items: [[DropdownItem]]!
    
    @IBOutlet weak var imageSourcePicker: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // initialize properties + the quote preview view
        quoteGetter = ForismaticController()
        imageGetter = nil
        
        quotePreview = Bundle.main.loadNibNamed("FormattedQuoteView", owner: nil, options: nil)?.first as? FormattedQuoteView
        quotePreview?.frame.size = showFormattedQuoteView.frame.size
        showFormattedQuoteView.addSubview(quotePreview)
        newQuote = Quote()
        reloadQuotePreview()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func reloadQuotePreview() {
        //reload the preview asynchronously on the main thread
        DispatchQueue.main.async {
            self.quotePreview.formatQuote(quote: self.newQuote)
        }
    }
    
    // MARK: actions
    
    @IBAction func pickImageSource(_ sender: Any) {
        
        let item1 = DropdownItem(title: "LoremPixel")
        let item2 = DropdownItem(title: "Unsplash")
        let data = [item1, item2]
        items = [data]
        let menuView = DropUpMenu(items: data, selectedRow: 0, bottomOffsetY: self.tabBarController?.tabBar.frame.height ?? 0)
        menuView.delegate = self
        menuView.showMenu()
        
    }
    
    @IBAction func getQuotePressed(_ sender: Any) {
        //get a quote from Forismatic, and set the labels in the quote preview if successful
        quoteGetter.generateQuote(completionHandler: {
            (quote:String, author:String) in
            self.newQuote.quoteText = quote
            self.newQuote.quoteAuthor = author
            self.reloadQuotePreview()
        })
    }
    
    @IBAction func getImagePressed(_ sender: Any) {
        if imageGetter == nil {
            imageGetter = ImageSourceController(service:"")
        }
        //get an image, and set the image in the quote preview if successful
        imageGetter?.generateImage(completionHandler: {
            (image:UIImage) in
            self.newQuote.image = UIImageJPEGRepresentation(image, 1.0)
            self.reloadQuotePreview()
        })
    }
    
    @IBAction func savePressed(_ sender: Any) {
        //save the quote to realm, will be loaded in the main table view controller
        let realm = try! Realm()
        try! realm.write {
            realm.add(self.newQuote)
        }
        self.navigationController?.popToRootViewController(animated: true)
    }
    
}

// MARK: DropUpMenuDelegate

extension NewImageViewController: DropUpMenuDelegate {
    func dropUpMenu(_ dropUpMenu: DropUpMenu, didSelectRowAt indexPath: IndexPath) {
        imageGetter = ImageSourceController(service: items[indexPath.section][indexPath.row].title)
    }
    
    func dropUpMenuCancel(_ dropUpMenu: DropUpMenu) {
        //print("select cancel")
    }
}
