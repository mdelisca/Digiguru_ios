//
//  VHomeViewController.swift
//  Digiguru
//
//  Created by Buzzware Tech on 09/08/2021.
//

import UIKit

struct sectionsss {
    
    var activities:[progressvalue]!
}

struct progressvalue {
    
    var value:Int!
}

import UIKit

class VHomeViewController: UIViewController {

    @IBOutlet weak var lbltotal: UILabel!
    
    
    @IBOutlet weak var homeTableView: UITableView!
    
    var data = [String]()
    var value = [Double]()
    
    
    var secArray = [sectionsss]()
    var Array2 = [progressvalue]()
    var Array = [progressvalue]()


    
    override func viewDidLoad() {
        super.viewDidLoad()

        filldata()
        // Do any additional setup after loading the view.
    }
    
    func filldata(){
        self.Array.append(progressvalue(value: 12))
        
        self.secArray.append(sectionsss(activities: self.Array))
        
        self.Array2.append(progressvalue(value:4))
        self.Array2.append(progressvalue(value: 8))
        
        self.secArray.append(sectionsss(activities: self.Array2))
        
        self.data.append("Jan")
        self.data.append("Feb")
        self.data.append("Mar")
        self.data.append("Apr")
        self.data.append("May")
        self.data.append("Jun")
        self.data.append("Jul")
        self.data.append("Aug")
        self.data.append("Sep")
        
        self.value.append(20.0)
        self.value.append(40.0)
        self.value.append(30.0)
        self.value.append(70.0)
        self.value.append(80.0)
        self.value.append(90.0)
        self.value.append(100.0)
        self.value.append(50.0)
        self.value.append(60.0)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }

}
extension VHomeViewController:UITableViewDelegate,UITableViewDataSource{
    
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return secArray.count
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if section == 1 {
            
          let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 50))
            headerView.backgroundColor = UIColor(named: "BGColor")
          let label = UILabel()
          label.frame = CGRect.init(x: 8, y: 5,width: headerView.frame.width-20, height: headerView.frame.height-20)
            label.text = "Routines"
            label.font = UIFont(name: "System", size: 24)
            label.font = UIFont.boldSystemFont(ofSize: 24.0)

          label.textColor = UIColor(named: "black")
          headerView.addSubview(label)
          return headerView
        }

        else {
            return nil
        }
 
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        if section == 1 {
          
            return 50.0
          
        }
        else {
            return 0.0

        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return secArray[section].activities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "homeTableViewCell") as! homeTableViewCell
            
            cell.setbarData(data: self.data, value: self.value)
            
            return cell
        }
        else if indexPath.section == 1{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "RoutinessTableViewCell") as! RoutinessTableViewCell
            
            if self.secArray[indexPath.section].activities[indexPath.row].value! == 8{
                cell.progressbaar.tintColor = UIColor(named: "Blue")
                cell.progressbaar.progress = 0.8
            }
            else{
                
                cell.progressbaar.tintColor = UIColor.black
                cell.progressbaar.progress = 0.6

            }
           
           
            
            
            
            //cell.setbarData(data: self.data, value: self.value)
            
            return cell
        }
        else{
            return UITableViewCell()
        }
    }
    
    
    
    
    
    
    
    
    
}
