//
//  ItemCollectionViewCell.swift
//  34th-SOPT-iOS-DanggeunCloneCoding
//
//  Created by 김민성 on 2024/04/20.
//

import UIKit
import SnapKit

protocol ItemCollectionViewCellDelegate: AnyObject {
    func heartButtonDidTapEvent(state: Bool, row: Int)
}

final class ItemCollectionViewCell: UICollectionViewCell {
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
    var itemRow: Int?
    
    weak var delegate: ItemCollectionViewCellDelegate?
    
    private let itemImageView = UIImageView()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.pretendardFont(ofSize: 16, weight: 400)
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .orange
        label.textAlignment = .left
        label.font = UIFont.pretendardFont(ofSize: 15, weight: 700)
        return label
    }()
    
    private lazy var heartButton: UIButton = {
        let button = UIButton()
        button.setImage(.love, for: .normal)
        button.setImage(UIImage(systemName: "heart.fill"), for: UIControl.State.selected)
        button.addTarget(self, action: #selector(heartButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        self.setViewHierarchy()
        self.setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.heartButton.isSelected = false
    }
    
    
    
    
    private func setViewHierarchy() {
        [self.itemImageView, self.nameLabel, self.priceLabel, self.heartButton].forEach { view in
            contentView.addSubview(view)
        }
    }
    
    private func setLayout() {
        self.itemImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.horizontalEdges.equalToSuperview().inset(9)
            make.bottom.equalToSuperview().inset(59)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(itemImageView.snp.bottom).offset(2)
            make.leading.equalToSuperview().offset(9)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(2)
            make.leading.equalToSuperview().offset(9)
        }
        
        heartButton.snp.makeConstraints { make in
            make.trailing.bottom.equalTo(itemImageView).inset(8)
            make.size.equalTo(16)
        }
    }
    
    @objc func heartButtonDidTap() {
        self.heartButton.isSelected.toggle()
        if let itemRow {
            self.delegate?.heartButtonDidTapEvent(state: self.heartButton.isSelected, row: itemRow)
        }
    }
    
}


extension ItemCollectionViewCell {
    func dataBind(_ itemData: ItemModel, itemRow: Int) {
        self.itemImageView.image = itemData.itemImg
        self.nameLabel.text = itemData.name
        self.priceLabel.text = itemData.price
        self.priceLabel.text = itemData.price
        self.heartButton.isSelected = itemData.heartIsSelected
        self.itemRow = itemRow
    }
}
