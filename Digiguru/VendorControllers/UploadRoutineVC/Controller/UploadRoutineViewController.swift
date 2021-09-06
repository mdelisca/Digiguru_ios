//
//  UploadRoutineViewController.swift
//  DigiguruVendor
//
//  Created by Macbook Air on 8/6/21.
//

import UIKit

class UploadRoutineViewController: UIViewController {
    
    
    @IBOutlet weak var backarrow: UIButton!
    @IBOutlet weak var uplaodBTn: UIButton!
    
    
    
    var isredirect = false
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        //gradiatColor()
        if isredirect{
            backarrow.isHidden = false
        }
        else{
            
            backarrow.isHidden = true

        }
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    
    func gradiatColor(){
        
        
        let topGradientColor = UIColor.lightGray
        let bottomGradientColor = UIColor.white

        let gradientLayer = CAGradientLayer()

        gradientLayer.frame = uplaodBTn.bounds

        gradientLayer.colors = [topGradientColor.cgColor, bottomGradientColor.cgColor]

        //Vertical
        //gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        //gradientLayer.endPoint = CGPoint(x: 0.0, y: 1.0)

        //Horizontal
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.0)

        gradientLayer.locations = [0.0, 1.0]

        uplaodBTn.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    @IBAction func upoadBtn(_ sender: Any) {
    }
    
    @IBAction func sumbitBTn(_ sender: Any) {
        
        
    }
    
    
    
    @IBAction func backbtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
