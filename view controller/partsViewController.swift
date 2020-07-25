//
//  partsViewController.swift
//  COI
//
//  Created by prashant dilip thakare on 16/12/19.
//  Copyright © 2019 prashant dilip thakare. All rights reserved.
//

import UIKit

class partsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UICollectionViewDelegate{
    // MARK:- Variables
    var smallDesc = NSDictionary()
    var tableLbl = [NSDictionary]()
    var str = "0"
    var strId = "1"
    var from = Int()
    var index = IndexPath()
    var partsText = [NSDictionary]()
    
    
    // MARK:- ibOutlets
    @IBOutlet weak var tableV: UITableView!
       
    @IBOutlet weak var collectionV: UICollectionView!
       
     
    override func viewWillAppear(_ animated: Bool) {

        
    }
    
    // MARK:- collectionView
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return partsText.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! partsCollectionViewCell
        index = indexPath
        cell.backgroundColor = UIColor.lightGray
        smallDesc = self.partsText[indexPath.section]
        let partTxt = self.partsText[indexPath.section]
        cell.partLbl.text = partTxt.value(forKey: "title") as? String
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            print(indexPath.section)
    
            //
          // tableV.reloadData()
        
        if indexPath.row < 4 {
            print("")
            apiFortable(idStr: "\(indexPath.section + 1)")
            
            
        }
        else{
           
            
        }
    }
    
    // MARK:- tableview
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(indexPath.row)
        //strId = "\(indexPath.row + 1)"
        
        
        
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableV.frame.width, height: 50))
        let lbl = UILabel(frame: CGRect(x: 5, y: 5, width: headerView.frame.width-10, height: headerView.frame.height-10))
       // let small = smallDesc[index.section]
        lbl.text = smallDesc.value(forKey: "small_description") as? String
        headerView.addSubview(lbl)
        
        return headerView
    }
    

    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
            return tableLbl.count
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! partsTableViewCell
        
            cell.backgroundColor = UIColor.clear
                       
            cell.backgroundColor = UIColor.clear
             
            let article = self.tableLbl[indexPath.row]
        
            cell.lblOut.text = article.value(forKey: "title") as? String
            
            return cell
        }
    
    
    //MARK:- viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        tableV.backgroundColor = UIColor.clear
        getApi()
        
        //tablView.isHidden = true

        // Do any additional setup after loading the view.
    }

    //MARK:- api calling
    func getApi(){
        
           let url = URL(string: "http://mapi.trycatchtech.com/v1/constitution_of_india/constitution_of_india_parts")
           
           URLSession.shared.dataTask(with: url!) { (data, resp, err) in
               if let dataResp = data{
                   do {
                       self.partsText = try JSONSerialization.jsonObject(with: dataResp, options: .mutableContainers) as! [NSDictionary]
                    print("api call")
                       DispatchQueue.main.async {
                    self.collectionV.reloadData()
                        self.apiFortable(idStr: "1")
                       }
                   } catch  {
                       print("error here")
                   }
               }
            else{
                let alertAct = UIAlertController(title: "ERROR", message: "Internet Connection Required", preferredStyle: .alert)
                        let alert = UIAlertAction(title:
                            "RETRY", style: .default, handler: nil)
                        alertAct.addAction(alert)
                        self.present(alertAct,animated: true,completion: nil)
                self.tableV.isHidden = true
                
                
            }
        }.resume()
           
           
       }
    
    func apiFortable(idStr:String){
        
        let url = URL(string: "http://mapi.trycatchtech.com/v1/constitution_of_india/constitution_of_india_articles?part_id=\(idStr)")!
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            if let dataResp = data{
                do {
                    self.tableLbl = try JSONSerialization.jsonObject(with: dataResp, options: .mutableContainers) as! [NSDictionary]
                    DispatchQueue.main.async {
                        self.tableV.reloadData()
//                        self.collectionV.reloadData()
                    }
                    
                } catch  {
                    
                }
                
            }
        }.resume()
        
    }
    
    //tableView part
//    let newArr = ["","","","","","","",""]
    
   
}
