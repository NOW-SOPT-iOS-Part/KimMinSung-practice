//
//  LoginViewModelType.swift
//  34th-SOPT-iOS-DanggeunCloneCoding
//
//  Created by 김민성 on 2024/05/31.
//

protocol LoginViewModelType {
    var isValid: ObservablePattern<Bool> { get }
    var errMessage: ObservablePattern<String> { get }
    
    func checkValid(id: String?, password: String?)
}
