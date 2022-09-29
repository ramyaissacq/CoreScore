//
//  SideMenuViewController.swift
//  Core Score
//
//  Created by Remya on 9/29/22.
//

import UIKit

class SideMenuViewController: BaseViewController {
    @IBOutlet weak var tableView: UITableView!
    var menus = ["Language","Privacy Policy","Term & Condition","Url Alternative","Download App","About Us"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSettings()
    }
    
    func initialSettings(){
        setBackButton()
        tableView.register(UINib(nibName: "SideMenuTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
   

}


extension SideMenuViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menus.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SideMenuTableViewCell
        cell.imgIcon.image = UIImage(named: "g\(indexPath.row+1)")
        cell.lblTitle.text = menus[indexPath.row]
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let pagesVC = UIStoryboard(name: "SideMenu", bundle: nil).instantiateViewController(withIdentifier: "PagesViewController") as! PagesViewController
        switch indexPath.row{
        case 0:
            openVC(storyBoard: "SideMenu", identifier: "LanguageViewController")
        case 1:
            pagesVC.slug = .privacy
            self.navigationController?.pushViewController(pagesVC, animated: true)
        case 2:
            pagesVC.slug = .terms
            self.navigationController?.pushViewController(pagesVC, animated: true)
        case 5:
            pagesVC.slug = .aboutUS
            self.navigationController?.pushViewController(pagesVC, animated: true)
            
        default:
            break
            
        }
    }
    
    
}
