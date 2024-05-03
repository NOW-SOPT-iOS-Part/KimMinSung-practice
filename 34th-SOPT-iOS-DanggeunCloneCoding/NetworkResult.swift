//
//  NetworkResult.swift
//  34th-SOPT-iOS-DanggeunCloneCoding
//
//  Created by 김민성 on 2024/04/27.
//

import Foundation

enum NetworkResult<T> {
    case success(T)
    case requestErr       // 요청 에러 발생했을 때,
    case decodedErr               // 디코딩 오류 발생했을 때
    case pathErr                  // 경로 에러 발생했을 때,
    case serverErr                // 서버의 내부적 에러가 발생했을 때,
    case networkFail              // 네트워크 연결 실패했을 때
}
