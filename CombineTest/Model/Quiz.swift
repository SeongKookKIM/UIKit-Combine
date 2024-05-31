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

struct QuizCount {
    var count: Int = 0
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



struct QuizStore {
    var quizListStore: [QuizProtocol] = [Quiz(questionAsk: "1번 질문입니다.", questions: [QuestionList(content: "1번 답변", score: 20),
                                                                                    QuestionList(content: "2번 답변", score: 0)]
                                             ),
                                         Quiz(questionAsk: "2번 질문입니다.", questions: [QuestionList(content: "1번 답변", score: 20),
                                                                                    QuestionList(content: "2번 답변", score: 0)]
                                             ),
                                         Quiz(questionAsk: "3번 질문입니다.", questions: [QuestionList(content: "1번 답변", score: 20),
                                                                                    QuestionList(content: "2번 답변", score: 0)]
                                             ),
                                         Quiz(questionAsk: "4번 질문입니다.", questions: [QuestionList(content: "1번 답변", score: 20),
                                                                                    QuestionList(content: "2번 답변", score: 0)]
                                             ),
                                         Quiz(questionAsk: "5번 질문입니다.", questions: [QuestionList(content: "1번 답변", score: 20),
                                                                                    QuestionList(content: "2번 답변", score: 0)]
                                             )
    ]
}
