

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
        self.navigationItem.title = "CORE SCORE".localized
    }
    
   
    
   static func openSideMenu(vc:UIViewController){
        let sideMenuVc = UIStoryboard(name: "SideMenu", bundle: nil).instantiateViewController(withIdentifier: "SideMenuViewController")
        let menu = SideMenuNavigationController(rootViewController: sideMenuVc)
       menu.leftSide = true
       menu.menuWidth = UIScreen.main.bounds.width - 50
       menu.navigationBar.isHidden = true
        menu.statusBarEndAlpha = 0
        vc.present(menu, animated: true)
    }
        

    
}
