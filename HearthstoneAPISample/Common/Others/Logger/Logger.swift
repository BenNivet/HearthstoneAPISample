//
//  Logger.swift
//  HearthstoneAPISample
//
//  Created by Benjamin CANTE on 21/04/2019.
//  Copyright © 2019 com.Nivet. All rights reserved.
//

import Foundation

class Logger {
	static let dateFormatter = DateFormatter(withFormat: "yyyy-MM-dd HH:mm:ss.SSSSSSZ", locale: "en_US_POSIX")
	
	public enum LoggerMessageStatus: String {
		case info = "🔅 Info"
		case error = "❌ Error"
		case warning = "⚠️ Warning"
	}
	
	private static func log(_ message: String, status: LoggerMessageStatus, fileName: StaticString = #file, line: UInt = #line) {
		
		let file = String(describing: fileName).components(separatedBy: "/").last ?? String(describing: fileName)
		let dateString = dateFormatter.string(from: Date())
		let processInfo = ProcessInfo()
		
		var threadID: UInt64 = 0
		pthread_threadid_np(nil, &threadID)
		
		let logLine = "\(dateString) \(processInfo.processName)[\(processInfo.processIdentifier):\(threadID)] \(status.rawValue) - \(file)@\(line): \(message)"
		
		print(logLine)
	}
	
	public static func error(_ message: String, fileName: StaticString = #file, line: UInt = #line, crashlyticsError: NSError? = nil) {
        self.log(message, status: .error, fileName: fileName, line: line)
	}
	
	public static func warn(_ message: String, fileName: StaticString = #file, line: UInt = #line) {
		self.log(message, status: .warning, fileName: fileName, line: line)
	}
	
	public static func info(_ message: String, fileName: StaticString = #file, line: UInt = #line) {
		self.log(message, status: .info, fileName: fileName, line: line)
	}
	
}
