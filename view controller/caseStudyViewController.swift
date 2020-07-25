//
//  caseStudyViewController.swift
//  COI
//
//  Created by prashant thakare on 21/12/19.
//  Copyright © 2019 prashant dilip thakare. All rights reserved.
//

import UIKit

class caseStudyViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    //MARK:- var
    var caseStudylbl = [NSDictionary]()
    
    
    //MARK:- ibOutlet
    @IBOutlet weak var caseStudyTable: UITableView!
    
    
    //MARK:- tableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return caseStudylbl.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailCaseVc = storyboard?.instantiateViewController(identifier: "detailCaseViewController") as! detailCaseViewController
        let caselbl = self.caseStudylbl[indexPath.section]
        detailCaseVc.detail = (caselbl.value(forKey: "small_description") as? String)!
        detailCaseVc.titl = (caselbl.value(forKey: "title") as? String)!
        self.navigationController?.pushViewController(detailCaseVc, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! caseStudyTableViewCell
        cell.contentView.backgroundColor = UIColor.clear
        cell.backgroundColor = UIColor.clear
        let caselbl = self.caseStudylbl[indexPath.section]
        cell.caseStudyLbl.text = caselbl.value(forKey: "title") as? String
       //cell.layer.borderWidth = 15
     //   cell.contentView.layer.cornerRadius = 30
        cell.layer.cornerRadius = 40
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    //MARK:- api calling
    func getApi(){
        let url = URL(string: "http://mapi.trycatchtech.com/v1/constitution_of_india/constitution_of_india_case_study")
        URLSession.shared.dataTask(with: url!) { (data, resp, err) in
            if let dataResp = data{
                do{
                    self.caseStudylbl = try JSONSerialization.jsonObject(with: dataResp, options: .mutableContainers) as! [NSDictionary]
                    print("api done")
                    DispatchQueue.main.async {
                        self.caseStudyTable.reloadData()
                    }
                    
                    
                }
                catch{
                    print("errr\(error.localizedDescription)")
                    
                }
            }
            else{
                let alertAct = UIAlertController(title: "ERROR", message: "Internet Connection Required", preferredStyle: .alert)
                        let alert = UIAlertAction(title:
                            "RETRY", style: .default, handler: nil)
                        alertAct.addAction(alert)
                        self.present(alertAct,animated: true,completion: nil)
                self.caseStudyTable.isHidden = true
                
                
            }
        }.resume()
        
    }
    
    
    

    
    
    
    
    
    
    
    //MARK:-viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
   getApi()
        caseStudyTable.backgroundColor = UIColor.clear
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
