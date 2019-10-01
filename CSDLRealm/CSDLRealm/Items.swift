//
//  DBManager.swift
//  CSDLRealm
//
//  Created by Boss on 9/30/19.
//  Copyright © 2019 LuyệnĐào. All rights reserved.
//

import Foundation
import RealmSwift

class RoleUser: Object{
    @objc dynamic var ID: Int = 0
    @objc dynamic var textNote:String = ""
    
    
    // đánh dấu thuộc tính id là khoá chính
    override static func primaryKey() -> String{
        // Id là khoá chính
        return "ID"
    }
}

