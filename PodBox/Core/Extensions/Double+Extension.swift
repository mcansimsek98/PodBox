//
//  Double+Extension.swift
//  PodBox
//
//  Created by Mehmet Can Şimşek on 9.11.2024.
//

import Foundation

extension Double {
    /// Converts a Double representing time in seconds into a formatted time string (HH:MM:SS)
    ///
    /// Returns:  "HH:mm:ss"
    func timeString() -> String {
        let seconds = Int(self.truncatingRemainder(dividingBy: 60))
        let minutes = seconds / 60
        let hours = minutes / 60
        
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
}
