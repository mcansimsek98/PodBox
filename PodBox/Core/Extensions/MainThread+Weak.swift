//
//  MainThread+Weak.swift
//  PodBox
//
//  Created by Mehmet Can Şimşek on 9.11.2024.
//

import Foundation

protocol MainThreadRunner: AnyObject {
    /// Executes a block on the main thread without additional safety for deallocated views
    func runOnMain(_ block: @escaping () -> Void)
    
    /// Executes a block on the main thread without additional safety for deallocated views
    func runOnMain(with delay: CGFloat, _ block: @escaping () -> Void)
    
    /// Executes a block on the main thread with additional safety in case the view is deallocated
//    func runOnMainSafety(_ block: @escaping () -> Void)
}

extension MainThreadRunner {
    func runOnMain(_ block: @escaping () -> Void) {
        guard Thread.isMainThread else {
            DispatchQueue.main.async {
                block()
            }
            return
        }
        block()
    }
    
    func runOnMain(with delay: CGFloat, _ block: @escaping () -> Void) {
        guard Thread.isMainThread else {
            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                block()
            }
            return
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            block()
        }
    }
}
