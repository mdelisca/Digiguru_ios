//
//  UHomeViewController.swift
//  Digiguru
//
//  Created by Buzzware Tech on 09/08/2021.
//

import UIKit

struct collectionData {
    var id:Int!
    var image:UIImage!
    var name:String!
}

import UIKit

class UHomeViewController: UIViewController {

    @IBOutlet weak var hometableView: UITableView!
    
    
    var Collectionarray = [collectionData]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        filldata()
        hometableView.showsHorizontalScrollIndicator = false
        hometableView.showsVerticalScrollIndicator = false

        // Do any additional setup after loading the view.
    }
    func filldata(){
        
        self.Collectionarray.append(collectionData(id: 1, image: #imageLiteral(resourceName: "Categories 1"),name: ""))
        self.Collectionarray.append(collectionData(id: 2, image: #imageLiteral(resourceName: "Categories 2"),name: "Education"))
        self.Collectionarray.append(collectionData(id: 3, image: #imageLiteral(resourceName: "Categories 3"),name: "Cooking"))
        self.Collectionarray.append(collectionData(id: 1, image: #imageLiteral(resourceName: "Fitness"),name: "Fitness"))
        self.Collectionarray.append(collectionData(id: 4, image: #imageLiteral(resourceName: "Relationship"),name: "Relationship"))
        self.Collectionarray.append(collectionData(id: 5, image: #imageLiteral(resourceName: "Beauty"),name: "Beauty"))
        self.Collectionarray.append(collectionData(id: 6, image: #imageLiteral(resourceName: "Content Creation"),name: "Content Creation"))
        self.Collectionarray.append(collectionData(id: 7, image: #imageLiteral(resourceName: "Entrepreneurial"),name: "Entrepreneurial"))
        self.Collectionarray.append(collectionData(id: 8, image: #imageLiteral(resourceName: "Budget"),name: "budget"))
        self.Collectionarray.append(collectionData(id: 8, image: #imageLiteral(resourceName: "investments"),name: "investments"))
        self.Collectionarray.append(collectionData(id: 9, image: #imageLiteral(resourceName: "Dancing"),name: "Dancing"))
        self.Collectionarray.append(collectionData(id: 10, image: #imageLiteral(resourceName: "Life-hacks"),name: "Life-hacks"))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }


}


extension UHomeViewController:UITableViewDelegate,UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == 0 {
            
            tableView.estimatedRowHeight = 350.0
            tableView.rowHeight = 350.0
            return 350.0
            
        }
       else if indexPath.row == 1 {
        
        tableView.estimatedRowHeight = 180.0
        tableView.rowHeight = 180.0
        return 180.0
        }
        else if indexPath.row == 2 {
            
            tableView.estimatedRowHeight = 180.0
            tableView.rowHeight = 180.0
            return 180.0
        }
        else if indexPath.row == 3 {
            
            tableView.estimatedRowHeight = 180.0
            tableView.rowHeight = 180.0
            return 180.0
        }
        else if indexPath.row == 4 {
            
            tableView.estimatedRowHeight = 180.0
            tableView.rowHeight = 180.0
            return 180.0
        }
        else{
            return 10.0
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "UpperTableViewCell") as! UpperTableViewCell
            
            return cell
        }
       else if indexPath.row == 1 {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RoutineTableViewCell") as! RoutineTableViewCell
        
        cell.routineCollectionView.delegate = self
        cell.routineCollectionView.dataSource = self
        cell.routineCollectionView.showsHorizontalScrollIndicator = false
        cell.routineCollectionView.showsVerticalScrollIndicator = false
        cell.routineCollectionView.accessibilityHint = "Routine"
        
        
        
        return cell
        }
       else if indexPath.row == 2 {
           let cell = tableView.dequeueReusableCell(withIdentifier: "popularTableViewCell") as! popularTableViewCell
           
           cell.collectionView.delegate = self
           cell.collectionView.dataSource = self
           cell.collectionView.showsHorizontalScrollIndicator = false
           cell.collectionView.showsVerticalScrollIndicator = false
           cell.collectionView.accessibilityHint = "popular"
           
           
           return cell
       }
        else if indexPath.row == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "rewardsTableViewCell") as! rewardsTableViewCell
            
            cell.rewardCollectionView.delegate = self
            cell.rewardCollectionView.dataSource = self
            cell.rewardCollectionView.showsHorizontalScrollIndicator = false
            cell.rewardCollectionView.showsVerticalScrollIndicator = false
            cell.rewardCollectionView.accessibilityHint = "Reward"

            
            return cell
        }
       
        else if indexPath.row == 4 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "RecommendTableViewCell") as! RecommendTableViewCell
            
            cell.collectionView.delegate = self
            cell.collectionView.dataSource = self
            cell.collectionView.showsHorizontalScrollIndicator = false
            cell.collectionView.showsVerticalScrollIndicator = false
            cell.collectionView.accessibilityHint = "recom"
            
            
            return cell
        }
  
        else{
            return UITableViewCell()
        }
    }
    
    
}



extension UHomeViewController: UICollectionViewDelegate,UICollectionViewDataSource
{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.accessibilityHint == "Routine"{
            
            return self.Collectionarray.count
        }
        else if collectionView.accessibilityHint == "Reward"{
            
            return 20
        }
        else if collectionView.accessibilityHint == "popular"{
            return 10
        }
        else if collectionView.accessibilityHint == "recom"{
            
            return 10
        }
        else{
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView.accessibilityHint == "Routine"{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RoutineCollectionViewCell", for: indexPath) as! RoutineCollectionViewCell
            
            cell.imgView.image = self.Collectionarray[indexPath.row].image!
            
            cell.lblName.text = self.Collectionarray[indexPath.row].name!
            
            
            return cell
        }
        else if collectionView.accessibilityHint == "Reward" {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "rewrdsCollectionViewCell", for: indexPath) as! rewrdsCollectionViewCell
            
            return cell
        }
        else if collectionView.accessibilityHint == "recom"{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "reccomCollectionViewCell", for: indexPath) as! reccomCollectionViewCell
            return cell
        }
        else if collectionView.accessibilityHint == "popular"{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "reccomCollectionViewCell", for: indexPath) as! reccomCollectionViewCell
            return cell
        }

        else{
            
            return UICollectionViewCell()
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView.accessibilityHint == "Routine"{
           
            if Collectionarray[indexPath.row].id == 1 {
                
                let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let vcc: homeRoutineViewController = storyboard.instantiateViewController(withIdentifier: "homeRoutineViewController") as! homeRoutineViewController
                
                vcc.isID = 1
                
                
                self.navigationController?.pushViewController(vcc, animated: true)

            }
            else if Collectionarray[indexPath.row].id == 2 {
                
                let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let vcc: homeRoutineViewController = storyboard.instantiateViewController(withIdentifier: "homeRoutineViewController") as! homeRoutineViewController
                
                vcc.isID = 2
                
                
                self.navigationController?.pushViewController(vcc, animated: true)
            }
            else{
                
                let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let vcc: homeRoutineViewController = storyboard.instantiateViewController(withIdentifier: "homeRoutineViewController") as! homeRoutineViewController
                
                vcc.isID = 3
            
                
                self.navigationController?.pushViewController(vcc, animated: true)
            }
       
            
            
        }
        else if collectionView.accessibilityHint == "Reward" {
            
            CommonHelper.sharedInstance.changeNAV_VC(identifier: "FavViewController", vc: self)
          
        }
        else if collectionView.accessibilityHint == "popular"{
            
            CommonHelper.sharedInstance.changeNAV_VC(identifier: "UBuyNowViewController", vc: self)
        }
        else if collectionView.accessibilityHint == "recom"{
            
            CommonHelper.sharedInstance.changeNAV_VC(identifier: "UBuyNowViewController", vc: self)
        }
        else{
            
        }
    }
    
    
    
}
