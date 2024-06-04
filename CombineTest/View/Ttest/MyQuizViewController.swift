import UIKit
import Combine

class MyQuizViewController: UIViewController {

    private var viewModel = QuizViewModel()
    private var cancellables = Set<AnyCancellable>()
    
    private let questionLabel = UILabel()
    private let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        setupUI()
        setupBindings()
    }
    
    //SetUpUI
    private func setupUI() {
        questionLabel.numberOfLines = 0
        
        view.addSubview(questionLabel)
        view.addSubview(tableView)
        
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            questionLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            questionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            questionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            tableView.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 16),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "OptionCell")
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func setupBindings() {
        viewModel.$currentQuiz
            .sink { [weak self] quiz in
                self?.updateUI(with: quiz)
            }
            .store(in: &cancellables)
        
        viewModel.$isQuizCompleted
            .sink { [weak self] isCompleted in
                if isCompleted {
                    self?.showResultViewController()
                }
            }
            .store(in: &cancellables)
    }
    
    private func updateUI(with quiz: Quiz?) {
        guard let quiz = quiz else { return }
        questionLabel.text = quiz.questionAsk
        tableView.reloadData()
    }
    
    private func showResultViewController() {
        let resultVC = ResultViewController(viewModel: viewModel)
        present(resultVC, animated: true, completion: nil)
    }
}

extension MyQuizViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.currentQuiz?.questions.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OptionCell", for: indexPath)
        if let question = viewModel.currentQuiz?.questions[indexPath.row] {
            cell.textLabel?.text = question.content
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let score = viewModel.currentQuiz?.questions[indexPath.row].score {
            viewModel.selectAnswer(score)
        }
    }
}

