//
//  LanguageViewController.swift
//  Core Score
//
//  Created by Remya on 9/29/22.
//

import UIKit

class LanguageViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var languages = ["English","中文","Bahasa Indonesia","Việt Nam"]
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSettings()

        // Do any additional setup after loading the view.
    }
    
    func initialSettings(){
        setBackButton()
        tableView.register(UINib(nibName: "LanguageTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        tableView.selectRow(at: IndexPath(row: 0, section: 0), animated: false, scrollPosition: .top)
        
    }
   

}

extension LanguageViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        languages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! LanguageTableViewCell
        cell.lblLanguage.text = languages[indexPath.row]
        return cell
    }
    
    
}
