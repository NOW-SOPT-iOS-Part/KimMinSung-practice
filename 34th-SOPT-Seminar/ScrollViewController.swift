//
//  ScrollViewController.swift
//  34th-SOPT-Seminar
//
//  Created by 김민성 on 2024/04/06.
//

import UIKit

class ScrollViewController: UIViewController {
    
    private let scrollView = UIScrollView()
    private var contentView = UIView()
    
    private let redView: UIView = {
        let view = UIView()
        //view.backgroundColor = UIColor(red: 235, green: 8, blue: 8, alpha: 1)
        view.backgroundColor = .systemRed
        return view
    }()
    
    private let orangeView: UIView = {
       let view  = UIView()
        //view.backgroundColor = UIColor(red: 255, green: 126, blue: 54, alpha: 1)
        view.backgroundColor = .systemOrange
        return view
    }()
    
    private let yellowView: UIView = {
       let view  = UIView()
        //view.backgroundColor = UIColor(red: 255, green: 255, blue: 0, alpha: 1)
        view.backgroundColor = .systemYellow
        return view
    }()
    
    private let greenView: UIView = {
       let view  = UIView()
//        view.backgroundColor = UIColor(red: 0, green: 128, blue: 0, alpha: 1)
        view.backgroundColor = .systemGreen
        return view
    }()
    
    private let blueView: UIView = {
       let view  = UIView()
//        view.backgroundColor = UIColor(red: 0, green: 0, blue: 255, alpha: 1)
        view.backgroundColor = .systemBlue
        return view
    }()
    
    private let purpleView: UIView = {
       let view  = UIView()
//        view.backgroundColor = UIColor(red: 128, green: 0, blue: 128, alpha: 1)
        view.backgroundColor = .systemPurple
        return view
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.scrollView.isScrollEnabled = true
        self.configureHierarchy()
        self.setLayout()
    }
    
    private func configureHierarchy() {
        self.view.addSubview(scrollView)
        self.scrollView.addSubview(contentView)
        
        [redView, orangeView, yellowView, greenView, blueView, purpleView].forEach { view in
            view.translatesAutoresizingMaskIntoConstraints = false
            self.contentView.addSubview(view)
        }
    }
    
    private func setLayout() {
        self.scrollView.snp.makeConstraints { scrollView in
            scrollView.edges.equalToSuperview()
        }
        
        self.contentView.snp.makeConstraints { contentView in
            contentView.edges.equalTo(self.scrollView)
            contentView.width.equalTo(self.scrollView)
            contentView.height.greaterThanOrEqualToSuperview().priority(.low)
        }
        
        self.redView.snp.makeConstraints { view in
            //view.top.leading.equalToSuperview()
            view.top.equalToSuperview()
            view.leading.equalToSuperview()
            view.width.equalTo(UIScreen.main.bounds.width / 2)
            view.height.equalTo(337)
        }
        
        self.orangeView.snp.makeConstraints { view in
            //view.top.trailing.equalToSuperview()
            view.top.equalToSuperview()
            view.trailing.equalToSuperview()
            view.width.equalTo(UIScreen.main.bounds.width / 2)
            view.height.equalTo(337)
        }
        
        self.yellowView.snp.makeConstraints { view in
            view.leading.equalToSuperview()
            view.top.equalTo(self.redView.snp.bottom)
            view.width.equalTo(UIScreen.main.bounds.width / 2)
            view.height.equalTo(337)
        }
        
        self.greenView.snp.makeConstraints { view in
            view.trailing.equalToSuperview()
            view.top.equalTo(self.orangeView.snp.bottom)
            view.width.equalTo(UIScreen.main.bounds.width / 2)
            view.height.equalTo(337)
        }
        
        self.blueView.snp.makeConstraints { view in
            view.leading.equalToSuperview()
            view.top.equalTo(self.yellowView.snp.bottom)
            view.width.equalTo(UIScreen.main.bounds.width / 2)
            view.height.equalTo(337)
            view.bottom.equalToSuperview()
        }
        
        self.purpleView.snp.makeConstraints { view in
            view.trailing.equalToSuperview()
            view.top.equalTo(self.greenView.snp.bottom)
            view.width.equalTo(UIScreen.main.bounds.width / 2)
            view.height.equalTo(337)
            view.bottom.equalToSuperview()
        }
        
        
    }
    
    
}
