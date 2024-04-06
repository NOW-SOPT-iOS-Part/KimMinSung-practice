//
//  WelcomeViewController_DelegatePattern.swift
//  34th-SOPT-Seminar
//
//  Created by 김민성 on 2024/04/06.
//

import UIKit


protocol DataBindProtocol: AnyObject {
    func dataBind(id: String?)
}

import UIKit

class WelcomeViewController_Delegate_Pattern: UIViewController {

    private let logoImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 112, y: 87, width: 150, height: 150))
        imageView.image = UIImage(named: "dangGeuni")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private let welcomeLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 140, y: 295, width: 95, height: 60))
        label.text = "??님\n반가워요!"
        label.font = UIFont.pretendardFont(ofSize: 25, weight: 800) //ExtraBold
        label.textAlignment = .center
        label.numberOfLines = 2
        return label
    }()

    private var goHomeButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 426, width: 335, height: 58))
        button.backgroundColor = UIColor(red: 255/255, green: 111/255, blue: 15/255, alpha: 1)
        button.setTitle("메인으로", for: .normal)
        button.setTitleColor(.white, for: UIControl.State.normal)
        button.titleLabel?.font = UIFont.pretendardFont(ofSize: 18, weight: 700) //Bold
        button.layer.cornerRadius = 10
        button.layer.cornerCurve = .continuous
        return button
    }()

    private lazy var backToLoginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 498, width: 335, height: 58))
        button.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        button.setTitle("로그인하기", for: UIControl.State.normal)
        button.setTitleColor(
            UIColor(red: 172/255, green: 176/255, blue: 185/255, alpha: 1),
            for: UIControl.State.normal
        )
        button.titleLabel?.font = UIFont.pretendardFont(ofSize: 18, weight: 700) //Bold
        button.addTarget(self, action: #selector(backToLoginButtonDidTap), for: UIControl.Event.touchUpInside)
        button.layer.cornerRadius = 10
        button.layer.cornerCurve = .continuous
        return button
    }()
    
    weak var delegate: DataBindProtocol?
    
    var id: String? = ""

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        self.setLayout()
        self.bindID()
    }

    private func setLayout() {
        [self.logoImageView, self.welcomeLabel, self.goHomeButton, self.backToLoginButton].forEach {
            self.view.addSubview($0)}
    }

    @objc private func backToLoginButtonDidTap() {
        
        if let id { //if let id = id { 와 동일
            self.delegate?.dataBind(id: id)
        }
        
        if let _ = self.navigationController {
            self.navigationController?.popViewController(animated: true)
        } else {
            self.dismiss(animated: true)
        }
    }
    
    
    private func bindID() {
        //guard let 구문을 이용한 옵셔널 바인딩
        guard let idText = id else { return }
        self.welcomeLabel.text = "\(idText)님\n반가워요!"

        //if let 구문을 이용한 옵셔널 바인딩
        /*
        if let idText = id {
            self.welcomeLabel.text = "\(idText)님\n반가워요!"
        }
         */

        //nil coalescing
        /*
        self.welcomeLabel.text = "\(id ?? "")님\n반가워요!"
         */
    }

}
