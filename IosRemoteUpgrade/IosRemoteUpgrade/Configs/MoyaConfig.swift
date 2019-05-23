//
//  MoyaConfig.swift
//  IosRemoteUpgrade
//
//  Created by xialiang on 2019/5/23.
//  Copyright © 2019 xialiang. All rights reserved.
//


import Foundation
/// 定义基础域名
let Moya_baseURL = "http://113.57.170.58:62063/api/fota"

/// 定义返回的JSON数据字段
let RESULT_CODE = "flag"      //状态码

let RESULT_MESSAGE = "message"  //错误消息提示


/*  错误情况的提示
 {
 "flag": "0002",
 "msg": "手机号码不能为空",
 "lockerFlag": true
 }
 **/
