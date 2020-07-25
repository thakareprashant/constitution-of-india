//
//  newsArticleViewController.swift
//  COI
//
//  Created by prashant thakare on 20/12/19.
//  Copyright © 2019 prashant dilip thakare. All rights reserved.
//

import UIKit
import Alamofire

class newsArticleViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    //MARK:- Var
    var newsArticle = [NSDictionary]()
    
    
    //MARK:- ibOutlets
    @IBOutlet weak var act: UIActivityIndicatorView!
    @IBOutlet weak var tableV: UITableView!
    
    //MARK:- tableview
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return newsArticle.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! newsArticleTableViewCell
        cell.backgroundColor = UIColor.clear
        let newsLbl = self.newsArticle[indexPath.section]
        let date = self.newsArticle[indexPath.section]
        cell.newsAlbl.text = newsLbl.value(forKey: "title") as? String
        cell.contentView.backgroundColor = UIColor.clear
        tableV.backgroundColor = UIColor.clear
        cell.layer.cornerRadius = 50
        cell.dateLabel.text = date.value(forKey: "date") as? String
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailNewsVc = storyboard?.instantiateViewController(identifier: "detailNewsArticleViewController") as! detailNewsArticleViewController
        let newsLbl = self.newsArticle[indexPath.section]
        let date = self.newsArticle[indexPath.section]
        detailNewsVc.tit = (newsLbl.value(forKey: "title") as? String)!
        detailNewsVc.date = (newsLbl.value(forKey: "date") as? String)!
        detailNewsVc.detail = (newsLbl.value(forKey: "small_description") as? String)!
        self.navigationController?.pushViewController(detailNewsVc, animated: true)
        
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
        
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }

    //MARK:- viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        getApi()
        act.startAnimating()
        tableV.isHidden = true
        
        // Do any additional setup after loading the view.
    }
    
//    func af(){
//        AF.request("http://mapi.trycatchtech.com/v1/constitution_of_india/constitution_of_india_news_article").responseJSON { (response) in
//             if let json = response.value  as? [NSDictionary]{
//               // print(json["title"])
//            }
//        }
    //}
    //MARK:- api calling
    func getApi(){
        let url = URL(string: "http://mapi.trycatchtech.com/v1/constitution_of_india/constitution_of_india_news_article")
        URLSession.shared.dataTask(with: url!) { (data, resp, err) in
            if let dataResp = data{
                do{
                    self.newsArticle = try JSONSerialization.jsonObject(with: dataResp, options: .mutableContainers) as! [NSDictionary]
                    print("api done")
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
                self.act.hidesWhenStopped = true
                
                
            }
        }.resume()
        
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
     @IBOutlet weak var dateLbl: UILabel!
     */

}
