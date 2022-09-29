

import UIKit
import SideMenu

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        setTitleMargin()
       setNavBarColor()
        setTitle()
    }
    
    func setTitleMargin()
    {
        let style = NSMutableParagraphStyle()
        style.firstLineHeadIndent = 5
        navigationController?.navigationBar.standardAppearance.largeTitleTextAttributes = [NSAttributedString.Key.paragraphStyle : style]
    }
    
    func setNavBarColor()
    {
        self.navigationItem.backButtonTitle = ""
        self.navigationController?.removeBottomLine()
        let yourBackImage = UIImage(named: "back")
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.setBackIndicatorImage(yourBackImage, transitionMaskImage: yourBackImage)
        navBarAppearance.shadowImage = UIImage()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.backgroundColor = Colors.accentColor()
        navBarAppearance.shadowImage = UIImage()
        navBarAppearance.shadowColor = .clear
        self.navigationController?.navigationBar.tintColor = .black
        self.navigationController?.navigationBar.standardAppearance = navBarAppearance
        self.navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.layoutIfNeeded()
    }
    
    func setTitle(){
        self.navigationItem.title = "CORE SCORE"
    }
    
    func openVC(storyBoard:String,identifier:String){
        let vc = UIStoryboard(name: storyBoard, bundle: nil).instantiateViewController(withIdentifier: identifier)
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func setBackButton(){
        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        btn.setImage(UIImage(named: "back"), for: .normal)
        btn.addTarget(self, action: #selector(actionBack), for: .touchUpInside)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: btn)
        
    }
    
    func getButton(image:UIImage)->UIButton{
        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        btn.setImage(image, for: .normal)
        return btn
    }
    
    @objc func actionBack(){
        self.navigationController?.popViewController(animated: true)
    }
    
   static func openSideMenu(vc:UIViewController){
        let sideMenuVc = UIStoryboard(name: "SideMenu", bundle: nil).instantiateViewController(withIdentifier: "SideMenuViewController")
        let menu = SideMenuNavigationController(rootViewController: sideMenuVc)
       menu.leftSide = true
        //SideMenuManager.default.rightMenuNavigationController = menu
        menu.statusBarEndAlpha = 0
        vc.present(menu, animated: true)
    }
        

    
}
