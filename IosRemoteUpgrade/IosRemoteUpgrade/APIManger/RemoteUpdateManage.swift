//
//  RemoteUpdateManage.swift
//  IosRemoteUpgrade
//
//  Created by xialiang on 2019/5/23.
//  Copyright © 2019 xialiang. All rights reserved.
//

import HandyJSON
import UIKit

open class RemoteUpdateManage: NSObject {
    var timer = Timer()
    var taskcarId: String = ""
    var isNewTask: Int = 0
    var status: Int = -1
    var isTimer = 0

    public func configEnvironment(configs: Config) {
        config = configs
    }

    /// 获取历史升级任务列表
    ///
    /// - Parameters:
    ///   - vin: 车辆vin
    ///   - pi: 页面索引
    ///   - ps: 页面大小
    ///   - uDate: 日期时间
    public func getUpdateTaskList(vin: String, pi: Int, ps: Int, uDate: String, success: @escaping (UpdateVehicleTaskModel) -> Void, failed: @escaping (String) -> Void) {
        NetWorkRequest(.getUpdateTaskList(vin: vin, pi: pi, ps: ps, uDate: uDate), completion: { (jsonString) -> Void in
            if let mappedObject = JSONDeserializer<BaseResponse<UpdateVehicleTaskModel>>.deserializeFrom(json: jsonString) {
                switch mappedObject.statusCode {
                case SUCCESS:
                    // 从字符串转换为对象实例
                    success(mappedObject.body)
                    break
                case ERRO_NOT_FOUNT:
                    failed(ERRO_NOT_FOUNT_MESSAGE)
                    break
                case ERRO_SERVER:
                    failed(ERRO_SERVER_MESSAGE)

                    break
                case ERRO_UPTATE:
                    failed(ERRO_UPTATE_MESSAGE)

                    break
                default:
                    failed(ERRO_NOT_MESSAGE)
                    break
                }
            }
        }, failed: { (failedCallback) -> Void in
            failed(failedCallback)
        })
    }

    /// 查询当前车辆升级任务
    ///
    /// - Parameters:
    ///   - vin: 车辆vin
    ///   - uDate: 日期时间
    ///   - taskcarId: 车辆升级任务id
    public func queryCarUpdateTask(vin: String, uDate: String, success: @escaping (CurrentVehicleTaskModel) -> Void, failed: @escaping (String) -> Void) {
        if #available(iOS 10.0, *) {
            if isTimer == 0 {
                timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: true, block: { (_) -> Void in
                    if self.isNewTask == 0 {
                        self.taskcarId = ""
                    } else {
                        if self.status == 11 {
                            self.taskcarId = ""
                        }
                    }
                    NetWorkRequest(.queryCarUpdateTask(vin: vin, uDate: uDate, taskcarId: self.taskcarId), completion: { (jsonString) -> Void in
                        if let mappedObject = JSONDeserializer<BaseResponse<CurrentVehicleTaskModel>>.deserializeFrom(json: jsonString) {
                            switch mappedObject.statusCode {
                            case SUCCESS:
                                if mappedObject.body.result.taskCarId != nil {
                                    self.taskcarId = mappedObject.body.result.taskCarId
                                    self.isNewTask = mappedObject.body.result.isNewTask
                                    self.status = mappedObject.body.result.status
                                }
                                // 从字符串转换为对象实例
                                success(mappedObject.body)
                                break
                            case ERRO_NOT_FOUNT:
                                failed(ERRO_NOT_FOUNT_MESSAGE)
                                break
                            case ERRO_SERVER:
                                failed(ERRO_SERVER_MESSAGE)

                                break
                            case ERRO_UPTATE:
                                failed(ERRO_UPTATE_MESSAGE)

                                break
                            default:
                                failed(ERRO_NOT_MESSAGE)
                                break
                            }
                        }
                    }, failed: { (failedCallback) -> Void in
                        failed(failedCallback)

                    })

                })
                isTimer = 1
            }
        } else {
            print("版本过低")
        }
    }

    /// 确认升级任务
    ///
    /// - Parameters:
    ///   - taskcarId: 车辆升级任务id
    ///   - uDate: 日期时间
    ///   - type: 确认类型
    ///   - result: 确认结果
    public func confirmUpdate(taskcarId: String, uDate: String, type: Int, result: Int, success: @escaping (UpdateConfirInterfaceModel) -> Void, failed: @escaping (String) -> Void) {
        NetWorkRequest(.confirmUpgrade(taskcarId: taskcarId, uDate: uDate, type: type, result: result), completion: { (jsonString) -> Void in
            if let mappedObject = JSONDeserializer<BaseResponse<UpdateConfirInterfaceModel>>.deserializeFrom(json: jsonString) {
                switch mappedObject.statusCode {
                case SUCCESS:
                    // 从字符串转换为对象实例
                    success(mappedObject.body)
                    break
                case ERRO_NOT_FOUNT:
                    failed(ERRO_NOT_FOUNT_MESSAGE)
                    break
                case ERRO_SERVER:
                    failed(ERRO_SERVER_MESSAGE)

                    break
                case ERRO_UPTATE:
                    failed(ERRO_UPTATE_MESSAGE)

                    break
                default:
                    failed(ERRO_NOT_MESSAGE)
                    break
                }
            }

        }, failed: { (failedCallback) -> Void in
            failed(failedCallback)
        })
    }

    /// 清除定时任务
    public func clearTask() {
        if isTimer == 1 {
            timer.invalidate()
            isTimer = 0
        }
    }
}
