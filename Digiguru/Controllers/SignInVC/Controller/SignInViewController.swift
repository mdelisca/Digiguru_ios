//
//  SignInViewController.swift
//  Digiguru
//
//  Created by Macbook Air on 8/4/21.
//

import UIKit

class SignInViewController: UIViewController {

    
    @IBOutlet weak var emailTF: UITextField!
    
    @IBOutlet weak var passwordTF: UITextField!
    
    var userType:UserType!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.navigationController?.navigationBar.isHidden = true
    }
    override func viewDidAppear(_ animated: Bool) {
        self.alert()
    }
    func alert(){
        let alertController = UIAlertController(title: "Select User", message: "", preferredStyle: .actionSheet)
        let user = UIAlertAction(title: "User", style: .default) { action in
            self.userType = .user
        }
        let vendor = UIAlertAction(title: "Guru", style: .default) { action in
            self.userType = .vendor
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { action in
           
        }
        alertController.addAction(user)
        alertController.addAction(vendor)
        alertController.addAction(cancel)
        self.present(alertController, animated: true, completion: nil)
    }
    @IBAction func SignInBtn(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        if self.userType != nil{
            if self.userType == .user{
                CommonHelper.saveCachedUserData(UserModel(userType: .user))
                let vcc = storyboard.instantiateViewController(withIdentifier: "UCustombarViewController") as! UCustombarViewController
                self.navigationController?.pushViewController(vcc, animated: true)
            }
            else if self.userType == .vendor{
                CommonHelper.saveCachedUserData(UserModel(userType: .vendor))
                let vcc = storyboard.instantiateViewController(withIdentifier: "VCustombarViewController") as! VCustombarViewController
                self.navigationController?.pushViewController(vcc, animated: true)
            }
        }
        else{
            let alertController = UIAlertController(title: "Oops!", message: "Please select user first", preferredStyle: .alert)
            let ok = UIAlertAction(title: "Ok", style: .default) { action in
                self.alert()
            }
            alertController.addAction(ok)
            
            self.present(alertController, animated: true, completion: nil)
        }
//        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//
//        if self.emailTF.text?.lowercased() == "u"{
//            CommonHelper.saveCachedUserData(UserModel(userType: .user))
//             let vcc = storyboard.instantiateViewController(withIdentifier: "UCustombarViewController") as! UCustombarViewController
//            self.navigationController?.pushViewController(vcc, animated: true)
//        }
//        else if self.emailTF.text?.lowercased() == "v"{
//            CommonHelper.saveCachedUserData(UserModel(userType: .vendor))
//            let vcc = storyboard.instantiateViewController(withIdentifier: "VCustombarViewController") as! VCustombarViewController
//            self.navigationController?.pushViewController(vcc, animated: true)
//        }
//        else{
//            PopupHelper.showAlertControllerWithError(forErrorMessage: "Please enter u for user v for vender", forViewController: self)
//        }
        

    }
    
    @IBAction func forgetPasswrodBTn(_ sender: Any) {
        
    }
    
    @IBAction func SignUpBtn(_ sender: Any) {
        
        CommonHelper.sharedInstance.changeNAV_VC(identifier: "SignUPViewController", vc: self)

    }

}
