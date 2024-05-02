//
//  PersistenceError.swift
//  ViperTaskDemo
//
//  Created by Asad Amodi on 01/05/2024.
//

import Foundation

enum PersistenceError: Error {
    case managedObjectContextNotFound
    case couldNotSaveObject
    case objectNotFound
}

