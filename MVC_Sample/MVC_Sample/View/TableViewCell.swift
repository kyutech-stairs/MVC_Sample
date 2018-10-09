//
//  TableViewCell.swift
//  MVC_Sample
//
//  Created by Azuma on 2018/09/27.
//  Copyright © 2018 Azuma. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var iconimageView: UIImageView!
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var starLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()    //最初に呼び出される

        self.bgView.clipsToBounds = true    //Viewのレイヤーをいじるためにはtrueにしておく必要がある
        self.bgView.layer.cornerRadius = 8.0
        //これで、レイヤーが丸くなる

        
    }


}
