//
//  BaseResponse.swift
//  IosRemoteUpgrade
//
//  Created by xialiang on 2019/5/23.
//  Copyright © 2019 xialiang. All rights reserved.
//


import Foundation
import HandyJSON

// 假设这是服务端返回的统一定义的response格式
class BaseResponse<T:HandyJSON>: HandyJSON {
    var statusCode: Int! // 服务端返回码
    var body: T! // 具体的data的格式和业务相关，故用泛型定义
    
    required init() {}
    
}
