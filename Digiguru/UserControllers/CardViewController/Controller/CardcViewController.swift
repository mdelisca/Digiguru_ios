//
//  CardcViewController.swift
//  Digiguru
//
//  Created by Macbook Air on 8/5/21.
//

import UIKit

class CardcViewController: UIViewController {

    @IBOutlet weak var lblCardName: UILabel!
    
    @IBOutlet weak var lblCardNuber: UILabel!
    
    @IBOutlet weak var lblPrice: UILabel!
    
    @IBOutlet weak var tfcardNumber: UITextField!
    
    @IBOutlet weak var tfName: UITextField!
    
    @IBOutlet weak var tfMothn: UITextField!
    
    @IBOutlet weak var tfYers: UITextField!
    
    @IBOutlet weak var tfCVC: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveCard(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
