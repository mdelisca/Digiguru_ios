//
//  MyRoutineViewController.swift
//  Digiguru
//
//  Created by Macbook Air on 8/6/21.
//

import UIKit
import FSCalendar

class MyRoutineViewController: UIViewController,FSCalendarDelegate {

    
    @IBOutlet weak var myRoutineTableView: UITableView!
    
    @IBOutlet weak var calnderView: FSCalendar!

    var date:String!
    var headerArray = ["Upcoming Routines","Past Routines"]
    var isdate =  false
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myRoutineTableView.showsVerticalScrollIndicator = false
        myRoutineTableView.showsHorizontalScrollIndicator = false
        myRoutineTableView.separatorStyle = .none
        
        
        calnderView.appearance.selectionColor = UIColor(named: "Blue")
        calnderView.appearance.todayColor = UIColor(named: "Blue")
        
        calnderView.delegate = self
        calnderView.allowsMultipleSelection = false
        calnderView.swipeToChooseGesture.isEnabled = false
        
        
        
      
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        
        let datefor = DateFormatter()
        datefor.dateFormat = "dd MMMM,yyyy"
        self.date = datefor.string(from: date)
        
        isdate = true
        //self.myRoutineTableView.reloadData()
        
        
//        if date.isAfterDate(Date().endOfDay!) {
//          calendar.deselect(date)
//        } else {
//          selectedDateArray.append(date)
//        }
      }
      
      func calendar(_ calendar: FSCalendar, didDeselect date: Date, at monthPosition: FSCalendarMonthPosition) {
        
       

        isdate = false
        self.myRoutineTableView.reloadData()
        
//        if calendar.selectedDates.count > 2 {
//          let datesToDeselect: [Date] = calendar.selectedDates.filter{ $0 > date }
//          datesToDeselect.forEach{ calendar.deselect($0) }
//          calendar.select(date) // adds back the end date that was just deselected so it matches selectedDateArray
//        }
//        selectedDateArray = selectedDateArray.filter{ $0 < date }
//        selectedDateArray.forEach{calnderView.select($0)}
      }
    

}
extension MyRoutineViewController:UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return headerArray.count
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

          let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 50))
            headerView.backgroundColor = UIColor(named: "BGColor")
          let label = UILabel()
          label.frame = CGRect.init(x: 8, y: 5,width: headerView.frame.width-20, height: headerView.frame.height-20)
        label.text = self.headerArray[section]
            label.font = UIFont(name: "System", size: 24)
            label.font = UIFont.boldSystemFont(ofSize: 24.0)

          label.textColor = UIColor(named: "black")
          headerView.addSubview(label)
          return headerView
       
 
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "MyRoutineTableViewCell") as! MyRoutineTableViewCell
        
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        let vcc = storyboard.instantiateViewController(withIdentifier: "UBuyNowViewController") as! UBuyNowViewController
        
        self.navigationController?.pushViewController(vcc, animated: true)
    }
    
}
