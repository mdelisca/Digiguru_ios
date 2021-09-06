//
//  UEditProfileViewController.swift
//  Digiguru
//
//  Created by Buzzware Tech on 09/08/2021.
//

import UIKit

class UEditProfileViewController: UIViewController {

    @IBOutlet weak var nametf: UITextField!
    @IBOutlet weak var nameView: UIView!
    
    @IBOutlet weak var emailtf: UITextField!
    @IBOutlet weak var emailView: UIView!
    
    
    
    @IBOutlet weak var phoneView: UIView!
    @IBOutlet weak var phoneNumbertf: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.nametf.delegate = self
        self.emailtf.delegate = self
        self.phoneNumbertf.delegate = self
        
        self.nameView.isHidden = true
        self.emailView.isHidden = true
        self.phoneView.isHidden = true

        
        // Do any additional setup after loading the view.
    }
    @IBAction func backBtn(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
        
    }
}
extension UEditProfileViewController: UITextFieldDelegate{
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {

        if textField == nametf{
            self.nameView.isHidden = false
            self.emailView.isHidden = true
            self.phoneView.isHidden = true

        }
        else if textField == emailtf {
            self.nameView.isHidden = true
            self.emailView.isHidden = false
            self.phoneView.isHidden = true
        }
        else{
            self.nameView.isHidden = true
            self.emailView.isHidden = true
            self.phoneView.isHidden = false
        }
      }
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.nameView.isHidden = true
        self.emailView.isHidden = true
        self.phoneView.isHidden = true
    }
    
}
