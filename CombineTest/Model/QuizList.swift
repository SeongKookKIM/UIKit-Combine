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
    
    init(quizTitle: String, BackgroundColor: UIColor) {
        self.quizTitle = quizTitle
        self.BackgroundColor = BackgroundColor
    }
}

struct QuizListStore {
    var quizListStore: [QuizList] = [QuizList(quizTitle: "1번", BackgroundColor: .black),
                                     QuizList(quizTitle: "2번", BackgroundColor: .red),
                                     QuizList(quizTitle: "3번", BackgroundColor: .blue),
                                     QuizList(quizTitle: "4번", BackgroundColor: .brown)]
}
