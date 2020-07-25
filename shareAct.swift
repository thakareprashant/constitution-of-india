//
//  shareAct.swift
//  COI
//
//  Created by prashant thakare on 09/03/20.
//  Copyright © 2020 prashant dilip thakare. All rights reserved.
//

import Foundation
import UIKit
var shareAct = share()
class share:UIViewController{
     func shareAct(){
        let activityVC = UIActivityViewController(activityItems: [""], applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = self.view
        self.present(activityVC,animated: true,completion: nil)
        
    }
    
    
}
