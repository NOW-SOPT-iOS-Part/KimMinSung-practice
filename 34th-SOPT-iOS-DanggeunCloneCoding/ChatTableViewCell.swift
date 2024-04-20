//
//  ChatTableViewCell.swift
//  34th-SOPT-iOS-DanggeunCloneCoding
//
//  Created by 김민성 on 2024/04/20.
//

import UIKit
import SnapKit

class ChatTableViewCell: UITableViewCell {
    
    private let profileImageView = UIImageView()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.pretendardFont(ofSize: 15, weight: 700)
        return label
    }()
    
    private let placeLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 156/256, green: 156/256, blue: 156/256, alpha: 1)
        label.textAlignment = .left
        label.font = UIFont.pretendardFont(ofSize: 12, weight: 400)
        return label
    }()
    
    private let chatLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.pretendardFont(ofSize: 14, weight: 400)
        return label
    }()
    
    private let itemImageView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setViewHierarchy() {
        [profileImageView, nameLabel, placeLabel, chatLabel, itemImageView].forEach { view in
            self.contentView.addSubview(view)
        }
    }
    
    private func setLayout() {
        self.profileImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.size.equalTo(40)
        }
        
        self.nameLabel.snp.makeConstraints { make in
            make.leading.equalTo(self.profileImageView.snp.trailing).offset(16)
            make.top.equalToSuperview().offset(16.5)
        }
        
        self.placeLabel.snp.makeConstraints { make in
            make.leading.equalTo(self.nameLabel.snp.trailing).offset(4)
            make.top.equalTo(self.nameLabel).offset(2)
        }
        
        self.chatLabel.snp.makeConstraints { make in
            make.top.equalTo(self.placeLabel.snp.bottom).offset(4)
            make.leading.equalTo(self.nameLabel)
        }
        
        self.itemImageView.snp.makeConstraints { make in
            make.trailing.bottom.equalToSuperview().inset(16)
            make.size.equalTo(40)
        }
    }
    
    
}
