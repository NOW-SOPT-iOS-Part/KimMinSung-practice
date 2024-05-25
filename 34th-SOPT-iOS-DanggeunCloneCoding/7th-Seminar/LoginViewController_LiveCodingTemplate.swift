//
//  LoginViewController_LiveCodingTemplate.swift
//  34th-SOPT-iOS-DanggeunCloneCoding
//
//  Created by 김민성 on 2024/05/25.
//

import UIKit
import SnapKit

import RxSwift

final class LoginViewController_LiveCoding: UIViewController {
    
    private let rootView = LoginView()
    
    override func loadView() {
        self.view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        bindViewModel()
    }
    
    
    private func bindViewModel() {
    }
    
    private func pushToWelcomeVC() {
        let welcomeViewController = WelcomeViewController()
        self.navigationController?.pushViewController(welcomeViewController, animated: true)
    }
    
    func showToast(_ message: String,
                   bottomInset: CGFloat = 86
    ) {
        guard let view else { return }
        Toast().show(message: message,
                     view: view,
                     bottomInset: bottomInset
        )
    }
}


