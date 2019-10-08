//
//  MVDCharacterTableViewCell.swift
//  Hogwarts-C
//
//  Created by Michael Di Cesare on 10/8/19.
//  Copyright © 2019 Karl Pfister. All rights reserved.
//

import UIKit

class MVDCharacterTableViewCell: UITableViewCell {

    
    @IBOutlet weak var characterNameLabel: UILabel!
    @IBOutlet weak var characterRoleLabel: UILabel!
    @IBOutlet weak var houseImage: UIImageView!
    @IBOutlet weak var bloodStatus: UIImageView!
    @IBOutlet weak var deathEaterImage: UIImageView!
    
    
    func updateViews(with character: MVDCharacter?) {
        deathEaterImage.isHidden = true
        houseImage.isHidden = true
        bloodStatus.isHidden = true 
     
        
        guard let character = character else {return}
        
        if character.deathEater == true {
            deathEaterImage.isHidden = false
        }
        if character.bloodStatus != "unknown" {
            bloodStatus.isHidden = false
            bloodStatus.image = UIImage.init(named: character.bloodStatus)
        }
        if let house = character.house {
            houseImage.isHidden = false
            houseImage.image = UIImage.init(named: house.lowercased())
        }
        characterNameLabel.text = character.name
        characterRoleLabel.text = character.role
    }
}
