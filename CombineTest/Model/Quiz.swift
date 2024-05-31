//
//  Quiz.swift
//  CombineTest
//
//  Created by SeongKook on 5/30/24.
//

import Foundation

protocol QuizProtocol {
    var id: UUID { get set }
    var questionAsk: String { get set }
    var questions: [QuestionList] { get set }
}

struct QuestionList {
    let content: String
    let score: Int
}

class Quiz: QuizProtocol {
    var id: UUID = UUID()
    var questionAsk: String
    var questions: [QuestionList]
    
    init(questionAsk: String, questions: [QuestionList]) {
        self.questionAsk = questionAsk
        self.questions = questions
    }
}
class Count {
    var count: Int = 0
}


class QuizStore {
    var quizListStore: [QuizProtocol] = [Quiz(questionAsk: "당신의 취향은?", questions: [QuestionList(content: "a1", score: 1),
                                                                                   QuestionList(content: "b2", score: 2),
                                                                                   QuestionList(content: "c3", score: 3),
                                                                                   QuestionList(content: "d4", score: 4)]),
                                         Quiz(questionAsk: "당신의 색깔은?", questions: [QuestionList(content: "aa1", score: 1),
                                                                                   QuestionList(content: "bb2", score: 2),
                                                                                   QuestionList(content: "cc3", score: 3),
                                                                                   QuestionList(content: "dd4", score: 4)]),
                                         Quiz(questionAsk: "당신의 모양은?", questions: [QuestionList(content: "aaa1", score: 1),
                                                                                   QuestionList(content: "bbb2", score: 2),
                                                                                   QuestionList(content: "ccc3", score: 3),
                                                                                   QuestionList(content: "ddd4", score: 4)]),
                                         Quiz(questionAsk: "당신의 핸드폰은?", questions: [QuestionList(content: "aaaa1", score: 1),
                                                                                    QuestionList(content: "bbbb2", score: 2),
                                                                                    QuestionList(content: "cccc3", score: 3),
                                                                                    QuestionList(content: "dddd4", score: 4)]),]
}
