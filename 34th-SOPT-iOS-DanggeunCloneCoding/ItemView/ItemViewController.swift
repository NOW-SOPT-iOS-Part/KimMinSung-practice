//
//  ItemViewController.swift
//  34th-SOPT-iOS-DanggeunCloneCoding
//
//  Created by 김민성 on 2024/04/20.
//

import UIKit
import SnapKit

class ItemViewController: UIViewController {
    
    
    
    final let carrotLineSpacing: CGFloat = 10
    final let carrotInterLineSpacing: CGFloat = 21
    final let cellHeight: CGFloat = 199
    final let carrotInset = UIEdgeInsets(top: 48, left: 20, bottom: 10, right: 20)
    
    private var itemData = ItemModel.dummy() {
        didSet {
            self.collectionView.reloadData()
        }
    }
    
    private func calculateCellHeight() -> CGFloat {
        let count = CGFloat(itemData.count)
        let heightCount = count / 2 + count.truncatingRemainder(dividingBy: 2)
        return heightCount * cellHeight + (heightCount - 1) * carrotLineSpacing + carrotInset.top + carrotInset.bottom
    }
    
    
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        self.register()
        self.setViewHierarchy()
        self.setLayout()
        self.setCollectionViewLayout()
    }
    
    
    private func setViewHierarchy() {
        self.view.addSubview(self.collectionView)
    }
    
    private func setLayout() {
        self.collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    
    private func register() {
        self.collectionView.register(ItemCollectionViewCell.self, forCellWithReuseIdentifier: ItemCollectionViewCell.reuseIdentifier)
    }
    
    private func setDelegate() {
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
    }
    
    
    private func setCollectionViewLayout() {
        let flowLayout = UICollectionViewFlowLayout()
        
        let screenWidth = UIScreen.main.bounds.width
        let doubleCellWidth = screenWidth - (carrotInset.left + carrotInset.right + carrotInterLineSpacing)
        flowLayout.itemSize = CGSize(width: doubleCellWidth / 2, height: 198)
        
        flowLayout.minimumLineSpacing = self.carrotLineSpacing
        flowLayout.minimumInteritemSpacing = self.carrotInterLineSpacing
        self.collectionView.setCollectionViewLayout(flowLayout, animated: false)
    }
    
}

extension ItemViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ItemCollectionViewCell.reuseIdentifier,
            for: indexPath
        ) as? ItemCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.dataBind(itemData[indexPath.item], itemRow: indexPath.item)
        
        return cell
    }
    
    
}

extension ItemViewController: UICollectionViewDelegate {
    
}
