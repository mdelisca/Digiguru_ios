//
//  UProfileViewController.swift
//  Digiguru
//
//  Created by Buzzware Tech on 09/08/2021.
//

import UIKit

class UProfileViewController: UIViewController {

    @IBOutlet weak var profileTableView: UITableView!
    
    @IBOutlet weak var Imageprofile: UIImageView!
    
    @IBOutlet weak var lblnameProfile: UILabel!
    
    @IBOutlet weak var lblemail: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileTableView.showsHorizontalScrollIndicator = false
        profileTableView.showsVerticalScrollIndicator = false

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func editProfile(_ sender: Any) {
        
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        let vcc = storyboard.instantiateViewController(withIdentifier: "UEditProfileViewController") as! UEditProfileViewController
        
        self.navigationController?.pushViewController(vcc, animated: true)
    }
    
    @IBAction func logOutBtn(_ sender: Any) {
        
        logOut()

    }
    
    func logOut() {
        
        let dashboardViewController = self.storyboard?.instantiateViewController(identifier: "SignInViewController") as! UINavigationController
        UIApplication.shared.windows.first?.rootViewController = dashboardViewController
    
        }
}
extension UProfileViewController:UITableViewDelegate,UITableViewDataSource{
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
            return 1
        
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

          let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 35))
            headerView.backgroundColor = UIColor(named: "BGColor")
          let label = UILabel()
          label.frame = CGRect.init(x: 8, y: 5,width: headerView.frame.width-20, height: headerView.frame.height-10)
            label.text = "My Routines"
            label.font = UIFont(name: "System", size: 24)
            label.font = UIFont.boldSystemFont(ofSize: 24.0)

          label.textColor = UIColor(named: "black")
          headerView.addSubview(label)
          return headerView
       
 
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 35
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
