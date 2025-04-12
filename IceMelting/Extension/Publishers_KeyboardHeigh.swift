//
//  Publishers_KeyboardHeigh.swift
//  IceMelting
//
//  Created by Wendy Zhou on 13/4/2025.
//

import UIKit
import Combine

extension Publishers {
    static var keyboardHeightPublisher: AnyPublisher<CGFloat, Never> {
        let willShow = NotificationCenter.default.publisher(for: UIApplication.keyboardWillShowNotification)
            .compactMap { notification -> CGFloat? in
                (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect)?.height
            }
        let willHide = NotificationCenter.default.publisher(for: UIApplication.keyboardWillHideNotification)
            .map { _ in CGFloat(0) }
        return willShow.merge(with: willHide)
            .eraseToAnyPublisher()
    }
}
