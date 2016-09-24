//
//  RepresentativeTableViewCell.swift
//  MyRepresentative
//
//  Created by Wesley Austin on 9/22/16.
//  Copyright © 2016 Wesley Austin. All rights reserved.
//

import UIKit

class RepresentativeTableViewCell: UITableViewCell {
    @IBOutlet weak var partyLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var districtLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var officeLabel: UILabel!
    @IBOutlet weak var linkLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
