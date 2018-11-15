//
//  ViewController.swift
//  TestExternalLink
//
//  Created by Lizzy on 2018-11-15.
//  Copyright © 2018 Lizzy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var button: UIButton!
    @IBAction func buttonPressed(_ sender: UIButton) {
        guard let url = URL(string: "https://www.hoodbasics.ca/index.en.html") else { return }
        UIApplication.shared.open(url)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

