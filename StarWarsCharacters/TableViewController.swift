//
//  TableViewController.swift
//  StarWarsCharacters
//
//  Created by Mitch Praag on 6/5/18.
//  Copyright © 2018 Mitch Praag. All rights reserved.
//

import UIKit
import CoreData

class TableViewController: UITableViewController {
    
    var selectedCharacter: StarWarsCharacter?

    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            try self.fetchedhResultController.performFetch()
            print("COUNT FETCHED FIRST: \(self.fetchedhResultController.sections?[0].numberOfObjects)")
        } catch let error  {
            print("ERROR: \(error)")
        }
        let service = APIService()
        service.getDataWith { (result) in
            switch result {
            case .Success(let data):
                self.saveInCoreDataWith(array: data)
                print(data)
            case .Error(let _):
                DispatchQueue.main.async {
                }
            }
        }
    }
    private func createCharacterFrom(dictionary: [String: AnyObject]) -> NSManagedObject? {
        let context = CoreDataStack.sharedInstance.persistentContainer.viewContext
        if let character = NSEntityDescription.insertNewObject(forEntityName: "StarWarsCharacter", into: context) as? StarWarsCharacter {
            character.firstName = dictionary["firstName"] as? String
            character.lastName = dictionary["lastName"] as? String
            character.birthdate = dictionary["birthdate"] as? String
            character.affiliation = dictionary["affiliation"] as? String
            character.id = (dictionary["id"] as? Int16)!
            character.profilePicture = dictionary["profilePicture"] as? String
            character.forceSensitive = (dictionary["forceSensitive"] as? Bool)!
            

            return character
            
        }
        return nil
    }
    
    
    private func saveInCoreDataWith(array: [[String: AnyObject]]) {
        _ = array.map{self.createCharacterFrom(dictionary: $0)}
        do {
            try CoreDataStack.sharedInstance.persistentContainer.viewContext.save()
        } catch let error {
            print(error)
        }
    }
    
    lazy var fetchedhResultController: NSFetchedResultsController<NSFetchRequestResult> = {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: String(describing: StarWarsCharacter.self))
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "id", ascending: true)]
        let frc = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: CoreDataStack.sharedInstance.persistentContainer.viewContext, sectionNameKeyPath: nil, cacheName: nil)
        
        return frc
    }()

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = fetchedhResultController.sections?.first?.numberOfObjects {
            return count
        }
        return 0

    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! MyCustomTableViewCell
        if let character = fetchedhResultController.object(at: indexPath) as? StarWarsCharacter {
            let fullName = "\(character.firstName!)\(character.lastName!)"
            cell.characterName?.text = fullName
            self.tableView.rowHeight = 125
        }
        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue" {
            let myIndex = IndexPath(row: 1, section: 0)
            if let detailVC = segue.destination as? DetailViewController,
                let selectedIndex = tableView.indexPathForSelectedRow?.row
             {
                let character = fetchedhResultController.object(at: myIndex)
                detailVC.character = character as! StarWarsCharacter
            }
            
            
            }
        }
    }


    


