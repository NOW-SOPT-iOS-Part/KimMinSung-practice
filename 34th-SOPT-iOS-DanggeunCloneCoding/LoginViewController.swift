//
//  LoginViewController.swift
//  34th-SOPT-iOS-DanggeunCloneCoding
//
//  Created by 김민성 on 2024/04/19.
//

import UIKit
import SnapKit


class LoginViewController: UIViewController {

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
        let label = UILabel()
        label.text = "동네라서 가능한 모든것\n당근에서 가까운 이웃과 함께해요."
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = UIFont.pretendardFont(ofSize: 18, weight: 700) //bold
        label.clipsToBounds = true
        return label
    }()

    private lazy var idTextField: UITextField = {
        let tf = UITextField()
        tf.addLeftPadding()
        tf.placeholder = "아이디를 입력해주세요"
        tf.font = UIFont.pretendardFont(ofSize: 18, weight: 600) //SemiBold
        tf.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        tf.borderStyle = .none
        tf.layer.cornerRadius = 8
        tf.layer.cornerCurve = .continuous
        tf.inputAccessoryView = self.customInputAccessoryView
        return tf
    }()

    private lazy var passwordTextField: UITextField = {
        let tf = UITextField()
        tf.addLeftPadding()
        tf.placeholder = "비밀번호를 입력해주세요"
        tf.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.semibold) //SemiBold
        tf.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        tf.borderStyle = .none
        tf.layer.cornerRadius = 8
        tf.layer.cornerCurve = .continuous
        tf.inputAccessoryView = self.customInputAccessoryView

        return tf
    }()

    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.dangGeunOrange
        button.setTitle("로그인하기", for: UIControl.State.normal)
        button.titleLabel?.font = UIFont.pretendardFont(ofSize: 18, weight: 700) //bold
        button.addTarget(self, action: #selector(loginButtonDidTap), for: UIControl.Event.touchUpInside)
        button.clipsToBounds = true
        button.layer.cornerRadius = 13
        button.layer.cornerCurve = .continuous
        return button
    }()
    
    private lazy var signUpButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.dangGeunOrange
        button.setTitle("회원가입하기", for: UIControl.State.normal)
        button.titleLabel?.font = UIFont.pretendardFont(ofSize: 18, weight: 700) //bold
        button.addTarget(self, action: #selector(signUpButtonDidTap), for: UIControl.Event.touchUpInside)
        button.clipsToBounds = true
        button.layer.cornerRadius = 13
        button.layer.cornerCurve = .continuous
        return button
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.configureHierarchy()
        self.setLayout()
    }


    private func setupUI() {
        self.view.backgroundColor = .systemBackground
    }

    private func configureHierarchy() {
        [titleLabel, idTextField, passwordTextField, loginButton, signUpButton].forEach { self.view.addSubview($0) }
    }
    
    
    private func setLayout() {
        [self.titleLabel, self.idTextField, self.passwordTextField, self.loginButton].forEach { view in
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        self.titleLabel.snp.makeConstraints { label in
            label.centerX.equalToSuperview()
            label.top.equalToSuperview().offset(161)
        }
        
        self.idTextField.snp.makeConstraints { tf in
            tf.centerX.equalToSuperview()
            tf.top.equalTo(self.titleLabel.snp.bottom).offset(71)
            tf.width.equalTo(335)
            tf.height.equalTo(53)
        }
        
        self.passwordTextField.snp.makeConstraints { tf in
            tf.centerX.equalToSuperview()
            tf.top.equalTo(self.idTextField.snp.bottom).offset(7)
            tf.width.equalTo(335)
            tf.height.equalTo(53)
        }
        
        self.loginButton.snp.makeConstraints { btn in
            btn.centerX.equalToSuperview()
            btn.top.equalTo(self.passwordTextField.snp.bottom).offset(75)
            btn.width.equalTo(335)
            btn.height.equalTo(58)
        }
        
        self.signUpButton.snp.makeConstraints { btn in
            btn.centerX.equalToSuperview()
            btn.top.equalTo(self.loginButton.snp.bottom).offset(30)
            btn.width.equalTo(335)
            btn.height.equalTo(58)
        }
        /*
        NSLayoutConstraint.activate(
            
            [self.titleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
             self.titleLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 161),
             self.titleLabel.widthAnchor.constraint(equalToConstant: 236),
             self.titleLabel.heightAnchor.constraint(equalToConstant: 44),
            
             self.idTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
             self.idTextField.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 71),
             self.idTextField.widthAnchor.constraint(equalToConstant: 335),
             self.idTextField.heightAnchor.constraint(equalToConstant: 53),
             
             self.passwordTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
             self.passwordTextField.topAnchor.constraint(equalTo: self.idTextField.bottomAnchor, constant: 7),
             self.passwordTextField.widthAnchor.constraint(equalToConstant: 335),
             self.passwordTextField.heightAnchor.constraint(equalToConstant: 53),
             
             
             self.loginButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
             self.loginButton.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: 75),
             self.loginButton.widthAnchor.constraint(equalToConstant: 335),
             self.loginButton.heightAnchor.constraint(equalToConstant: 58)
             ]
        )
         */
    }
    
    @objc private func loginButtonDidTap() {
        self.view.endEditing(true)
        
        /*
         서버에 회원정보 있는지 요청하는 기능을 구현할 경우, 여기에서 코드 작성 후, 예외처리
         */
        
        //self.presentToWelcomeVC()
        self.pushToWelcomeVC()
    }
    
    @objc private func signUpButtonDidTap() {
        self.view.endEditing(true)
        self.pushToSignUpVC()
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
    
    private func pushToSignUpVC() {
        let signUpVC = SignUpViewController()
        self.navigationController?.pushViewController(signUpVC, animated: true)
    }

}
