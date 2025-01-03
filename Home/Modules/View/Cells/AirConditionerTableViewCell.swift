//
//  AirConditionerTableViewCell.swift
//  Home
//
//  Created by Vaishnavi on 02/01/25.
//

import UIKit

class AirConditionerTableViewCell: UITableViewCell {
    
    @IBOutlet weak var temperatureLabel: UILabel!
    
    var temperature: Int = 18 {
        didSet {
            temperatureLabel.text = "\(temperature)°"
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        temperatureLabel.text = "\(temperature)°"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func didIncrementButtonTapped(_ sender: Any) {
        temperature += 1
    }
    
    @IBAction func didDecrementButtonTapped(_ sender: Any) {
        if temperature == 0 {
            temperature = 0
        }
        else {
            temperature -= 1
        }
    }
}
