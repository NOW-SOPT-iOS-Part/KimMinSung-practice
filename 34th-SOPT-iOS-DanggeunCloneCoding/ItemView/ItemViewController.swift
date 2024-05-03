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
        collectionView.register(ItemCollectionViewCell.self, forCellWithReuseIdentifier: ItemCollectionViewCell.reuseIdentifier)
        return collectionView
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
    
    lazy var menuBarButtonItem: UIBarButtonItem = {
        let barButtonItem = UIBarButtonItem(
            image: .menu,
            style: UIBarButtonItem.Style.plain,
            target: self,
            action: #selector(barButtonItemDidTapped)
        )
        barButtonItem.tag = 1
        return barButtonItem
    }()
    
    lazy var searchBarButtonItem: UIBarButtonItem = {
        let barButtonItem = UIBarButtonItem(
            image: .icSearch,
            style: UIBarButtonItem.Style.plain,
            target: self,
            action: #selector(barButtonItemDidTapped)
        )
        barButtonItem.tag = 2
        return barButtonItem
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        self.setViewHierarchy()
        self.setLayout()
        self.setDelegate()
        self.setCollectionViewLayout()
        self.setNaviBarButtons()
    }
    
    
    private func setViewHierarchy() {
        self.view.addSubview(self.collectionView)
    }
    
    private func setLayout() {
        self.collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
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
        self.collectionView.contentInset = self.carrotInset
    }
    
    private func setNaviBarButtons() {
        self.navigationItem.rightBarButtonItems = [self.alarmBarButtonItem, self.menuBarButtonItem, self.searchBarButtonItem]
    }
    
    @objc private func barButtonItemDidTapped(sender: UIBarButtonItem) {
        switch sender.tag {
        case 0:
            print("alarmBarButtonTapped")
        case 1:
            print("menuBarButtonTapped")
        case 2:
            print("searchBarButtonTapped")
        default:
            return
        }
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
        cell.delegate = self
        cell.dataBind(itemData[indexPath.item], itemRow: indexPath.item)
        
        return cell
    }
    
    
}

extension ItemViewController: UICollectionViewDelegate {
    
}


extension ItemViewController: ItemCollectionViewCellDelegate {
    
    func heartButtonDidTapEvent(state: Bool, row: Int) {
        print(#function)
        self.itemData[row].heartIsSelected = state
    }
}
