//
//  detailViewController.swift
//  Star Wars Encyclopedia
//
//  Created by Emily on 1/22/18.
//  Copyright © 2018 Emily. All rights reserved.
//

import UIKit

class peopleDetailViewController: UIViewController {
    var labelText1 = ""
    var labelText2 = ""
    var labelText3 = ""
    var labelText4 = ""
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    
    
    @IBAction func backButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label1.text = "Name: " + labelText1
        label2.text = "Gender: " + labelText2
        label3.text = "Birth Year: " + labelText3
        label4.text = "Mass: " + labelText4

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
