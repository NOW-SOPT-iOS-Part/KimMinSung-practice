//
//  ChatTableViewCell.swift
//  34th-SOPT-iOS-DanggeunCloneCoding
//
//  Created by 김민성 on 2024/04/20.
//

import UIKit
import SnapKit

final class ChatTableViewCell: UITableViewCell {
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
    
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20
        return imageView
    }()
    
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
        
        self.setViewHierarchy()
        self.setLayout()
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
        self.profileImageView.snp.makeConstraints { view in
            view.top.equalToSuperview().offset(16)
            view.leading.equalToSuperview().offset(16)
            view.bottom.equalToSuperview().offset(-16)
            view.size.equalTo(40)
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
    
    
    //더미데이터 만들기용...후에 삭제 예정
    func makeDummyData() {
        self.profileImageView.image = UIImage(systemName: "person.circle")
        self.nameLabel.text = "김민성"
        self.placeLabel.text = "추계예때"
        self.chatLabel.text = "안녕! 나 98년생 민성!"
        self.itemImageView.image = UIImage(systemName: "shippingbox")
    }
    
}
