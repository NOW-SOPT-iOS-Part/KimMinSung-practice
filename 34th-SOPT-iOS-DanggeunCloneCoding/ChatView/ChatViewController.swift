//
//  ChatViewController.swift
//  34th-SOPT-iOS-DanggeunCloneCoding
//
//  Created by 김민성 on 2024/04/20.
//

import UIKit

class ChatViewController: UIViewController {
    
    
    private let chatList = ChatModel.dummy()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(ChatTableViewCell.self, forCellReuseIdentifier: ChatTableViewCell.reuseIdentifier)
        return tableView
    }()
    
    lazy var alarmBarButtonItem: UIBarButtonItem = {
        let barButtonItem = UIBarButtonItem(
            image: .icAlarm,
            style: UIBarButtonItem.Style.plain,
            target: self,
            action: #selector(barButtonItemDidTapped)
        )
        barButtonItem.tag = 0
        return barButtonItem
    }()
    
    lazy var scanQRBarButtonItem: UIBarButtonItem = {
        let barButtonItem = UIBarButtonItem(
            image: .vector,
            style: UIBarButtonItem.Style.plain,
            target: self,
            action: #selector(barButtonItemDidTapped)
        )
        barButtonItem.tag = 1
        return barButtonItem
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setViewHierarchy()
        self.setLayout()
        self.setDelegate()
        self.setNaviBarButtons()
    }
    
    private func setViewHierarchy() {
        self.view.addSubview(self.tableView)
    }
    
    private func setLayout() {
        self.tableView.snp.makeConstraints { view in
            view.edges.equalToSuperview()
        }
    }
    
    private func setDelegate() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    private func setNaviBarButtons() {
        self.navigationItem.rightBarButtonItems = [self.alarmBarButtonItem, self.scanQRBarButtonItem ]
    }
    
    @objc private func barButtonItemDidTapped(sender: UIBarButtonItem) {
        switch sender.tag {
        case 0:
            print("alarmBarButtonDidTapped")
        case 1:
            print("scanQRBarButtonDidTapped")
        default:
            return
        }
    }
}


extension ChatViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.chatList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: ChatTableViewCell.reuseIdentifier,
            for: indexPath
        ) as? ChatTableViewCell else { return UITableViewCell() }
        cell.dataBind(self.chatList[indexPath.row])
        return cell
    }
    
}

extension ChatViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let itemViewController = ItemViewController()
        self.navigationController?.pushViewController(itemViewController, animated: true)
    }
    
}
