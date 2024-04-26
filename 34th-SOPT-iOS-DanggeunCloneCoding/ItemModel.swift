//
//  ItemModel.swift
//  34th-SOPT-iOS-DanggeunCloneCoding
//
//  Created by 김민성 on 2024/04/20.
//

import UIKit

struct ItemModel {
    let itemImg: UIImage
    let name: String
    let price: String
    var heartIsSelected: Bool
}

extension ItemModel {
    static func dummy() -> [ItemModel] {
        return [
            ItemModel(itemImg: .itemImageIPhone, name: "아이폰 13프로맥스", price: "1,000,000원", heartIsSelected: false),
            ItemModel(itemImg: .itemImageAirPodsPro, name: "에어팟 프로", price: "30000원", heartIsSelected: false),
            ItemModel(itemImg: .itemImageCoffee, name: "커피머신", price: "10000원", heartIsSelected: false),
            ItemModel(itemImg: .itemImageSandwiches, name: "샌드위치", price: "8000원", heartIsSelected: false),
            ItemModel(itemImg: .itemImagePerfume, name: "명품 향수", price: "25000원", heartIsSelected: false),
            ItemModel(itemImg: .itemImageCoffee, name: "커피머신", price: "10000원", heartIsSelected: false),
            ItemModel(itemImg: .itemImageAirPodsPro, name: "에어팟 프로", price: "30000원", heartIsSelected: false),
            ItemModel(itemImg: .itemImageIPhone, name: "아이폰 13프로맥스", price: "1,000,000원", heartIsSelected: false),
            ItemModel(itemImg: .itemImagePerfume, name: "명품 향수", price: "25000원", heartIsSelected: false),
            ItemModel(itemImg: .itemImageIPhone, name: "아이폰 13프로맥스", price: "1,000,000원", heartIsSelected: false),
            ItemModel(itemImg: .itemImageAirPodsPro, name: "에어팟 프로", price: "30000원", heartIsSelected: false)
        ]
    }
}
