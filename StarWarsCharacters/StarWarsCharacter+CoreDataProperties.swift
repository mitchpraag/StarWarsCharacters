//
//  StarWarsCharacter+CoreDataProperties.swift
//  StarWarsCharacters
//
//  Created by Mitch Praag on 6/5/18.
//  Copyright © 2018 Mitch Praag. All rights reserved.
//
//

import Foundation
import CoreData


extension StarWarsCharacter {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<StarWarsCharacter> {
        return NSFetchRequest<StarWarsCharacter>(entityName: "StarWarsCharacter")
    }

    @NSManaged public var id: Int16
    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var birthdate: String?
    @NSManaged public var affiliation: String?
    @NSManaged public var profilePicture: String?
    @NSManaged public var forceSensitive: Bool

}
