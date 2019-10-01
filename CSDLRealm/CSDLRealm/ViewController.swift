//
//  ViewController.swift
//  CSDLRealm
//
//  Created by Boss on 9/30/19.
//  Copyright © 2019 LuyệnĐào. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource{
  
    
    
    @IBOutlet weak var tableView: UITableView!
    // biến khởi tạo data Manager
    
    var dbManager: DBManager?
    
    // biến chứa danh sách dữ liệu
    
    var dataList: Results<RoleUser>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
         dbManager = DBManager.sharedInstance
        
        // lấy ra danh sách dữ liệu
        
        dataList = dbManager?.getDataFromDB()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        dataList = dbManager?.getDataFromDB()
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = dataList![indexPath.row].textNote
        return cell
    }
    
    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       if segue.identifier == "GotoEditMode" {
            let addVC = segue.destination as? AddViewController
        // Thiết lập thêm các thuộc tính khi ở chế độ sửa
            addVC?.inEditMode = true
        if let index = tableView.indexPathForSelectedRow {
            let itemObject = dataList![index.row]
            addVC?.currentItem = itemObject
            addVC?.title = "Edit"
        }
        
       } else{
        
        }
    }


}

