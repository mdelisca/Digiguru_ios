//
//  VBuyNowViewController.swift
//  Digiguru
//
//  Created by Buzzware Tech on 09/08/2021.
//

import UIKit

struct sectionName {
    var section:String!
    var activities:[activityStruct]!
}

struct activityStruct {
    
    var name:String!
}

class VBuyNowViewController: UIViewController {

    
    @IBOutlet weak var buyTableView: UITableView!
    
    
    var array = [activityStruct]()
    var array1 = [activityStruct]()
    var array2 = [activityStruct]()
    var array3 = [activityStruct]()
    var array4 = [activityStruct]()
    var array5 = [activityStruct]()

    var sections = [sectionName]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populatedata()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        
        self.navigationController?.navigationBar.isHidden = true
    }
    func populatedata(){
        // Static Cell values
        array.append(activityStruct(name: "1"))
        sections.append(sectionName(section: "", activities: array))
        
        array1.append(activityStruct(name: "2"))
        sections.append(sectionName(section: "", activities: array1))
        
        array2.append(activityStruct(name: "3"))
        sections.append(sectionName(section: "", activities: array2))
        
        
        // Dynamic cell Values
        
        // Assign Instructors Array
        array3.append(activityStruct(name: "4"))
        sections.append(sectionName(section: "Instructor", activities: array3))
        
        // Assign Reviwes Array

//        array4.append(activityStruct(name: "4"))
//        array4.append(activityStruct(name: "4"))
//
//
//        sections.append(sectionName(section: "Reviews & Ratings", activities: array4))
        
        // Static Cell values
        array5.append(activityStruct(name: "4"))
        sections.append(sectionName(section: "", activities: array5))
        
        self.buyTableView.reloadData()

    }
    
    @objc func backButton(sender: UIButton){
       
       // goto next
        self.navigationController?.popViewController(animated: true)
    }


}
extension VBuyNowViewController:UITableViewDelegate,UITableViewDataSource{
    
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if section == 3 {
            
          let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 50))
            headerView.backgroundColor = UIColor.white
          let label = UILabel()
          label.frame = CGRect.init(x: 8, y: 5,width: headerView.frame.width-20, height: headerView.frame.height-20)
            label.text = self.sections[section].section!
            label.font = UIFont(name: "System", size: 24)
            label.font = UIFont.boldSystemFont(ofSize: 24.0)

          label.textColor = UIColor(named: "black")
          headerView.addSubview(label)
          return headerView
        }
//        else if section == 4 {
//
//          let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 50))
//            headerView.backgroundColor = UIColor.white
//          let label = UILabel()
//          label.frame = CGRect.init(x: 8, y: 5,width: headerView.frame.width-20, height: headerView.frame.height-20)
//           label.text = self.sections[section].section!
//            label.font = UIFont(name: "System", size: 24)
//            label.font = UIFont.boldSystemFont(ofSize: 24.0)
//            label.textColor = UIColor(named: "black")
//            headerView.addSubview(label)
//          return headerView
//        }
        else {
            return nil
        }
 
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        if section == 3 {
          
            return 50.0
          
        }
//        else if section == 4 {
//
//            return 50.0
//
//        }
        else {
            return 0.0

        }
    }
   

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return sections[section].activities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if indexPath.section == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderTableViewCell") as! HeaderTableViewCell
            
            cell.backBtn.addTarget(self, action:#selector(backButton), for: .touchUpInside)
            
            
            
            return cell
        }
        else if indexPath.section ==  1{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "InformationTableViewCell") as! InformationTableViewCell
            return cell
        }
        else if indexPath.section ==  2{
            let cell = tableView.dequeueReusableCell(withIdentifier: "categoryTableViewCell") as! categoryTableViewCell
            return cell
        }
        else if indexPath.section ==  3{
            let cell = tableView.dequeueReusableCell(withIdentifier: "InstructorTableViewCell") as! InstructorTableViewCell
            return cell
        }
//        else if indexPath.section ==  4{
//            let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewsTableViewCell") as! ReviewsTableViewCell
//            return cell
//        }
        else if indexPath.section ==  4{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "BuynowTableViewCell") as! BuynowTableViewCell
            
            cell.shadowview.addTopShadow(shadowColor: UIColor.gray, shadowOpacity: 0.3, shadowRadius: 5, offset: CGSize(width: 0.0, height : -2.0))
            cell.Btnbuynow.addTarget(self, action:#selector(GotoNext), for: .touchUpInside)
            return cell
        }
        else{
            return UITableViewCell()
        }
    }
    
    
    @objc func GotoNext(sender: UIButton){
        
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)

        let vcc: UploadRoutineTableViewController = storyboard.instantiateViewController(withIdentifier: "UploadRoutineTableViewController") as! UploadRoutineTableViewController
        
        vcc.isre = true

        self.navigationController?.pushViewController(vcc, animated: true)
//       // goto next
        
    }
    
   

}
