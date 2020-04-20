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
let RESULT_CODE = "flag" // 状态码

let RESULT_MESSAGE = "message" // 错误消息提示

let SUCCESS = 200

let ERRO_NOT_FOUNT = 404
let ERRO_NOT_FOUNT_MESSAGE = "未找到请求路由，多用于下载文件时，文件不存在或文件不能被下载"

let ERRO_SERVER = 500
let ERRO_SERVER_MESSAGE = "服务端错误"

let ERRO_UPTATE = 206
let ERRO_UPTATE_MESSAGE = "下载部分文件时，成功响应"

let ERRO_NOT_MESSAGE = "未知错误"
