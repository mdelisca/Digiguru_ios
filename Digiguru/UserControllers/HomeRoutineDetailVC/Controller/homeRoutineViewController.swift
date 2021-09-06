//
//  homeRoutineViewController.swift
//  Digiguru
//
//  Created by Macbook Air on 8/5/21.
//
struct arrayStruct {
    
    var id:Bool!
    var iamge:UIImage!
    var name:String!
    
}
import UIKit

class homeRoutineViewController: UIViewController {

    @IBOutlet weak var titleLbl: UILabel!
    
    @IBOutlet weak var Lblroutines: UILabel!
    
    @IBOutlet weak var routineHomeTableView: UITableView!
    
    @IBOutlet weak var mainImage: UIImageView!
    
    var array = [Bool]()
    var arry = [arrayStruct]()
    
    var isID = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        routineHomeTableView.showsHorizontalScrollIndicator = false
        routineHomeTableView.showsVerticalScrollIndicator = false
        
        if isID == 1{
            self.titleLbl.text = "Travel"
            self.mainImage.image = #imageLiteral(resourceName: "photo-1506470282729-2d")

            arry.append(arrayStruct(id: false, iamge: #imageLiteral(resourceName: "Rectangle8"),name: "Countries receive safe travel"))
            arry.append(arrayStruct(id: false, iamge: #imageLiteral(resourceName: "Rectangle11"),name: "Visa travel experiance"))
            arry.append(arrayStruct(id: true, iamge: #imageLiteral(resourceName: "Rectangle10"),name: "Summer travel outlook"))
            arry.append(arrayStruct(id: false, iamge: #imageLiteral(resourceName: "Rectangle8"),name: "Countries receive safe travel"))
            arry.append(arrayStruct(id: true, iamge: #imageLiteral(resourceName: "Rectangle11"),name: "Visa travel experiance"))
            arry.append(arrayStruct(id: true, iamge: #imageLiteral(resourceName: "Rectangle10"),name: "Summer travel outlook"))
       
          

        }
        else if isID == 2{
            self.titleLbl.text = "Education"
            self.mainImage.image = #imageLiteral(resourceName: "Group 62705")

            arry.append(arrayStruct(id: false, iamge: #imageLiteral(resourceName: "Categories 4"),name: "Countries receive safe travel"))
            arry.append(arrayStruct(id: false, iamge: #imageLiteral(resourceName: "Rectangle9"),name: "Visa travel experiance"))
            arry.append(arrayStruct(id: true, iamge: #imageLiteral(resourceName: "Rectangle10"),name: "Summer travel outlook"))
            arry.append(arrayStruct(id: false, iamge: #imageLiteral(resourceName: "Rectangle8"),name: "Countries receive safe travel"))
            arry.append(arrayStruct(id: true, iamge: #imageLiteral(resourceName: "Rectangle11"),name: "Visa travel experiance"))
            arry.append(arrayStruct(id: true, iamge: #imageLiteral(resourceName: "Rectangle10"),name: "Summer travel outlook"))

        }
        else{
            self.titleLbl.text = "Cooking"
            self.mainImage.image = #imageLiteral(resourceName: "photo-1506470282729-2d5d8433e9b9")
            
            arry.append(arrayStruct(id: false, iamge: #imageLiteral(resourceName: "Rectangle6"),name: "Cooking home for beginner"))
            arry.append(arrayStruct(id: false, iamge: #imageLiteral(resourceName: "Rectangle3"),name: "Cooking Asia food"))
            arry.append(arrayStruct(id: true, iamge: #imageLiteral(resourceName: "Rectangle2"),name: "Cooking Italian"))
            arry.append(arrayStruct(id: false, iamge: #imageLiteral(resourceName: "Rectangle6"),name: "Cooking home for beginner"))
            arry.append(arrayStruct(id: false, iamge: #imageLiteral(resourceName: "Rectangle3"),name: "Cooking Asia food"))
            arry.append(arrayStruct(id: true, iamge: #imageLiteral(resourceName: "Rectangle2"),name: "Cooking Italian"))

        }
        
      



        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func backBtn(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
        
    }
    @IBAction func sortBtn(_ sender: Any) {
    }
    override func viewWillAppear(_ animated: Bool) {
        
        self.navigationController?.navigationBar.isHidden = true
    }
 

}

extension homeRoutineViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arry.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "routineHomeTableViewCell") as! routineHomeTableViewCell
        
        if arry[indexPath.row].id == true{
            cell.favBtn.setImage(#imageLiteral(resourceName: "Group 378"), for: .normal)
            cell.favBtn.tag = indexPath.row
            cell.favBtn.addTarget(self, action:#selector(handleRegister), for: .touchUpInside)
        }
        else{
            cell.favBtn.setImage(#imageLiteral(resourceName: "Group 219"), for: .normal)
            cell.favBtn.tag = indexPath.row
            cell.favBtn.addTarget(self, action:#selector(handleRegister), for: .touchUpInside)
        }
        cell.imageicon.image = self.arry[indexPath.row].iamge!
        cell.lbltitle.text = self.arry[indexPath.row].name!
      
        
        
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
        if arry[index].id == true{
            
            arry[index].id = false
        }
        else{
            arry[index].id = true

        }
        
        routineHomeTableView.reloadData()
        
        
        
    }
    
    
    
    
}
