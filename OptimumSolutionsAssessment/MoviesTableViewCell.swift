//
//  MoviesTableViewCell.swift
//  OptimumSolutionsAssessment
//
//  Created by Karthika on 27/02/25.
//

import UIKit

class MoviesTableViewCell: UITableViewCell {

    @IBOutlet var movieReleaseYearLable: UILabel!
    @IBOutlet var movieNameLable: UILabel!
    @IBOutlet var moviePosterImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
