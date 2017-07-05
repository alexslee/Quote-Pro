//
//  ViewController.swift
//  Quote Pro
//
//  Created by Alex Lee on 2017-07-04.
//  Copyright © 2017 Alex Lee. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UITableViewController {

    // MARK: properties
    
    var objects:Results<Quote>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        objects = try! Realm().objects(Quote.self)
        tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        objects = try! Realm().objects(Quote.self)
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: UITableViewController
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (objects?.count)!
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! QuoteProTableViewCell
        let cellQuote = objects![indexPath.row]
        
        cell.quoteImage.image = UIImage(data: cellQuote.image!)
        cell.quoteImage.contentMode = .scaleAspectFill
        cell.quoteImage.layer.masksToBounds = true
        cell.quoteLabel.text = cellQuote.quoteText!
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedQuote = objects![indexPath.row]
        let formattedView = Bundle.main.loadNibNamed("FormattedQuoteView", owner: nil, options: nil)?.first as? FormattedQuoteView
        
        let frame = CGRect(x: self.view.center.x, y: self.view.center.x, width: 300, height: 300)
        formattedView?.frame = frame
        formattedView?.formatQuote(quote: selectedQuote)
        let screenshot = snapshot(view: (formattedView!))
        
        let activityViewController = UIActivityViewController(activityItems: [screenshot], applicationActivities: nil)
        self.present(activityViewController, animated: true, completion: nil)
    }
    
    func snapshot(view: UIView) -> UIImage {
        //adapted from https://developer.apple.com/library/content/qa/qa1817/_index.html
        
        UIGraphicsBeginImageContext(view.bounds.size)
        view.drawHierarchy(in: view.bounds, afterScreenUpdates: true)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image!
    }
}

