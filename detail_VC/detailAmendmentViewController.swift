//
//  detailAmendmentViewController.swift
//  COI
//
//  Created by prashant thakare on 15/01/20.
//  Copyright © 2020 prashant dilip thakare. All rights reserved.
//

import UIKit

class detailAmendmentViewController: UIViewController {

    var amendLbl = ""
    var image = UIImage()
    var desc = ""
    @IBOutlet weak var tex: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        lbl.text = amendLbl
        
        tex.text = desc
        
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var lbl: UILabel!
    @IBOutlet weak var imgv: UIImageView!
    
    /*
     @IBOutlet weak var textV: UITextView!
     // MARK: - Navigation

     @IBOutlet weak var textV: UITextView!
     // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
