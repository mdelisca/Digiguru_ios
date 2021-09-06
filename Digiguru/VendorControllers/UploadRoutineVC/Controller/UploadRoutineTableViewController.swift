//
//  UploadRoutineTableViewController.swift
//  DigiguruVendor
//
//  Created by Macbook Air on 8/7/21.
//
struct sectionUpload {
    var arrayIndex:[IndexUpload]!
}
struct IndexUpload {
    var starttime:String!
    var endTime:String!
    var isAdded:Bool!
}
import UIKit

class UploadRoutineTableViewController: UIViewController {


    @IBOutlet weak var uploadTableView: UITableView!
    
    
    
    var sectionArray = [sectionUpload]()
    var indexArray =  [IndexUpload]()
    var indexArray1 =  [IndexUpload]()
    var indexArray2 =  [IndexUpload]()
    var indexArray3 =  [IndexUpload]()
    var indexArray4 =  [IndexUpload]()
    var indexArray5 =  [IndexUpload]()
    var indexArray6 =  [IndexUpload]()

    @IBOutlet weak var backbtn: UIButton!
    
    var isre = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if isre{
            backbtn.isHidden = false
        }
        else{
            backbtn.isHidden = true

        }
        self.navigationController?.navigationBar.isHidden = true

        filldata()

        // Do any additional setup after loading the view.
    }
    @IBAction func backbtn(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
    func filldata(){
        
        
        self.indexArray1.append(IndexUpload(starttime: "", endTime: "", isAdded: false))
        
        sectionArray.append(sectionUpload(arrayIndex: indexArray1))
        
        self.indexArray5.append(IndexUpload(starttime: "", endTime: "", isAdded: false))
        
        sectionArray.append(sectionUpload(arrayIndex: indexArray5))
        
        self.indexArray6.append(IndexUpload(starttime: "", endTime: "", isAdded: false))
        
        sectionArray.append(sectionUpload(arrayIndex: indexArray6))
        
        
        
        self.indexArray.append(IndexUpload(starttime: "", endTime: "", isAdded: false))
        
        sectionArray.append(sectionUpload(arrayIndex: indexArray))
        
        
        
        
        self.indexArray2.append(IndexUpload(starttime: "", endTime: "", isAdded: false))
        
        sectionArray.append(sectionUpload(arrayIndex: indexArray2))
        
        
        self.indexArray3.append(IndexUpload(starttime: "", endTime: "", isAdded: false))
        
        sectionArray.append(sectionUpload(arrayIndex: indexArray3))
        
        
        self.indexArray4.append(IndexUpload(starttime: "", endTime: "", isAdded: false))
        
        sectionArray.append(sectionUpload(arrayIndex: indexArray4))
        
        self.uploadTableView.reloadData()
        
        
        
    }

}

extension UploadRoutineTableViewController:UITableViewDelegate,UITableViewDataSource{
    
     func numberOfSections(in tableView: UITableView) -> Int {
        return sectionArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return sectionArray[section].arrayIndex.count
        }
        else if section == 1{
            return sectionArray[section].arrayIndex.count

        }
        else if section == 2{
            return sectionArray[section].arrayIndex.count

        }
        else if section == 3{
            return indexArray.count

        }
        else if section == 4{
            return sectionArray[section].arrayIndex.count

        }
        else if section == 5{
            return sectionArray[section].arrayIndex.count

        }
        else if section == 6{
            return sectionArray[section].arrayIndex.count

        }
        else{
            return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TfTableViewCell") as! TfTableViewCell
            
            cell.DataTf.delegate = self
            cell.DataTf.tag = 0
            
            return cell
    
        }
        
        else if indexPath.section == 1{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryTableViewCell") as! CategoryTableViewCell
            
            cell.catTf.delegate = self
            cell.catTf.tag = 1

            return cell
        }
        else if indexPath.section == 2{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "tfPriceTableViewCell") as! tfPriceTableViewCell
            
            cell.priceTF.delegate = self
            cell.priceTF.tag = 2

            
            
            return cell
        }
        else if indexPath.section == 3{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "SelectedTimeTableViewCell") as! SelectedTimeTableViewCell
            
            
            
            if self.indexArray[indexPath.row].isAdded{
                
                cell.endTimeTF.delegate = self
                cell.endTimeTF.tag = 4
                cell.starttimeTF.delegate = self
                cell.starttimeTF.tag = 5
                
                cell.imagebtn.image = #imageLiteral(resourceName: "01) Icons-Filled-arrow-circle-down-fill Copy")
                cell.ButtonAddOrRemove.tag = indexPath.row

                cell.ButtonAddOrRemove.addTarget(self, action:#selector(handleRegisterremove), for: .touchUpInside)
                
                
                
            }
            else{
                
                cell.endTimeTF.delegate = self
                cell.endTimeTF.tag = 4
                cell.starttimeTF.delegate = self
                cell.starttimeTF.tag = 5
                
                cell.imagebtn.image = #imageLiteral(resourceName: "Upload Routines1")
                cell.ButtonAddOrRemove.tag = indexPath.row
                cell.ButtonAddOrRemove.addTarget(self, action:#selector(handleRegisteradd), for: .touchUpInside)
                
            }
            
            
            
            return cell
            
            
        }
        else if indexPath.section == 4{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "DetailsTableViewCell") as! DetailsTableViewCell
            
            cell.detailTF.delegate = self
            cell.detailTF.tag = 3
            
            return cell
        }
        else if indexPath.section == 5{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "UploadImageTableViewCell") as! UploadImageTableViewCell
            
            
            return cell
        }
        else if indexPath.section == 6{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "SaveTableViewCell") as! SaveTableViewCell
            
            
            return cell
        }
        else{
            return UITableViewCell()
        }

        
        
    }
    
    
    @objc func handleRegisteradd(sender: UIButton){
//        self.uploadTableView
//        uploadTableView.endUpdates()
        
        let index = sender.tag
        self.uploadTableView.beginUpdates()
//        self.sectionArray.insert(sectionUpload(arrayIndex: indexArray), at: 3)
        let indexPath = IndexPath(row: indexArray.count, section: 3)
        indexArray.append(IndexUpload(starttime:"12.00" , endTime: "116.2323", isAdded: true))

        self.uploadTableView.insertRows(at: [indexPath], with: .automatic)
        self.uploadTableView.endUpdates()
        
        
    }
    @objc func handleRegisterremove(sender: UIButton){
        //...
        self.uploadTableView.beginUpdates()
        let index = sender.tag
        indexArray.remove(at: index)
        let indexPath = IndexPath(row: indexArray.count, section: 3)
        self.uploadTableView.deleteRows(at: [indexPath], with: .automatic)
        self.uploadTableView.endUpdates()
     }

}

extension UploadRoutineTableViewController:UITextFieldDelegate{
    
    
    
}
