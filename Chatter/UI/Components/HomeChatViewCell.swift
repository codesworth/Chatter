//
//  HomeChatViewCell.swift
//  Chatter
//
//  Created by Florence Brew on 08/05/2021.
//

import UIKit

private enum Constants {
    static let titleFontSize: CGFloat = 18
    static let detailFontSize: CGFloat = 16
    static let timeFontSize: CGFloat = 14
    static let detailLabelNumberOfLines = 2
    static let containerCornerRadius: CGFloat = 20
    static let containerShadowOpacity: Float = 0.2
    static let containerShadowRadius: CGFloat = 2
    static let containerShadowOffSet = CGSize(width: 0, height: 2)
    static let verticalInset: CGFloat = 8
    static let horizontalInset: CGFloat = 8
    static let doubleVerticalInset: CGFloat = 16
    static let doubleHorizontalInset: CGFloat = 16
    static let profileImageSize: CGFloat = 60
    static let timeLabelWidth: CGFloat = 50
}

class HomeChatViewCell: UITableViewCell {
    
    private var profileImageView: UIImageView!
    private var titleLabel: UILabel!
    private var detailLabel: UILabel!
    private var timeLabel: UILabel!
    private var containerView: UIView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initializeViews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(with model: UIModel) {
        titleLabel.text = model.title
        detailLabel.text = model.detail
        timeLabel.text = model.time
        profileImageView.image = model.image
    }
}

extension HomeChatViewCell {
    
    private func initializeViews() {
        selectionStyle = .none
        
        profileImageView = UIImageView(image: UIImage(named: "imdp"))
        profileImageView.contentMode = .scaleAspectFit
        
        titleLabel = UILabel()
        titleLabel.font = .systemFont(ofSize: Constants.titleFontSize, weight: .medium)
        titleLabel.textColor = .black
        titleLabel.textAlignment = .left
        
        detailLabel = UILabel()
        detailLabel.font = .systemFont(ofSize: Constants.detailFontSize, weight: .regular)
        detailLabel.textColor = .lightGray
        detailLabel.textAlignment = .left
        detailLabel.numberOfLines = Constants.detailLabelNumberOfLines
        detailLabel.lineBreakMode = .byWordWrapping
        
        timeLabel = UILabel()
        timeLabel.font = .systemFont(ofSize: Constants.timeFontSize, weight: .medium)
        timeLabel.textColor = .blue
        timeLabel.textAlignment = .right
        
        containerView = UIView()
        containerView.backgroundColor = .white
        containerView.layer.cornerRadius = Constants.containerCornerRadius
        containerView.layer.shadowOpacity = Constants.containerShadowOpacity
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowRadius = Constants.containerShadowRadius
        containerView.layer.shadowOffset = Constants.containerShadowOffSet
        
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        detailLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(containerView)
        containerView.addSubview(profileImageView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(detailLabel)
        containerView.addSubview(timeLabel)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.horizontalInset),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.horizontalInset),
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.verticalInset),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Constants.verticalInset),
            
            profileImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: Constants.horizontalInset),
            profileImageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            profileImageView.widthAnchor.constraint(equalToConstant: Constants.profileImageSize),
            profileImageView.heightAnchor.constraint(equalToConstant: Constants.profileImageSize),
            
            titleLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: Constants.horizontalInset),
            titleLabel.bottomAnchor.constraint(equalTo: containerView.centerYAnchor, constant: -Constants.verticalInset),
            
            detailLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: Constants.horizontalInset),
            detailLabel.trailingAnchor.constraint(equalTo: timeLabel.leadingAnchor, constant: -Constants.doubleHorizontalInset),
            detailLabel.topAnchor.constraint(equalTo: profileImageView.centerYAnchor),
            
            timeLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -Constants.horizontalInset),
            timeLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            timeLabel.widthAnchor.constraint(equalToConstant: Constants.timeLabelWidth)
        ])
    }
}

extension HomeChatViewCell {
    struct UIModel {
        var title: String
        var detail: String
        var image: UIImage
        var time: String
    }
}
