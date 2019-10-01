//
//  AddViewController.swift
//  CSDLRealm
//
//  Created by Boss on 10/1/19.
//  Copyright © 2019 LuyệnĐào. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {
    @IBOutlet weak var textFieldName: UITextField!
    //  thêm thuộc tính để đánh dấu là thêm mới hay sửa
    
    var inEditMode: Bool = false // mac dinh la che do them moii
    
    var currentItem: RoleUser?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textFieldName.text = currentItem?.textNote
        // Do any additional setup after loading the view.
    }
    

    @IBAction func pressOnSave(_ sender: Any) {
        // kiem tra gia tri nguoi dung nhap vao`
        let stt = textFieldName.text
        if (stt!.isEmpty){
            print("Không được để trống")
            return
        }
        // Neu o che do sua
        if (inEditMode){
            let role = RoleUser()
            role.ID = currentItem!.ID
            role.textNote = stt!
            DBManager.sharedInstance.updateDb(object: role)
            self.navigationController?.popViewController(animated: true)
        }else{
            // dang o che do them
            let role = RoleUser()
            role.textNote = stt!
            DBManager.sharedInstance.addData(object: role)
            self.dismiss(animated: true, completion: nil)
            
        }
    }
    
    @IBAction func pressOnCancel(_ sender: Any) {
        // Neu o che do sua
        
        if (inEditMode){
            self.navigationController?.popViewController(animated: true)
        }else{
            // Dang o che do them moi
            
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    
}
