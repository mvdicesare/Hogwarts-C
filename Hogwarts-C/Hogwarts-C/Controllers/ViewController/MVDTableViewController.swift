//
//  MVDTableViewController.swift
//  Hogwarts-C
//
//  Created by Michael Di Cesare on 10/8/19.
//  Copyright © 2019 Karl Pfister. All rights reserved.
//

import UIKit

class MVDTableViewController: UITableViewController {

    var characters:[MVDCharacter] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        MVDCharacterController.fetchCharacters { (characters) in
            DispatchQueue.main.async {
                self.characters = characters
                self.tableView.reloadData()
            }
        }
    }

    // MARK: - Table view data source



    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return characters.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "characterIdentifier", for: indexPath) as? MVDCharacterTableViewCell else {return UITableViewCell()}
        
        let character = characters[indexPath.row]
        
        cell.updateViews(with: character)

        // Configure the cell...

        return cell
    }


   

}
