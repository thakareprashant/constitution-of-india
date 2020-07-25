//
//  scheduleViewController.swift
//  COI
//
//  Created by prashant thakare on 17/12/19.
//  Copyright © 2019 prashant  thakare. All rights reserved.
//

import UIKit

class scheduleViewController: UIViewController,UITableViewDataSource,UITableViewDelegate
{
    //MARK:- var
    var title1 = NSDictionary()
    var schedule = [NSDictionary]()
    
    @IBAction func playBtn(_ sender: Any) {
    }
    //MARK:- ibOutlets
    
    @IBOutlet weak var act: UIActivityIndicatorView!
    @IBOutlet weak var tableV: UITableView!
    
    
    //MARK:- tableView
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return schedule.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! scheduleTableViewCell
       // cell.imageView?.image = imgArr[indexPath.row]
        let new = schedule[indexPath.section]
        //cell.imgv.image = imgArr[indexPath.section][indexPath.row]
        cell.lblO.text = new.value(forKey: "title") as? String
        //cell.chakraImg.image = chakraImg[indexPath.section][indexPath.row]
        cell.backgroundColor = UIColor.clear
        cell.imageView?.backgroundColor = UIColor.clear
        cell.contentView.backgroundColor = UIColor.clear
        tableV.backgroundColor = UIColor.clear
        cell.layer.cornerRadius = 40
        tableV.backgroundView?.backgroundColor = UIColor.clear
        cell.textLabel?.backgroundColor = UIColor.clear
        
//        cell.layer.borderWidth = 15
        
        

        return cell
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = storyboard?.instantiateViewController(identifier: "detailScheduleViewController") as! detailScheduleViewController
        let detail = self.schedule[indexPath.section]
        let sch = self.schedule[indexPath.section]
        vc.a = (detail.value(forKey: "small_description") as? String)!
        vc.c = (sch.value(forKey: "title") as? String)!
        vc.b = UIImage(named: "red-fort.jpg")!
        
        
        //present(vc, animated: true, completion: nil)
        self.navigationController?.pushViewController(vc, animated: true)
//
////        vc.a = UIImage(named: "chakra@2x.png")!
        //tableView.deselectRow(at: indexPath, animated: true)
        //performSegue(withIdentifier: "detailSchedule", sender: self)
        
    }
//        return self.tableV.backgroundView?.backgroundColor = UIView.
//    }
//
    

                 //MARK:- viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        act.startAnimating()
        getApi()
        tableV.isHidden = true
        
        // Do any additional setup after loading the view.
    }
    
                //MARK:- api Calling
    
    func getApi(){
        
        let url = URL(string: "http://mapi.trycatchtech.com/v1/constitution_of_india/constitution_of_india_schedule")
        URLSession.shared.dataTask(with: url!) { (data, resp, err) in
            if let dataResp = data{
                do{
                    self.schedule = try JSONSerialization.jsonObject(with: dataResp, options: .mutableContainers) as! [NSDictionary]
                    
                    print(self.schedule.count)
                    
                    //let schedule = self.schedule.value(forKey: "title") as! NSDictionary
                    //print(schedule.allKeys)
                    
                    DispatchQueue.main.async {
                        self.tableV.reloadData()
                        self.act.stopAnimating()
                        self.tableV.isHidden = false
                    }
                    
                    
                }
                catch{
                    print("nooooo")
                    
                }
            }
            else{
                let alertAct = UIAlertController(title: "ERROR", message: "Internet Connection Required", preferredStyle: .alert)
                        let alert = UIAlertAction(title:
                            "RETRY", style: .default, handler: nil)
                        alertAct.addAction(alert)
                        self.present(alertAct,animated: true,completion: nil)
                self.tableV.isHidden = true
                self.act.stopAnimating()
                
                
            }
        }.resume()
        
    }




}
