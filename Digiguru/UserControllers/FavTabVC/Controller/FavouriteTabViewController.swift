//
//  FavouriteTabViewController.swift
//  Digiguru
//
//  Created by Macbook Air on 8/6/21.
//

import UIKit

class FavouriteTabViewController: UIViewController {

    
    @IBOutlet weak var favTableView: UITableView!
    
    var array = [Bool]()

    override func viewDidLoad() {
        
        super.viewDidLoad()
        favTableView.showsHorizontalScrollIndicator = false
        favTableView.showsVerticalScrollIndicator = false

        
        array.append(false)
        array.append(false)
        array.append(true)
        array.append(false)
        array.append(false)
        array.append(false)
        array.append(false)
        array.append(false)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }


}
extension FavouriteTabViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "routineHomeTableViewCell") as! routineHomeTableViewCell
        
        if array[indexPath.row] == true{
            cell.favBtn.setImage(#imageLiteral(resourceName: "Group 378"), for: .normal)
            cell.favBtn.tag = indexPath.row
            cell.favBtn.addTarget(self, action:#selector(handleRegister), for: .touchUpInside)
        }
        else{
            cell.favBtn.setImage(#imageLiteral(resourceName: "Group 219"), for: .normal)
            cell.favBtn.tag = indexPath.row
            cell.favBtn.addTarget(self, action:#selector(handleRegister), for: .touchUpInside)
        }
      
        
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        let vcc = storyboard.instantiateViewController(withIdentifier: "UBuyNowViewController") as! UBuyNowViewController
        
        self.navigationController?.pushViewController(vcc, animated: true)
        
        
    }
    @objc func handleRegister(sender: UIButton){
       
        let index = sender.tag
        if array[index] == true{
            
            array[index] = false
        }
        else{
            array[index] = true

        }
        
        favTableView.reloadData()
        
        
        
    }
}
