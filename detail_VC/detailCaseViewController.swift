//
//  detailCaseViewController.swift
//  COI
//
//  Created by prashant thakare on 01/02/20.
//  Copyright © 2020 prashant dilip thakare. All rights reserved.
//

import UIKit

class detailCaseViewController: UIViewController {
    @IBOutlet weak var detailText: UITextView!
    
    @IBOutlet weak var titleLbl: UILabel!
    
    var detail = ""
     var titl = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        detailText.text = detail
        titleLbl.text = titl
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
