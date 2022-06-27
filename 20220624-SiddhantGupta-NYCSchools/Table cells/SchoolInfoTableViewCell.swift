//
//  SchoolInfoTableViewCell.swift
//  20220624-SiddhantGupta-NYCSchools
//
//  Created by Siddhant Gupta on 6/22/22.
//

import UIKit

class SchoolInfoTableViewCell: UITableViewCell {
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var schoolNameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cellView.layer.cornerRadius = 10.0
        cellView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCellWithSchool (school : School){
        self.schoolNameLabel.text = school.schoolName
        self.addressLabel.text = school.address + ","
        self.locationLabel.text = school.neighborhood + ", " + school.city + ", " + school.postalCode

    }
    
}
