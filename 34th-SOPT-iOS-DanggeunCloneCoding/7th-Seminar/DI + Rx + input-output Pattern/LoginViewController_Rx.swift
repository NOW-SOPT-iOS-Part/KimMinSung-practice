//
//  LoginViewController_Rx.swift
//  34th-SOPT-iOS-DanggeunCloneCoding
//
//  Created by 김민성 on 2024/05/25.
//

import UIKit
import SnapKit

import RxSwift
import RxCocoa

final class LoginViewController_Rx: UIViewController {
    
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
         이 코드 안적으면 아래에서 에러뜨면서 차라리 제네릭 타입을 쓰라고 경고를 준다.
         그래서 에러를 지우려고 일단 bindViewModel 안에서 강제 타입캐스팅하긴 했는데
         이러면 의존성 주입한 의미가 없는 것 같아보임... -> 차라리 제네릭을 써 보자!
         */
        let viewModel = self.viewModel //as! LoginViewModel_Rx
        
        /*
         viewModel의 transform 메서드의 매개변수로 들어갈 Input 타입의 인스턴스를 view controller에서 생성.
         여기서 생성한 Input 타입의 인스턴스를 이용해 output 인스턴스를 구한다. (viewModel의 transform 메서드의 반환값)
         */
        let input = LoginViewModel_Rx.Input.init(
            idTextFieldTextObservable: rootView.idTextField.rx.text.asObservable(),
            passwordTextFieldTextObservable: rootView.passwordTextField.rx.text.asObservable(),
            loginButtonTapObservable: rootView.loginButton.rx.tap.asObservable()
        )
        
        /* 앞서 구한 Input 인스턴스를 이용해 Output 인스턴스를 구하기 */
        /*
         위의 viewModel에서 타입캐스팅을 하지 않으면 아래 코드에서 에러가 난다.
         대충 'any ViewModelType' 타입인 값( == viewModel)의 멤버 'transform' 메서드를 사용할 수 없다는 이야기인데,
         이는 
         */
        let output = viewModel.transform(from: input, disposeBag: disposeBag)
        
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


