//
//  ChatViewController.swift
//  34th-SOPT-iOS-DanggeunCloneCoding
//
//  Created by 김민성 on 2024/04/20.
//

import UIKit

class ChatViewController: UIViewController {
    
    //private let tableView = UITableView(frame: .zero, style: UITableView.Style.plain)
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(ChatTableViewCell.self, forCellReuseIdentifier: ChatTableViewCell.reuseIdentifier)
        return tableView
    }()
    
    private let chatList = ChatModel.dummy()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.tableView.backgroundColor = .dangGeunOrange
        self.setViewHierarchy()
        self.setLayout()
        
        self.setDelegate()
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
