//
//  DataTableViewCell.swift
//  Retry-UIKit
//
//  Created by Rexford Machu on 9/30/21.
//

import UIKit

class DataTableViewCell: UITableViewCell {
    @IBOutlet var idTitle : UILabel!
    @IBOutlet var subText : UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    static let identifier = "DataTableViewCell"
      static func nib()->UINib{
         return UINib(nibName: "DataTableViewCell", bundle: nil)
     }
    func configure(with model : GetTestListQuery.Data.TestList){
        self.idTitle.text = model._id
        self.subText.text = model.timeStamp
         self.selectionStyle = .none
    }
}
