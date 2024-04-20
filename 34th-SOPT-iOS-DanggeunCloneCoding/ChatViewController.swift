//
//  ChatViewController.swift
//  34th-SOPT-iOS-DanggeunCloneCoding
//
//  Created by 김민성 on 2024/04/20.
//

import UIKit

class ChatViewController: UIViewController {
    
    private let tableView = UITableView(frame: .zero, style: UITableView.Style.plain)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.backgroundColor = .dangGeunOrange
        self.setViewHierarchy()
        self.setLayout()
    }
    
    private func setViewHierarchy() {
        self.view.addSubview(self.tableView)
    }
    
    private func setLayout() {
        self.tableView.snp.makeConstraints { view in
            view.edges.equalToSuperview()
        }
    }
    
    
}
