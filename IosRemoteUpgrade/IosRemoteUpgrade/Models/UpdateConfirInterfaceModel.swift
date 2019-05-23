//
//  UpdateConfirInterfaceModel.swift
//  IosRemoteUpgrade
//
//  Created by xialiang on 2019/5/23.
//  Copyright © 2019 xialiang. All rights reserved.
//

import Foundation
import HandyJSON

public class UpdateConfirInterfaceModel: HandyJSON {
    public  var result:NSObject!
    public  var total:Int!
    public var code:Int!
    public var msg:String!
    public  required init() {
        
    }
    
}
