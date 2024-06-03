//
//  QuizList.swift
//  CombineTest
//
//  Created by SeongKook on 5/30/24.
//

import Foundation
import UIKit

class QuizList {
    let quizTitle: String
    let BackgroundColor: UIColor
    let backGroundImage: String?
    
    init(quizTitle: String, BackgroundColor: UIColor, backGroundImage: String?) {
        self.quizTitle = quizTitle
        self.BackgroundColor = BackgroundColor
        self.backGroundImage = backGroundImage
    }
}

struct QuizListStore {
    var quizListStore: [QuizList] = [QuizList(quizTitle: "T발력 테스트", BackgroundColor: .systemGray, backGroundImage: "test"),
                                     QuizList(quizTitle: "2번", BackgroundColor: .red, backGroundImage: nil),
                                     QuizList(quizTitle: "3번", BackgroundColor: .blue, backGroundImage: nil),
                                     QuizList(quizTitle: "4번", BackgroundColor: .brown, backGroundImage: nil)]
}
