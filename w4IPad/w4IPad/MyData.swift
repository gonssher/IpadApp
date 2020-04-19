//
//  MyData.swift
//  w4IPad
//
//  Created by Sherwin on 2020-01-29.
//  Copyright © 2020 Sherwin. All rights reserved.
//

import UIKit

class MyData: NSObject {

    var name : String = ""
    var email : String = ""
    
    func inWithData(theName n : String , theEmail e : String)
    {
        name = n
        email = e
        
    }

}
