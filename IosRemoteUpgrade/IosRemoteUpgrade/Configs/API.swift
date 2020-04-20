//
//  API.swift
//  IosRemoteUpgrade
//
//  Created by xialiang on 2019/5/23.
//  Copyright © 2019 xialiang. All rights reserved.
//

import Foundation
import Moya

enum API {
    // 查询车辆升级任务
    case queryCarUpdateTask(vin: String, uDate: String, taskcarId: String)
    // 确认升级任务
    case confirmUpgrade(taskcarId: String, uDate: String, type: Int, result: Int)
    // 获取历史升级记录
    case getUpdateTaskList(vin: String, pi: Int, ps: Int, uDate: String)
}

extension API: TargetType {
    var baseURL: URL {
        return URL(string: "http://113.57.170.58:62067/api/fota/")!
    }

    var development: URL {
        return URL(string: "http://113.57.170.58:62063/api/fota/")!
    }

    var joint_tune: URL {
        return URL(string: "http://113.57.170.58:62067/api/fota/")!
    }

    var path: String {
        switch self {
        case .queryCarUpdateTask:
            return "s1"
        case .confirmUpgrade:
            return "s2"
        case .getUpdateTaskList:
            return "s3"
        }
    }

    var method: Moya.Method {
        switch self {
        default:
            return .get
        }
    }

    //    这个是做单元测试模拟的数据，必须要实现，只在单元测试文件中有作用
    var sampleData: Data {
        return "".data(using: String.Encoding.utf8)!
    }

    //    该条请API求的方式,把参数之类的传进来
    var task: Task {
        //        return .requestParameters(parameters: nil, encoding: JSONArrayEncoding.default)
        switch self {
        case let .queryCarUpdateTask(vin, uDate, taskcarId):
            return .requestParameters(parameters: ["vin": vin, "uDate": uDate, "taskcarId": taskcarId], encoding: URLEncoding.default)

        case let .confirmUpgrade(taskcarId, uDate, type, result):
            return .requestParameters(parameters: ["taskCarId": taskcarId, "uDate": uDate, "type": type, "result": result], encoding: URLEncoding.default)

        case let .getUpdateTaskList(vin, pi, ps, uDate):
            return .requestParameters(parameters: ["vin": vin, "pi": pi, "ps": ps, "uDate": uDate], encoding: URLEncoding.default)
        }
        // 可选参数https://github.com/Moya/Moya/blob/master/docs_CN/Examples/OptionalParameters.md
        //        case .users(let limit):
        //        var params: [String: Any] = [:]
        //        params["limit"] = limit
        //        return .requestParameters(parameters: params, encoding: URLEncoding.default)
    }

    var headers: [String: String]? {
        return ["Content-Type": "application/x-www-form-urlencoded"]
    }
}
