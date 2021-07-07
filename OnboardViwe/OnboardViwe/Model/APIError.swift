//
//  APIError.swift
//  OnboardViwe
//
//  Created by 岡優志 on 2021/07/07.
//

import Foundation
enum APIError: Error {
    case searchWordEmpty
    case invalidURL
    case parserError
    case networkError
    case unknown

    var title: String {
        switch self {
        case .searchWordEmpty:
            return "テキストエラー"
        case .invalidURL:
            return "検索ワードエラー"
        case .parserError:
            return "デコードエラー"
        case .networkError:
            return "ネットワークエラー"
        case .unknown:
            return "不明なエラー"
        }
    }

    var description: String {
        switch self {
        case .searchWordEmpty:
            return "テキストが空です。\n検索ワードを入力してください。"
        case .invalidURL:
            return "以下の原因が考えられます。\n・半角英数字以外の入力\n・スペースの使用\n上記を訂正の上、再度入力して下さい。"
        case .parserError:
            return "変換に失敗しました。\nアプリを最新にするか、開発者に連絡してください。"
        case .networkError:
            return "接続環境の良いところでもう一度お試しください。"
        case .unknown:
            return "不明なエラーです。"
        }
    }
}
