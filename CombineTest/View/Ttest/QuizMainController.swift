//
//  ViewController.swift
//  CombineTest
//
//  Created by SeongKook on 5/30/24.
//

import UIKit

class ViewController: UIViewController {
    
    let quizListModel = QuizListStore()
    
    private var tableView: UITableView = {
       let tableView = UITableView(frame: .zero, style: .plain)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(QuizListTVCell.self, forCellReuseIdentifier: "quizListCell")
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "타이틀"
        
        setUpUI()
    }
    
    func setUpUI() {
        // TableView
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
          
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
        ])
        
    }
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        quizListModel.quizListStore.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "quizListCell", for: indexPath) as? QuizListTVCell else {
            return UITableViewCell()
        }
        let quizList = quizListModel.quizListStore[indexPath.row]
        
        cell.selectionStyle = .none
        cell.configure(item: quizList)
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let myQuizView = MyQuizViewController()
        
        switch indexPath.row {
        case 0:
            navigationController?.pushViewController(myQuizView, animated: true)
        default:
            return
        }
        
    }
}
