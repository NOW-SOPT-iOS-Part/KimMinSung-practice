//
//  UITextFieldExtensions.swift
//  34th-SOPT-Seminar
//
//  Created by 김민성 on 2024/04/06.
//

import UIKit

extension UITextField {
  func addLeftPadding() {
    let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.frame.height))
    self.leftView = paddingView
    self.leftViewMode = ViewMode.always
  }
}
