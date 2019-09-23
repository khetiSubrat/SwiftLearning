//
//  DataController.swift
//  SwiftLearning
//
//  Created by Subrat Kheti on 29/08/19.
//  Copyright © 2019 Subrat Kheti. All rights reserved.
//

import Foundation
import CoreData

class DataController {
    let persistantContainer = NSPersistentContainer(name: "LibraryDataModel")
    func initialise() {
        //self.setStore(type: NSInMemoryStoreType)
        self.persistantContainer.loadPersistentStores { (description, error) in
            if let error = error {
                print("failed to load")
            }
        }
    
    }
    
    func setStore(type: String) {
        let description = NSPersistentStoreDescription()
        description.type = type // types: NSInMemoryStoreType, NSSQLiteStoreType, NSBinaryStoreType
        
        if type == NSSQLiteStoreType || type == NSBinaryStoreType {
            description.url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
                .first?.appendingPathComponent("database")
        }
        
        self.persistantContainer.persistentStoreDescriptions = [description]
    }
    
    var context: NSManagedObjectContext {
        return self.persistantContainer.viewContext
    }
    
    func insertUser(withBook: Bool) throws {
        let user = User(context:self.context)
        
        user.firstName = "John"
        user.lastName = "Snow"
        user.username = "john_snow12"
        
        if withBook {
            let book = Book(context: self.context)
            //book.title = "A Song of Ice and Fire"
            user.addToBooks(book)
        }
        
        self.context.insert(user)
        try self.context.save()
        
    }
    
    
    
    func fetchUsers() throws -> [User] {
        let users = try self.context.fetch(User.fetchRequest() as NSFetchRequest<User>)
        return users
    }
    
    func fetchUsers(withName name: String) throws -> [User] {
        let request = NSFetchRequest<User>(entityName: "User")
        request.predicate = NSPredicate(format: "firstName == %@", name)
        
        let users = try self.context.fetch(request)
        return users
    }
    
    func insertUser(user: User) throws {
        self.context.insert(user)
        try self.context.save()
    }
    
    func update(user: User) throws {
        user.firstName = "John (updated)"
        try self.context.save()
    }
    
    func delete(user: User) throws {
        self.context.delete(user)
        try self.context.save()
    }
    
}
