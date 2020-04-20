//
//  UpdateVehicleTaskModel.swift
//  IosRemoteUpgrade
//
//  Created by xialiang on 2019/5/23.
//  Copyright © 2019 xialiang. All rights reserved.
//

import Foundation
import HandyJSON

public class UpdateVehicleTaskModel: HandyJSON {
    public var total: Int!
    public var code: Int!
    public var msg: String!
    public var result: Array<ResultMode>!

    public required init() {
    }

    public func gettotal() -> Int {
        return total
    }
}

public class ResultMode: HandyJSON {
    public var index: Int!
    public var taskCarId: String!
    public var status: Int!
    public var description: String!
    public var upgradeDate: String!

    public required init() {
    }
}
