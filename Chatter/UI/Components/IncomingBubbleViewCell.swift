//
//  ChatBubbleViewCell.swift
//  Chatter
//
//  Created by Florence Brew on 20/05/2021.
//

import UIKit

class ChatBubbleViewCell: UITableViewCell {
    private var message: UILabel!
    private var containerView: UIView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension ChatBubbleViewCell {
    func initializeViews() {
        message = UILabel.makeLabel(font: <#T##UIFont#>, textColor: <#T##UIColor#>)
    }
}
