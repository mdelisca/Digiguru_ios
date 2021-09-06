//
//  PaymentCardViewController.swift
//  Digiguru
//
//  Created by Macbook Air on 8/5/21.
//


struct paymentCard {
    var name:String!
    var isCheck:Bool!
    var image:UIImage!
    var number:String!
}

import UIKit

class PaymentCardViewController: UIViewController {

    @IBOutlet weak var paymentableView: UITableView!
    
    
    var arry = [paymentCard]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        self.paymentableView.showsVerticalScrollIndicator = false
        self.paymentableView.showsHorizontalScrollIndicator = false

        loadDATA()
        // Do any additional setup after loading the view.
    }
    
    func loadDATA(){
        
        arry.append(paymentCard(name: "Master Card", isCheck: false, image: #imageLiteral(resourceName: "ic_master"), number: "xxxx - xxxx - xxxx - 2345"))
        arry.append(paymentCard(name: "Visa Master", isCheck: false, image: #imageLiteral(resourceName: "ic_visa"), number: "xxxx - xxxx - xxxx - 8945"))
        arry.append(paymentCard(name: "American Express", isCheck: false, image: #imageLiteral(resourceName: "ic_amex"), number: "xxxx - xxxx - xxxx - 6645"))
        self.paymentableView.reloadData()
    }
    
    @IBAction func backBtn(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func payBtn(_ sender: Any) {
        
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vcc: CardcViewController = storyboard.instantiateViewController(withIdentifier: "CardcViewController") as! CardcViewController
        
        self.navigationController?.pushViewController(vcc, animated: true)
        
    }
    


}
extension PaymentCardViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arry.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cardTableViewCell") as! cardTableViewCell
        
        
        
        if self.arry[indexPath.row].isCheck{
            
            cell.checkBTn.setImage(#imageLiteral(resourceName: "ic_radio_active"), for: .normal)
        }
        else{
            cell.checkBTn.setImage(#imageLiteral(resourceName: "ic_radio_normal"), for: .normal)

        }
        cell.checkBTn.tag = indexPath.row
        cell.checkBTn.addTarget(self, action:#selector(handleRegister), for: .touchUpInside)
        cell.imagecard.image =  self.arry[indexPath.row].image!
        cell.lblNumber.text = self.arry[indexPath.row].number!
        cell.lblname.text = self.arry[indexPath.row].name
        
        return cell
    }
    
    @objc func handleRegister(sender: UIButton){
        
        let index = sender.tag
        
        for index1 in arry.indices {
            
            self.arry[index1].isCheck = false
            
        }
        
        self.arry[index].isCheck = true
        
        self.paymentableView.reloadData()
        
    }
    
    
    
    
}
