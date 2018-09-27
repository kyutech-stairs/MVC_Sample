//
//  TableViewCell.swift
//  MVC_Sample
//
//  Created by Azuma on 2018/09/27.
//  Copyright © 2018 Azuma. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var organizationLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var starLabel: UILabel!
    @IBOutlet weak var iconImageView: RoundImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backView.clipsToBounds = true
        self.backView.layer.cornerRadius = 8.0
    }
    
    func configure(repository: Repository) {
        self.organizationLabel.text = repository.owner
        self.nameLabel.text = repository.name
        self.starLabel.text = String(repository.starCount)
        URLSession.shared.dataTask(with: URL(string: repository.imagePath)!) { (data, _, error) in
            if error == nil, let data = data {
                let image = UIImage(data: data)
                DispatchQueue.main.async {
                    self.iconImageView.image = image
                }
            }
        }.resume()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
