//
//  preambleViewController.swift
//  COI
//
//  Created by prashant dilip thakare on 15/12/19.
//  Copyright © 2019 prashant dilip thakare. All rights reserved.
//

import UIKit
import SystemConfiguration
import Reachability
import AVFoundation




protocol delegate {
    func shareAct()
}


class preambleViewController: UIViewController {
    
    //MARK:- Var
    var arrData = [NSDictionary]()
    var titleArr = [NSDictionary]()
    var a:[NSDictionary] = []
    let synthesizer = AVSpeechSynthesizer()
    var delegate:delegate?
    let shareD = shareAct
    
   
    
   //MARK:- IbOutlets
    @IBOutlet weak var viewww: UIView!
    
    
    @IBOutlet weak var textV: UITextView!
    
    @IBOutlet weak var titleLbl: UILabel!
    
    @IBOutlet weak var pauseBtn: UIButton!
    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var stopBtn: UIButton!
    @IBOutlet weak var act: UIActivityIndicatorView!
    //MARK:- viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        act.startAnimating()
        textV.isHidden = true
        titleLbl.isHidden = true
        
        getdata()
//
        
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
    
    
    //MARK:- IbAction
   
    @IBAction func playBtn(_ sender: Any) {
        
        var utterance = AVSpeechUtterance(string: textV.text)
            utterance.voice = AVSpeechSynthesisVoice()
            utterance.rate = 0.4
            
        
            synthesizer.speak(utterance)
        if synthesizer.isPaused{
            synthesizer.continueSpeaking()
        }
        
    }
    @IBAction func pauseBtn(_ sender: Any) {
        
         synthesizer.pauseSpeaking(at: AVSpeechBoundary.word)
        
        
        
    }
    @IBAction func stopBtn(_ sender: Any) {
        
        synthesizer.stopSpeaking(at: AVSpeechBoundary.word)
    }
    
    @IBAction func shareAct(_ sender: Any) {
    
        let activityVC = UIActivityViewController(activityItems: [""], applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = self.view
        self.present(activityVC,animated: true,completion: nil)
        
    }
    func share(){
        
        
        let activityVC = UIActivityViewController(activityItems: [""], applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = self.view
        self.present(activityVC,animated: true,completion: nil)
    }
    //MARK:- api Calling
    func getdata(){
        let url =  URL(string: "http://mapi.trycatchtech.com/v1/constitution_of_india/constitution_of_india_preamble")
        URLSession.shared.dataTask(with: url!) { (data, resp, error) in
            if let dataResp = data{
                do{
                    self.arrData = try JSONSerialization.jsonObject(with: dataResp, options: .mutableContainers) as! [NSDictionary]
                    let dict = self.arrData[0]
                    
                        DispatchQueue.main.async {
                            self.titleLbl.text = dict.value(forKey: "title") as? String
                            self.textV.text = dict.value(forKey: "description") as? String
                            self.act.stopAnimating()
                            self.textV.isHidden = false
                            self.titleLbl.isHidden = false
                        }
                    
                    
                    
                }
                catch{
                    
                    
                }
            }
            else{
                let alertAct = UIAlertController(title: "ERROR", message: "Internet Connection Required", preferredStyle: .alert)
                        let alert = UIAlertAction(title:
                            "RETRY", style: .default, handler: nil)
                        alertAct.addAction(alert)
                        self.present(alertAct,animated: true,completion: nil)
                self.textV.isHidden = true
                self.act.stopAnimating()
                
                
                
            }
            
            
        }.resume()
    }
}
