//
//  LoginViewController.swift
//  34th-SOPT-iOS-DanggeunCloneCoding
//
//  Created by 김민성 on 2024/04/19.
//

import UIKit
import SnapKit


class LoginViewController: UIViewController {
    
    private let rootView = LoginView()
    
    override func loadView() {
        self.view = self.rootView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setButtonsAction()
    }
    
    private func setButtonsAction() {
        self.rootView.loginButton.addTarget(self, action: #selector(loginButtonDidTap), for: UIControl.Event.touchUpInside)
    }
    
    
    @objc private func loginButtonDidTap() {
        self.view.endEditing(true)
        //self.presentToWelcomeVC()
        self.pushToWelcomeVC()
    }


    private func presentToWelcomeVC() {
        let welcomeViewController = WelcomeViewController()
        welcomeViewController.modalPresentationStyle = .formSheet
        //welcomeViewController.id = self.idTextField.text
        welcomeViewController.id = self.rootView.idTextField.text
        self.present(welcomeViewController, animated: true)
    }


    private func pushToWelcomeVC() {
        let welcomeViewController = WelcomeViewController()
        welcomeViewController.id = self.rootView.idTextField.text
        self.navigationController?.pushViewController(welcomeViewController, animated: true)
    }
    

}
