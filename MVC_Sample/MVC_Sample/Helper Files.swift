//
//  Helper Files.swift
//  MVC_Sample
//
//  Created by Azuma on 2018/09/27.
//  Copyright © 2018 Azuma. All rights reserved.
//

import Foundation
import UIKit

class RoundImageView: UIImageView {
    override func layoutSubviews() {
        self.clipsToBounds = true
        self.layer.cornerRadius = self.bounds.height / 2
    }
}
