//
//  ChatListCollectionViewCell.swift
//  ChatList
//
//  Created by MacBook Pro on 2022/07/04.
//

import UIKit

class ChatListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var chatLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        thumbnail.layer.cornerRadius = 10
    }
    
    func configure(_ chat: Chat) {
        thumbnail.image = UIImage(named: chat.name)
        nameLabel.text = chat.name
        chatLabel.text = chat.chat
        dateLabel.text = formattedDateString(dateString:chat.date)
    }
    
    func formattedDateString(dateString: String) -> String {
        //String -> date -> String
        //2022-04-01 > 04/01
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        //String -> date
       if let date = formatter.date(from: dateString){
           formatter.dateFormat = "M/d"
           return formatter.string(from: date)
       }else {
           return ""
       }
    }
}
