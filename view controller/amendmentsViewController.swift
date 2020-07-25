//
//  amendmentsViewController.swift
//  COI
//
//  Created by prashant thakare on 19/12/19.
//  Copyright © 2019 prashant dilip thakare. All rights reserved.
//

import UIKit

class amendmentsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    //MARK:- var
    var amend = [NSDictionary]()
    
    //MARK:- ibOutlets
    @IBOutlet weak var act: UIActivityIndicatorView!
    @IBOutlet weak var tableV: UITableView!
    
    //MARK:- tableView
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1

    }
    func numberOfSections(in tableView: UITableView) -> Int{

        return self.amend.count
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let amendment = self.amend[indexPath.section]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")as! amendmentsTableViewCell
        cell.lblAmend.text = amendment.value(forKey: "title") as? String
        cell.backgroundColor = UIColor.clear
        cell.contentView.backgroundColor = UIColor.clear
        cell.clipsToBounds = true
        
        return cell

    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.section)
        let amendTitle = self.amend[indexPath.section]
        let amendVc = storyboard?.instantiateViewController(identifier: "detailAmendmentViewController") as! detailAmendmentViewController
        amendVc.amendLbl =  (amendTitle.value(forKey: "title") as? String)!
        amendVc.desc = (amendTitle.value(forKey: "small_description") as? String)!
        self.navigationController?.pushViewController(amendVc, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }


    //MARK:- viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        tableV.backgroundColor = UIColor.clear
        act.startAnimating()
        tableV.isHidden = true
        getApi()
        // Do any additional setup after loading the view.
    }
    
    
    //MARK:- api Calling
    func getApi(){
        let url = URL(string: "http://mapi.trycatchtech.com/v1/constitution_of_india/constitution_of_india_amendments")
        URLSession.shared.dataTask(with: url!) { (data, resp, err) in
            if let dataResp = data{
                do{
                    self.amend = try JSONSerialization.jsonObject(with: dataResp, options: .mutableContainers) as! [NSDictionary]
                    DispatchQueue.main.async {
                        self.tableV.reloadData()
                        self.act.stopAnimating()
                        self.tableV.isHidden = false
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
                self.tableV.isHidden = true
                self.act.stopAnimating()
                
                
            }
        }.resume()
        
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
