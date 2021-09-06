//
//  VProfileViewController.swift
//  Digiguru
//
//  Created by Buzzware Tech on 09/08/2021.
//

import UIKit

class VProfileViewController: UIViewController {

    @IBOutlet weak var profileTableView: UITableView!
    
    @IBOutlet weak var Imageprofile: UIImageView!
    
    @IBOutlet weak var lblnameProfile: UILabel!
    
    @IBOutlet weak var lblemail: UILabel!
    var headerArray = ["Subscription","My Routines"]
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
        
        let vcc = storyboard.instantiateViewController(withIdentifier: "VEditProfileViewController") as! VEditProfileViewController
        
        self.navigationController?.pushViewController(vcc, animated: true)
    }
    
    @IBAction func logOutBtn(_ sender: Any) {
        
        logOut()

    }
    @IBAction func btnGooglePreesed(_ sender: Any) {
        
        UIApplication.shared.openURL(URL(string: "https://www.instagram.com")!)

    }

    @IBAction func btnTwitterPressed(_ sender: Any) {
        
        UIApplication.shared.openURL(URL(string: "https://www.twitter.com")!)

    }
    @IBAction func btnFaceBookPressed(_ sender: Any) {
        
        UIApplication.shared.openURL(URL(string: "https://www.facebook.com")!)

    }

    func logOut() {
        
        let dashboardViewController = self.storyboard?.instantiateViewController(identifier: "SignInViewController") as! UINavigationController
        UIApplication.shared.windows.first?.rootViewController = dashboardViewController
    
        }
}
extension VProfileViewController:UITableViewDelegate,UITableViewDataSource{
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return self.headerArray.count
        
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

          let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 35))
            headerView.backgroundColor = UIColor(named: "BGColor")
          let label = UILabel()
          label.frame = CGRect.init(x: 8, y: 5,width: headerView.frame.width-20, height: headerView.frame.height-10)
        label.text = self.headerArray[section]
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
       
        if section == 0{
            return 1
        }
        else{
            return 2
        }
            

        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        if indexPath.section == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "MyRoutineTableViewCell1") as! MyRoutineTableViewCell1
            return cell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "MyRoutineTableViewCell") as! MyRoutineTableViewCell
            return cell
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        let vcc = storyboard.instantiateViewController(withIdentifier: "VBuyNowViewController") as! VBuyNowViewController
        
        self.navigationController?.pushViewController(vcc, animated: true)
    }
    
    
    
}
