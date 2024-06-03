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
        stackView.clipsToBounds = true
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    private lazy var uiImage: UIImageView = {
        let uiImage = UIImageView()

        uiImage.clipsToBounds = true
        uiImage.translatesAutoresizingMaskIntoConstraints = false
        
        return uiImage
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
        stackView.addSubview(uiImage)
        contentView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            stackView.heightAnchor.constraint(equalToConstant: 150),
            
            titleLabel.centerXAnchor.constraint(equalTo: stackView.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: stackView.centerYAnchor),
            
            uiImage.topAnchor.constraint(equalTo: stackView.topAnchor),
            uiImage.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            uiImage.bottomAnchor.constraint(equalTo: stackView.bottomAnchor),
            uiImage.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            uiImage.widthAnchor.constraint(equalTo: stackView.widthAnchor)
            
        ])
        
    }
    
    
    // congifure
    func configure(item: QuizList) {
        titleLabel.text = item.quizTitle
        stackView.backgroundColor = item.BackgroundColor
        if let imageName = item.backGroundImage {
            uiImage.image = UIImage(named: imageName)
        } else {
            uiImage.image = nil
        }
    }
    
}
