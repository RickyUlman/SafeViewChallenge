//
//  QuestionCell.swift
//  SafeHealthChallenge
//
//  Created by Rickie on 3/10/22.
//

import UIKit

class QuestionCell: UICollectionViewCell {
    
    var openLink: (String?) -> Void = { _ in }
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var ownerLabel: UILabel!
    @IBOutlet private weak var questionImage: UIImageView!
    private var link: String?
    
    func configureCell(title: String?, owner: String?, imageData: Data?, link: String?) {
        titleLabel.text = title
        ownerLabel.text = owner
        self.link = link
        // image
        questionImage.image = nil
        if let imageData = imageData {
            let image = UIImage(data: imageData)
            questionImage.image = image
        }
    }
    
    @IBAction private func openLink(_ sender: Any) {
        openLink(link)
    }
}
