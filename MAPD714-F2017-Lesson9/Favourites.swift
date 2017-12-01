//
//  Favourites.swift
//  MAPD714-F2017-Lesson9
//
//  Created by Sergio de Almeida Brunacci and Rafael Timbo Matos on 2017-11-29.
//  Copyright © 2017 Centennial College. All rights reserved.
//

import Foundation
import UIKit

class FavouritesList{
    static let sharedFavouritesList = FavouritesList()
    private(set) var favourites:[String]
    
    init() {
        let defaults = UserDefaults.standard
        let storedFavourites = defaults.object(forKey: "favourites") as? [String]
        favourites = storedFavourites != nil ? storedFavourites! : []
    }
    
    func  addFavourites(fontName: String){
        if !favourites.contains(fontName){
            favourites.append(fontName)
            saveFavourites()
        }
    }
    
    private func saveFavourites(){
        let defaults = UserDefaults.standard
        defaults.set(favourites, forKey: "favourites")
        defaults.synchronize()
    }
    
    func removeFavourite(fontName: String){
        if let index = favourites.index(of: fontName){
            favourites.remove(at: index)
            saveFavourites()
        }
    }
    
    func moveItem(fromIndex from: Int, toIndex to: Int){
        let item = favourites[from]
        favourites.remove(at: from)
        favourites.insert(item, at: to)
        saveFavourites()
    }
    
}
