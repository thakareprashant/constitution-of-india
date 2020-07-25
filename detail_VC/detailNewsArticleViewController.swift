//
//  detailNewsArticleViewController.swift
//  COI
//
//  Created by prashant thakare on 25/01/20.
//  Copyright © 2020 prashant dilip thakare. All rights reserved.
//

import UIKit

class detailNewsArticleViewController: UIViewController {
     
    var tit = ""
    var date = ""
    var detail = ""
    @IBOutlet weak var textV: UITextView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLbl.text = tit
        dateLbl.text = date
        textV.text = detail
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
