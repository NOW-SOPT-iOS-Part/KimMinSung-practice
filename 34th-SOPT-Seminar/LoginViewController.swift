//
//  LoginViewController.swift
//  34th-SOPT-Seminar
//
//  Created by 김민성 on 2024/04/05.
//

import UIKit

class LoginViewController: UIViewController {

    private let titleLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 69, y: 161, width: 236, height: 44))
        label.text = "동네라서 가능한 모든것\n당근에서 가까운 이웃과 함께해요."
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = UIFont.pretendardFont(ofSize: 18, weight: 700) //bold
        label.clipsToBounds = true
        return label
    }()

    private lazy var idTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 276, width: 335, height: 52))
        textField.placeholder = "아이디를 입력해주세요"
        textField.font = UIFont.pretendardFont(ofSize: 18, weight: 600) //semiBold
        textField.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        return textField
    }()

    private lazy var passwordTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 335, width: 335, height: 52))
        textField.placeholder = "비밀번호를 입력해주세요"
        textField.font = UIFont.pretendardFont(ofSize: 14, weight: 600) //semiBold
        textField.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        return textField
    }()

    private lazy var loginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 21, y: 422, width: 332, height: 58))
        button.backgroundColor = UIColor.dangGeunOrange
        button.setTitle("로그인하기", for: UIControl.State.normal)
        button.titleLabel?.font = UIFont.pretendardFont(ofSize: 18, weight: 700) //bold
        button.addTarget(self, action: #selector(loginButtonDidTap), for: UIControl.Event.touchUpInside)
        return button
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.configureHierarchy()
    }


    private func setupUI() {
        self.view.backgroundColor = .systemBackground
    }

    private func configureHierarchy() {
        [titleLabel, idTextField, passwordTextField, loginButton].forEach { self.view.addSubview($0) }
    }



    @objc private func loginButtonDidTap() {
        self.view.endEditing(true)
        //self.presentToWelcomeVC()
        self.pushToWelcomeVC()
    }

    @objc private func keyboardHideButtonTapped() {
        self.view.endEditing(true)
    }


    private func presentToWelcomeVC() {
        let welcomeViewController = WelcomeViewController()
        welcomeViewController.modalPresentationStyle = .formSheet
        welcomeViewController.id = self.idTextField.text
        self.present(welcomeViewController, animated: true)
    }


    private func pushToWelcomeVC() {
        let welcomeViewController = WelcomeViewController()
        welcomeViewController.id = self.idTextField.text
        self.navigationController?.pushViewController(welcomeViewController, animated: true)
    }

}
