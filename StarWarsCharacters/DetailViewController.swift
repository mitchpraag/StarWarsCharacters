//
//  DetailViewController.swift
//  StarWarsCharacters
//
//  Created by Mitch Praag on 6/5/18.
//  Copyright © 2018 Mitch Praag. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let fullName = "\(character?.firstName!)\(character?.lastName!)"

        nameLabel.text = fullName
        affiliationLabel.text = character?.affiliation
        BirthdateLabel.text = character?.birthdate
        if ((character?.forceSensitive = true) != nil) {
            forceSensitiveLabel.text = " I am force sensitive."
        } else {
            forceSensitiveLabel.text = " I am not force sensitive."
        }

        // Do any additional setup after loading the view.
    }

    var character: StarWarsCharacter?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var affiliationLabel: UILabel!
    @IBOutlet weak var BirthdateLabel: UILabel!
    @IBOutlet weak var forceSensitiveLabel: UILabel!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
