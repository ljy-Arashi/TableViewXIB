//
//  MyTableViewCell.swift
//  TableViewXIB
//
//  Created by 刘佳艳 on 2020/01/13.
//  Copyright © 2020 刘佳艳. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var customView: UIView!
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var customImage: UIImageView!
    @IBOutlet weak var star1: UIImageView!
    @IBOutlet weak var star2: UIImageView!
    @IBOutlet weak var star3: UIImageView!
    @IBOutlet weak var star4: UIImageView!
    @IBOutlet weak var star5: UIImageView!
    @IBOutlet weak var score: UILabel!
    
    @IBOutlet weak var rating: UIView!
    var rateScore:Int = 0
    let fullStarImage = UIImage(named: "fullStar")
    let emptyStarImage = UIImage(named: "emptyStar")
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //设置cell是有圆角边框显示
        customView.layer.cornerRadius = 8
        RatingView.showInView(view: rating, value: 3.5, max: 5)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
