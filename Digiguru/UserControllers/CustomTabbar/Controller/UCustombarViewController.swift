//
//  UCustombarViewController.swift
//  Digiguru
//
//  Created by Buzzware Tech on 09/08/2021.
//

import UIKit


class UCustombarViewController: UITabBarController {

    @IBOutlet weak var myTabBar: UITabBar!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
   //     let tabBarController = window?.rootViewController as! UITabBarController
//        let image = UIImage(named: "bottom_bar")
//        let tabBarImage = resize(image: image!, newWidth: self.tabBarController!.view.frame.width)
//        tabBarController.tabBar.backgroundImage = tabBarImage
        // myTabBar.backgroundImage = tabBarImage

        
        
        
        
        myTabBar.layer.masksToBounds = true
        myTabBar.isTranslucent = true
        myTabBar.clipsToBounds = true
        myTabBar.layer.backgroundColor =  UIColor.white.cgColor
        myTabBar.barStyle = .default
        myTabBar.barTintColor =  UIColor.white
        myTabBar.layer.cornerRadius = 30
       myTabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]

        
        
        
        //        myTabBar.layer.borderWidth = 0
//        myTabBar.layer.borderColor = UIColor.init(named: "greenish_white")?.cgColor
//        myTabBar.roundCorners([.topLeft,.topRight], radius: 25)


        
    
        
        
        
        
        
        
        
     //   borderView(view:myTabBar)
        
        
        setTabBarItems()
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        
        self.navigationController?.navigationBar.isHidden = true

    }
    
    func resize(image: UIImage, newWidth: CGFloat) -> UIImage {

        UIGraphicsBeginImageContext(CGSize(width: newWidth, height: image.size.height))
        image.draw(in: CGRect(x: 0, y: 0, width: newWidth, height: image.size.height)) // image.drawInRect( CGRect(x: 0, y: 0, width: newWidth, height: image.size.height))  in swift 2
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return newImage!
    }
    
    
    func borderView(view:UIView){
        let yourColor : UIColor = UIColor.white
        view.layer.borderWidth = 0.2
        view.layer.borderColor = yourColor.cgColor
    }

    
    
    func setTabBarItems(){
       // myTabBar.layer.masksToBounds = false

        let myTabBarItem1 = (self.myTabBar.items?[0])! as UITabBarItem
        myTabBarItem1.image = UIImage(named: "Home")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        myTabBarItem1.selectedImage = UIImage(named: "Home1")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        myTabBarItem1.title = ""

        
        let myTabBarItem2 = (self.myTabBar.items?[1])! as UITabBarItem
        myTabBarItem2.image = UIImage(named: "Search")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        myTabBarItem2.selectedImage = UIImage(named: "Search1")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        myTabBarItem2.title = ""
    

       // myTabBarItem2.imageInsets = UIEdgeInsets(top: 12, left: 0, bottom: 12, right: 0)

        
        let myTabBarItem3 = (self.myTabBar.items?[2])! as UITabBarItem
        myTabBarItem3.image = UIImage(named: "Routines")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        myTabBarItem3.selectedImage = UIImage(named: "Routines1")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        myTabBarItem3.title = ""


        //myTabBarItem3.imageInsets = UIEdgeInsets(top: 12, left: 0, bottom: 12, right: 0)

        let myTabBarItem4 = (self.myTabBar.items?[3])! as UITabBarItem
        myTabBarItem4.image = UIImage(named: "Fav")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        myTabBarItem4.selectedImage = UIImage(named: "Fav1")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        myTabBarItem4.title = ""
        

//myTabBarItem4.imageInsets = UIEdgeInsets(top: 12, left: 0, bottom: 12, right: 0)

        
        let myTabBarItem5 = (self.myTabBar.items?[4])! as UITabBarItem
        myTabBarItem5.image = UIImage(named: "More")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        myTabBarItem5.selectedImage = UIImage(named: "More1")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        myTabBarItem5.title = ""
        
    }

}

//
//  customBarViewController.swift
//  Nadi
//
//  Created by Asad on 15/03/2021.
//  Copyright © 2021 Asadullah. All rights reserved.
//

