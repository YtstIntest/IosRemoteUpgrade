//
//  CurrentVehicleTaskModel.swift
//  IosRemoteUpgrade
//
//  Created by xialiang on 2019/5/23.
//  Copyright © 2019 xialiang. All rights reserved.
//

import Foundation
import HandyJSON

public class CurrentVehicleTaskModel: HandyJSON {
    public var result: ResulCurrenttModel!
    public var total: Int!
    public var code: Int!
    public var msg: String!
    public required init() {
    }
}

public class ResulCurrenttModel: HandyJSON {
    public var taskCarId: String!
    public var taskType: Int!
    public var cVer: String!
    public var nVer: String!
    public var size: Int!
    public var description: String!
    public var duration: Int!
    public var status: Int!
    public var progress: Int!
    public var resultCode: Int!
    public var result: Int!
    public var isNewTask: Int!
    public var time: String!

    public required init() {
    }
}
