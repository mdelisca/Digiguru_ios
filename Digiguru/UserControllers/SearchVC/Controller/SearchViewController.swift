//
//  SearchViewController.swift
//  Digiguru
//
//  Created by Macbook Air on 8/5/21.
//

struct SearchData {
    var Name:String!
}
struct sectionss {
    
    var array:[SearchData]!
}


import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var saerchTableView: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var array = [Bool]()

    
    var isSearch = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        saerchTableView.showsHorizontalScrollIndicator = false
        saerchTableView.showsVerticalScrollIndicator = false
        
        
        searchBar.layer.borderWidth = 1
        searchBar.layer.borderColor = UIColor(named: "BGColor")?.cgColor
        array.append(false)
        array.append(false)
        array.append(true)
        array.append(false)
        array.append(false)
        array.append(false)
        array.append(false)
        array.append(false)
        
        self.saerchTableView.reloadData()


        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func backBtn(_ sender: Any) {
        
        //self.navigationController.
        
    }
    @objc func handleRegister(sender: UIButton){
       
        let index = sender.tag
        if array[index] == true{
            
            array[index] = false
        }
        else{
            array[index] = true

        }
        
        saerchTableView.reloadData()
        
        
        
    }


}

extension SearchViewController:UITableViewDelegate,UITableViewDataSource{
    
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

          let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 50))
            headerView.backgroundColor = UIColor(named: "BGColor")
          let label = UILabel()
          label.frame = CGRect.init(x: 8, y: 5,width: headerView.frame.width-20, height: headerView.frame.height-20)
            label.text = "History"
            label.font = UIFont(name: "System", size: 24)
            label.font = UIFont.boldSystemFont(ofSize: 24.0)

          label.textColor = UIColor(named: "black")
          headerView.addSubview(label)
          return headerView
       
 
    }
    
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
    
    
    
    
    
    
}
extension SearchViewController:UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.isSearch = true
        self.saerchTableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.isSearch = false
        self.saerchTableView.reloadData()
        view.endEditing(true)


    }
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = true
        self.isSearch = true
        self.saerchTableView.reloadData()
    }
}