//import UIKit
//
//class customBarViewController:UITabBarController {
//
//    @IBOutlet weak var myTabBar: UITabBar!
//
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//
////        let tabBarController = window?.rootViewController as! UITabBarController
//         //   let image = UIImage(named: "bottom_bar")
//      //  let tabBarImage = resize(image: image!, newWidth: self.tabBarController!.view.frame.width)
//           // tabBarController.tabBar.backgroundImage = tabBarImage
//       //myTabBar.layer.masksToBounds = true
//     //   myTabBar.isTranslucent = false
//     //   myTabBar.backgroundImage = tabBarImage
//       // myTabBar.clipsToBounds = true
//      //  myTabBar.layer.backgroundColor = UIColor.init(named: "greenish_white")?.cgColor
//      //  myTabBar.barStyle = .default
//     //   myTabBar.barTintColor = UIColor.init(named: "greenish_field")
//      //  myTabBar.layer.cornerRadius = 30
//      // myTabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
//      //  myTabBar.layer.borderWidth = 0
//      //  myTabBar.layer.borderColor = UIColor.init(named: "greenish_white")?.cgColor
//       // myTabBar.roundCorners([.topLeft,.topRight], radius: 25)
//
//
//
//
//
//
//
//
//
//
//
//
//     //   borderView(view:myTabBar)
//
//
//        setTabBarItems()
//
//        // Do any additional setup after loading the view.
//    }
//
//    func resize(image: UIImage, newWidth: CGFloat) -> UIImage {
//
//        UIGraphicsBeginImageContext(CGSize(width: newWidth, height: image.size.height))
//        image.draw(in: CGRect(x: 0, y: 0, width: newWidth, height: image.size.height)) // image.drawInRect( CGRect(x: 0, y: 0, width: newWidth, height: image.size.height))  in swift 2
//        let newImage = UIGraphicsGetImageFromCurrentImageContext()
//        UIGraphicsEndImageContext()
//
//        return newImage!
//    }
//
//
//    func borderView(view:UIView){
//        let yourColor : UIColor = UIColor(named: "greenish_grey")!
//        view.layer.borderWidth = 0.2
//        view.layer.borderColor = yourColor.cgColor
//    }
//
//
//
//    func setTabBarItems(){
//       // myTabBar.layer.masksToBounds = false
//
//        let myTabBarItem1 = (self.tabBar.items?[0])! as UITabBarItem
//        myTabBarItem1.image = UIImage(named: "home_icon1")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
//        myTabBarItem1.selectedImage = UIImage(named: "home21")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
//        myTabBarItem1.title = ""
//
//
//        let myTabBarItem2 = (self.tabBar.items?[1])! as UITabBarItem
//        myTabBarItem2.image = UIImage(named: "categories_icon1")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
//        myTabBarItem2.selectedImage = UIImage(named: "cagtegories21")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
//        myTabBarItem2.title = ""
//
//
//       // myTabBarItem2.imageInsets = UIEdgeInsets(top: 12, left: 0, bottom: 12, right: 0)
//
//
//        let myTabBarItem3 = (self.tabBar.items?[2])! as UITabBarItem
//        myTabBarItem3.image = UIImage(named: "booking_icon1")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
//        myTabBarItem3.selectedImage = UIImage(named: "booking21")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
//        myTabBarItem3.title = ""
//
//
//        //myTabBarItem3.imageInsets = UIEdgeInsets(top: 12, left: 0, bottom: 12, right: 0)
//
//        let myTabBarItem4 = (self.tabBar.items?[3])! as UITabBarItem
//        myTabBarItem4.image = UIImage(named: "setting_icon1")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
//        myTabBarItem4.selectedImage = UIImage(named: "setting2_icon1")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
//        myTabBarItem4.title = ""
//
//
////myTabBarItem4.imageInsets = UIEdgeInsets(top: 12, left: 0, bottom: 12, right: 0)
//
//    }
//
//}
//
//extension UITabBarController {
//    public func hideTopShadow() {
//        // looking for tabBar
//        for subview in self.view.subviews {
//            let tabBarSubviewName = String(describing: type(of: subview))
//            guard tabBarSubviewName == "UITabBar" else { continue }
//
//            // looking for _UIBarBackground. The other subivews are UITabBarButtons
//            for tabBarSubview in subview.subviews {
//                let tabBarSubviewName = String(describing: type(of: tabBarSubview))
//                guard tabBarSubviewName == "_UIBarBackground" else { continue }
//
//                // looking for UIImageView. This is the only subview
//                for shadowView in tabBarSubview.subviews where shadowView is UIImageView {
//                    shadowView.isHidden = true
//                    return
//                }
//            }
//        }
//        print(" **** ERROR: Could not find the shadow view \(self.self) \(#function)")
//    }
//}
//
