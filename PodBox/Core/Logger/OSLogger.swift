//
//  OSLogger.swift
//  PodBox
//
//  Created by Mehmet Can Şimşek on 6.11.2024.
//

import Foundation
import os.log

public class OSLogger {
    static let shared = OSLogger()
    
    private let logger: OSLog
    
    init() {
        logger = OSLog(subsystem: "com.can.PodBox", category: "AppContainer")
    }
    
    func addLog(_ message: String) {
        os_log(.error, log: logger, "\(message)")
    }
    
    func addLog(_ type: OSLogType = .error, _ message: String) {
        os_log(type, log: logger, "\(message)")
    }
}
