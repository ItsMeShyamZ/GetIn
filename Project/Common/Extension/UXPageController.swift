//
//  UXPageController.swift
//  Smart Quarks
//
//  Created by AppleMac on 01/07/20.
//  Copyright © 2020 css. All rights reserved.
//

import Foundation
import UIKit

extension UIPageViewController {
    var isPagingEnabled: Bool {
        get {
            var isEnabled: Bool = true
            for view in view.subviews {
                if let subView = view as? UIScrollView {
                    isEnabled = subView.isScrollEnabled
                }
            }
            return isEnabled
        }
        set {
            for view in view.subviews {
                if let subView = view as? UIScrollView {
                    subView.isScrollEnabled = newValue
                }
            }
        }
    }
}
