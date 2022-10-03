//
//  SideMenuViewController.swift
//  Core Score
//
//  Created by Remya on 9/29/22.
//

import UIKit
import MessageUI

class SideMenuViewController:UIViewController{
    @IBOutlet weak var tableView: UITableView!
    var menus = ["Language".localized,"Privacy Policy".localized,"Share App".localized,"Feed Back".localized,"Rate Us".localized]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSettings()
    }
    
    func initialSettings(){
        //setBackButton()
        tableView.register(UINib(nibName: "SideMenuTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
    
    func sendEmail() {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients(["you@yoursite.com"])
            //mail.setMessageBody("<p>You're so awesome!</p>", isHTML: true)

            present(mail, animated: true)
        } else {
            // show failure alert
        }
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
            
        case 3:
            sendEmail()
            
       
            
            
        default:
            break
            
        }
    }
    
    
}


extension SideMenuViewController:MFMailComposeViewControllerDelegate{
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
    
}
