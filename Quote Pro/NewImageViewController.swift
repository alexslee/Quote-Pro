//
//  NewImageViewController.swift
//  Quote Pro
//
//  Created by Alex Lee on 2017-07-05.
//  Copyright © 2017 Alex Lee. All rights reserved.
//

import UIKit

class NewImageViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func getQuotePressed(_ sender: Any) {
        
    }
    
    @IBAction func getImagePressed(_ sender: Any) {
    
    }
    
    @IBAction func savePressed(_ sender: Any) {
        
    }
    
    
    @IBAction func cancelPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
