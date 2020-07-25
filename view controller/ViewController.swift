//
//  ViewController.swift
//  COI
//
//  Created by prashant dilip thakare on 14/12/19.
//  Copyright © 2019 prashant dilip thakare. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var selectedItem : [String:Bool] = [:]
    var coiHome = [["Preamble"],["Parts"],["Schedules"],["Amendments"],["Newsarticle"],["Case Study"]]
    
    var arrdata = ["Home","notification","Notes","Bookmarks","Nightmode","Rate Us","about","Privacy policy"]
    
    
    var imgdata:[UIImage] = [#imageLiteral(resourceName: "home_icon"),#imageLiteral(resourceName: "notification bell_icon"),#imageLiteral(resourceName: "notes_icon"),#imageLiteral(resourceName: "bookmark _icon"),#imageLiteral(resourceName: "nightmode_icon"),#imageLiteral(resourceName: "star"),#imageLiteral(resourceName: "about_icon"),#imageLiteral(resourceName: "writing")]
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if tableView == homeTable{
            return coiHome.count
        }
        if tableView == slideTable{
        return 1
        }
        return 0
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == homeTable{
            
            return 1
            
        }
        if tableView == slideTable{
        return arrdata.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == homeTable{
            let cell = homeTable.dequeueReusableCell(withIdentifier: "home") as! homeTableViewCell
            cell.lblRef.text = coiHome[indexPath.section][indexPath.row]
            cell.backgroundColor = UIColor.clear
            cell.contentView.backgroundColor = UIColor.clear
            
            return cell
            
            
            
        }
        
        
        
        
        
        if tableView == slideTable{
            let cell = slideTable.dequeueReusableCell(withIdentifier: "cell") as! slideTableViewCell
            cell.imgOut.image = imgdata[indexPath.row]
            cell.lblOut.text = arrdata[indexPath.row]
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        print("selected\(arrdata[indexPath.row])")
       // var cell = tableV.cellForRow(at: indexPath)as! slideTableViewCell
        
        
        if tableView == homeTable{
            let home = coiHome[indexPath.section]
            switch home  {
            case coiHome[0]:
                let vc = storyboard?.instantiateViewController(identifier: "preambleViewController") as! preambleViewController
                    self.navigationController?.pushViewController(vc, animated: true)
                
            case  coiHome[1]:
            let vc = storyboard?.instantiateViewController(identifier: "partsViewController") as! partsViewController
            self.navigationController?.pushViewController(vc, animated: true)
            
            case coiHome[2]:
            let vc = storyboard?.instantiateViewController(identifier: "scheduleViewController") as! scheduleViewController
            self.navigationController?.pushViewController(vc, animated: true)
            
            case coiHome[3]:
                let vc = storyboard?.instantiateViewController(identifier: "amendmentsViewController") as! amendmentsViewController
                self.navigationController?.pushViewController(vc, animated: true)
                
            case coiHome[4]:
            let vc = storyboard?.instantiateViewController(identifier: "newsArticleViewController") as! newsArticleViewController
            self.navigationController?.pushViewController(vc, animated: true)
                
            case coiHome[5]:
            let vc = storyboard?.instantiateViewController(identifier: "caseStudyViewController") as! caseStudyViewController
            self.navigationController?.pushViewController(vc, animated: true)
                
                
                
            default:
                return
            }
//            
            
            
            }
        if tableView == slideTable{
            let newarr = arrdata[indexPath.row]
            if newarr == arrdata[0]{
                 slideTable.isHidden = true
                tableviewOutlet.isHidden = true
             
             }
            else if newarr == arrdata[1]{
             let vc = storyboard?.instantiateViewController(identifier: "notificationViewController") as! notificationViewController
             self.navigationController?.pushViewController(vc, animated: true)
             
        }
            else if newarr == arrdata[2]{
                let vc = storyboard?.instantiateViewController(identifier: "notesViewController") as! notesViewController
                self.navigationController?.pushViewController(vc, animated: true)
            }
       
        
        }
    }
    
    

    @IBAction func menuBar(_ sender: UIBarButtonItem) {
//        tableviewOutlet.isHidden = true
//        tableV.isHidden = true
        self.view.bringSubviewToFront(tableviewOutlet)
        if tableviewOutlet.isHidden == true{
        if sender.tag == 1 {
            tableviewOutlet.isHidden = false
            slideTable.isHidden = false
            
        }
//        
        }
        else if tableviewOutlet.isHidden == false {
            if sender.tag == 1{
                tableviewOutlet.isHidden = true
                slideTable.isHidden = true
            }
            
        }
    
    }
    
    @IBOutlet weak var preambleRef: UIButton!
    @IBAction func preambleBtn(_ sender: UIButton) {
        //,var preambleVc = storyboard?.instantiateViewController(identifier: "preambleViewController") as! preambleViewController
        
        //self.present(preambleVc, animated: true, completion: nil)
        
    }
    @IBAction func backBtnAction(_ sender: UIButton) {
        tableviewOutlet.isHidden = true
        
    }
    @IBOutlet weak var homeTable: UITableView!
    @IBOutlet weak var backMenuref: UIButton!
    @IBOutlet weak var coiBtn: UIImageView!
    @IBOutlet weak var tableView: UIView!
    
    @IBOutlet weak var menu: UIBarButtonItem!
    @IBOutlet weak var slideTable: UITableView!
    @IBOutlet weak var tableviewOutlet: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableviewOutlet.isHidden = true
        slideTable.dataSource = self
        slideTable.delegate = self
        homeTable.delegate = self
        homeTable.dataSource = self
        homeTable.isHidden = false
        homeTable.backgroundColor = UIColor.clear
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tap))
//        self.view.addGestureRecognizer(tapGesture)
//        
        
        
        
        
        
    }
    
    @objc func tap(){
        if slideTable.isHidden == false{
        tableviewOutlet.isHidden = true
        slideTable.isHidden = true
        }
    }
    
}

