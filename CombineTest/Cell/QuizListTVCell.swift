//
//  QuizListTVCell.swift
//  CombineTest
//
//  Created by SeongKook on 5/30/24.
//

import UIKit

class QuizListTVCell: UITableViewCell {
    
    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return titleLabel
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.layer.cornerRadius = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setUpUI() {
        
        stackView.addSubview(titleLabel)
        contentView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            stackView.heightAnchor.constraint(equalToConstant: 150),
            
            titleLabel.centerXAnchor.constraint(equalTo: stackView.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: stackView.centerYAnchor)
        ])
        
    }

    
    // congifure
    func configure(item: QuizList) {
        titleLabel.text = item.quizTitle
        stackView.backgroundColor = item.BackgroundColor
    }
    
}
