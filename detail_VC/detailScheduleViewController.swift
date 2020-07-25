//
//  detailScheduleViewController.swift
//  COI
//
//  Created by prashant thakare on 18/12/19.
//  Copyright © 2019 prashant dilip thakare. All rights reserved.
//

import UIKit
import AVFoundation

class detailScheduleViewController: UIViewController {
    var a = ""
    let synthesizer = AVSpeechSynthesizer()
    
    @IBOutlet weak var textV: UITextView!
    
    @IBOutlet weak var schLbl: UILabel!
    var b = UIImage()
    var c = ""

    @IBOutlet weak var imgV: UIImageView!
    @IBOutlet weak var navig: UINavigationItem!
    
    @IBAction func playBtn(_ sender: Any) {
        
        var utterance = AVSpeechUtterance(string: textV.text)
            utterance.voice = AVSpeechSynthesisVoice()
            utterance.rate = 0.4
            
        
            synthesizer.speak(utterance)
        if  synthesizer.isPaused{
            synthesizer.continueSpeaking()
            
        }
    
    }
    @IBAction func pauseBtn(_ sender: Any) {
        synthesizer.pauseSpeaking(at: AVSpeechBoundary.word)
        
    }
    @IBAction func stopBtn(_ sender: Any) {
        synthesizer.stopSpeaking(at: AVSpeechBoundary.word)
        
        
        

    }
    
    
    @IBAction func shareBtn(_ sender: Any) {
        let activityVC = UIActivityViewController(activityItems: [""], applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = self.view
        self.present(activityVC,animated: true,completion: nil)
    }
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        //self.navigationItem.hidesBackButton = true
        
        
        
        let image = UIImageView(frame: CGRect(x: 0, y: 10, width: self.view.frame.width, height: 60))
        image.image = UIImage(named: "red-fort.jpg")
        self.view.addSubview(image)
        textV.layer.cornerRadius = 20
        //schLbl.layer.borderWidth = 3
        schLbl.layer.cornerRadius = 15
        schLbl.layer.masksToBounds = true
        schLbl.layer.backgroundColor = UIColor.red.cgColor
        
        imgV.image = b
        textV.text = a
        schLbl.text = c
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var uiview: UIView!
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
