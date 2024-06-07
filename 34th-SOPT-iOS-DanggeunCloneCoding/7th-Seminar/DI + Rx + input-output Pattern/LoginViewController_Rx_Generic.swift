//
//  LoginViewController_Rx(Generic).swift
//  34th-SOPT-iOS-DanggeunCloneCoding
//
//  Created by 김민성 on 2024/05/31.
//

import UIKit
import SnapKit

import RxSwift
import RxCocoa

final class LoginViewController_Rx_Generic: UIViewController {
    
    private let rootView = LoginView()
    private let viewModel: LoginViewModel_Rx
    
    private let disposeBag = DisposeBag()
    
    override func loadView() {
        self.view = rootView
    }
    
    init(viewModel: LoginViewModel_Rx) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        self.bindViewModel()
    }
    
    /* viewModel의 결과를 받아 처리하는 코드는 이 bindViewModel 함수 안에서 구현. */
    private func bindViewModel() {
        
        /*
         viewModel의 transform 메서드의 매개변수로 들어갈 Input 타입의 인스턴스를 view controller에서 생성.
         여기서 생성한 Input 타입의 인스턴스를 이용해 output 인스턴스를 구한다. (viewModel의 transform 메서드의 반환값)
         */
        let input = LoginViewModel_Rx.Input.init(
            idTextFieldTextObservable: rootView.idTextField.rx.text.asObservable(),
            passwordTextFieldTextObservable: rootView.passwordTextField.rx.text.asObservable(),
            loginButtonTapObservable: rootView.loginButton.rx.tap.asObservable()
        )// as! T.Input
        
        let output = self.viewModel.transform(from: input, disposeBag: disposeBag)
        
        /*
         Output 인스턴스의 속성들을 구독하는 코드 작성
          -> viewModel 의 output은 viewController에서 동작을 구현
         Input 인스턴스의 속성들은 viewModel 내의 transform 메서드 내에서 이루어짐.
         */
        output.isValid.subscribe(onNext: { _ in
            print(#function)
            self.pushToWelcomeVC()
        }).disposed(by: disposeBag)
        
        output.errMessage.subscribe(onNext: { errMessage in
            self.showToast(errMessage)
        }).disposed(by: disposeBag)
    }
    
    private func pushToWelcomeVC() {
        let welcomeViewController = WelcomeViewController()
        self.navigationController?.pushViewController(welcomeViewController, animated: true)
    }
    
    func showToast(_ message: String, bottomInset: CGFloat = 86) {
        guard let view else { return }
        Toast().show(message: message, view: view, bottomInset: bottomInset)
    }
}


