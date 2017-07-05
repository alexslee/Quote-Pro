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
}

