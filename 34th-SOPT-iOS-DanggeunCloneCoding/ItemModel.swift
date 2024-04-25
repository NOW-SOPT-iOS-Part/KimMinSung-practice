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
            ItemModel(itemImg: .product01, name: "류희재", price: "22000원", heartIsSelected: false),
            ItemModel(itemImg: .product01, name: "류희재", price: "22000원", heartIsSelected: false),
            ItemModel(itemImg: .product01, name: "류희재", price: "22000원", heartIsSelected: false),
            ItemModel(itemImg: .product01, name: "류희재", price: "22000원", heartIsSelected: false),
            ItemModel(itemImg: .product01, name: "류희재", price: "22000원", heartIsSelected: false),
            ItemModel(itemImg: .product01, name: "류희재", price: "22000원", heartIsSelected: false),
            ItemModel(itemImg: .product01, name: "류희재", price: "22000원", heartIsSelected: false),
            ItemModel(itemImg: .product01, name: "류희재", price: "22000원", heartIsSelected: false),
            ItemModel(itemImg: .product01, name: "류희재", price: "22000원", heartIsSelected: false),
            ItemModel(itemImg: .product01, name: "류희재", price: "22000원", heartIsSelected: false),
            ItemModel(itemImg: .product01, name: "류희재", price: "22000원", heartIsSelected: false)
        ]
    }
}
