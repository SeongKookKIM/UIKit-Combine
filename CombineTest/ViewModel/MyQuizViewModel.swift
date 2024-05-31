import Combine

class QuizViewModel: ObservableObject {
    @Published var currentQuiz: Quiz?
    @Published var currentQuestionIndex: Int = 0
    @Published var totalScore: Int = 0
    
    private var quizStore = QuizStore()
    private var count = 0

    init() {
        loadCurrentQuiz()
    }
    
    func loadCurrentQuiz() {
        guard count < quizStore.quizListStore.count else {
            // 모든 퀴즈를 완료했을 때의 처리를 여기에 추가
            print("All quizzes completed. Total Score: \(totalScore)")
            return
        }
        currentQuiz = quizStore.quizListStore[count] as? Quiz
    }
    
    func selectAnswer(_ score: Int) {
        totalScore += score
        count += 1
        loadCurrentQuiz()
    }
}
