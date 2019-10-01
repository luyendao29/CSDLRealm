//
//  DBManager.swift
//  CSDLRealm
//
//  Created by Boss on 10/1/19.
//  Copyright © 2019 LuyệnĐào. All rights reserved.
//

import Foundation
import RealmSwift

class DBManager {
    // Biến chứa tham chiếu chiếu tới cơ sở dữ liệu Realm
    
    private var database: Realm
    
    // biến chứa thực thể duy nhất của lớp DBManager trong toàn bộ chương trình
    
    static let sharedInstance = DBManager()
    
    // Biến toàn cục của lớp DBManager chứa giá trị hiện tại của trường khoá Id
    static var autoID: Int = 0
    
    // Biến tham chiếu chiếu tới UserDefault data để lưu lại autoID
    let userData: UserDefaults?
    
    private init(){
        // khởi tạo database Realm
        database = try! Realm()
        // khởi tạo userData
        userData = UserDefaults.standard
        DBManager.autoID = (userData?.integer(forKey: "autoID"))!
    }
    
    // Hàm lấy dữ liệu từ cơ sở dũ liêu Realm ra
    // Results là class của realm
    func getDataFromDB() -> Results<RoleUser> {
        let result: Results<RoleUser> = database.objects(RoleUser.self)
        return result
    }
    
    // Hàm thêm dữ liệu vào cở sở dữ liệu Realm
    // Ghi dữ liệu vào cơ sở dữ liệu
    //(Nếu dataBase.write nó trả về fase thì sẽ k nhẩy vào thân hàm)
    func addData(object: RoleUser){
        try! database.write {
        DBManager.autoID += 1
        // Thiết lập trường ID
        object.ID = DBManager.autoID
        // tăng giá trị hiện tại cho khoá ID
            database.add(object)
            // Lưu lại thông tin id hiện tại vào userData
            userData?.set(DBManager.autoID, forKey: "autoID")
            print("them du lieu thanh cong")
        }
    }
    // Ham Xoa tung item
    func deleteItemFromDB(object: RoleUser) -> Bool {
        do {
            try! database.write {
                database.delete(object)
            }
            return true
        }catch{
            return false
        }
    }
    
    // HAM XOA TOAN BO DU LIEU
    
    func deleteAllFromDB() -> Bool {
        do {
            try! database.write {
                database.deleteAll()
            }
            return true
        }catch{
            return false
        }
    }
    
    //Ham cap nhat thong tin
    
    func updateDb(object: RoleUser) -> Bool {
        do {
            try! database.write {
                database.add(object, update: true)
            }
            return true
        }catch{
            return false
        }
    }
    
}
