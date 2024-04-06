//
//  LonginViewController_Closure.swift
//  34th-SOPT-Seminar
//
//  Created by 김민성 on 2024/04/06.
//

import UIKit

class LoginViewController_Closure: UIViewController {

    private lazy var customInputAccessoryView: UIView = {
        let bar = UIToolbar(frame: CGRect(origin: .zero, size: CGSize(width: 100, height: 100)))
        let hideKeyboardButton = UIBarButtonItem(
            image: UIImage(systemName: "keyboard.chevron.compact.down"),
            style: .plain,
            target: self,
            action: #selector(keyboardHideButtonTapped)
        )
        hideKeyboardButton.tintColor = UIColor.dangGeunOrange
        let flexibleBarButton = UIBarButtonItem(systemItem: UIBarButtonItem.SystemItem.flexibleSpace)
        bar.items = [flexibleBarButton, hideKeyboardButton]
        bar.sizeToFit()
        return bar
    }()

    private let titleLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 69, y: 161, width: 236, height: 44))
        label.text = "동네라서 가능한 모든것\n당근에서 가까운 이웃과 함께해요."
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = UIFont.pretendardFont(ofSize: 18, weight: 700) //Bold
        label.clipsToBounds = true
        return label
    }()

    private lazy var idTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 276, width: 335, height: 52))
        textField.placeholder = "아이디를 입력해주세요"
        textField.font = UIFont.pretendardFont(ofSize: 18, weight: 600) //SemiBold
        textField.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        textField.borderStyle = .roundedRect
        textField.inputAccessoryView = self.customInputAccessoryView
        return textField
    }()

    private lazy var passwordTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 335, width: 335, height: 52))
        textField.placeholder = "비밀번호를 입력해주세요"
        textField.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.semibold) //SemiBold
        textField.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        textField.borderStyle = .roundedRect
        textField.inputAccessoryView = self.customInputAccessoryView
        return textField
    }()

    private lazy var loginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 21, y: 422, width: 332, height: 58))
        //button.backgroundColor = UIColor(red: 255/255, green: 111/255, blue: 15/255, alpha: 1)
        button.backgroundColor = UIColor.dangGeunOrange
        button.setTitle("로그인하기", for: UIControl.State.normal)
        button.titleLabel?.font = UIFont.pretendardFont(ofSize: 18, weight: 700) //Bold
        button.addTarget(self, action: #selector(loginButtonDidTap), for: UIControl.Event.touchUpInside)
        button.layer.cornerRadius = 10
        button.layer.cornerCurve = .continuous
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
        let welcomeViewController_closure = WelcomeViewController_Closure()
        
        welcomeViewController_closure.completionHandler = { [weak self] id in
            guard let self else { return }
            self.idTextField.text = "\(id)에서 어떤걸로 할꺼얌?"
        }
        welcomeViewController_closure.modalPresentationStyle = .formSheet
        welcomeViewController_closure.id = self.idTextField.text
        self.present(welcomeViewController_closure, animated: true)
    }
    
    
    private func pushToWelcomeVC() {
        let welcomeViewController_closure = WelcomeViewController_Closure()
        
        welcomeViewController_closure.completionHandler = { [weak self] id in
            guard let self else { return }
            self.idTextField.text = "\(id)에서 어떤걸로 할꺼얌?"
        }
        
        welcomeViewController_closure.id = self.idTextField.text
        self.navigationController?.pushViewController(welcomeViewController_closure, animated: true)
    }
    
}
