//
//  Models.swift
//  appStoreClone
//
//  Created by John Paul Machahuay on 6/11/17.
//  Copyright © 2017 John Paul Machahuay. All rights reserved.
//

import UIKit

class AppCategory: NSObject {
    var name: String?
    var apps: [App]?
    
    static func fetchData() {
        let url = "https://api.letsbuildthatapp.com/appstore/featured"
        
        URLSession.shared.dataTask(with: URL(string: url)!) { (data, response, error) in
            if error != nil {
                print(error!)
                return
            }
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String: Any]
                
                var appsCategories = [AppCategory]()
                
                for dict in json["categories"] as! [[String:Any]] {
                    let appCategory = AppCategory()
                    appCategory.setValuesForKeys(dict)
                    
                    appsCategories.append(appCategory)
                }
                print(appsCategories)
            } catch let err {
                print(err)
            }
            
        }.resume()
    }
    
    static func sampleData() -> [AppCategory] {
        // First Category
        let bestNewAppsCategory = AppCategory()
        bestNewAppsCategory.name = "Best New Apps"
        
        var bestNewApps = [App]()
        
        let javascriptApp1 = App()
        javascriptApp1.name = "This is a test 1 jaja"
        javascriptApp1.imageName = "js"
        javascriptApp1.category = "Game"
        javascriptApp1.price = NSNumber(floatLiteral: 3.99)
        
        let javascriptApp2 = App()
        javascriptApp2.name = "This is a test 2 jaja"
        javascriptApp2.imageName = "js"
        javascriptApp2.category = "Game"
        javascriptApp2.price = NSNumber(floatLiteral: 8.99)

        
        let javascriptApp3 = App()
        javascriptApp3.name = "This is a test"
        javascriptApp3.imageName = "js"
        javascriptApp3.category = "Game"
        
        let javascriptApp4 = App()
        javascriptApp4.name = "This is a test 4 jaja"
        javascriptApp4.imageName = "js"
        javascriptApp4.category = "Game"
        javascriptApp4.price = NSNumber(floatLiteral: 2.77)
        
        let javascriptApp5 = App()
        javascriptApp5.name = "This is a test"
        javascriptApp5.imageName = "js"
        javascriptApp5.category = "Game"
        javascriptApp5.price = NSNumber(floatLiteral: 1.00)
        
        let javascriptApp6 = App()
        javascriptApp6.name = "This is a test"
        javascriptApp6.imageName = "js"
        javascriptApp6.category = "Game"
        javascriptApp6.price = NSNumber(floatLiteral: 7.23)
        
        let javascriptApp7 = App()
        javascriptApp7.name = "This is a test"
        javascriptApp7.imageName = "js"
        javascriptApp7.category = "Game"
        javascriptApp7.price = NSNumber(floatLiteral: 7.77)
        
        
        let javascriptApp8 = App()
        javascriptApp8.name = "This is a test"
        javascriptApp8.imageName = "js"
        javascriptApp8.category = "Game"
        javascriptApp8.price = NSNumber(floatLiteral: 8.88)
        
        bestNewApps.append(javascriptApp1)
        bestNewApps.append(javascriptApp2)
        bestNewApps.append(javascriptApp3)
        bestNewApps.append(javascriptApp4)
        bestNewApps.append(javascriptApp5)
        bestNewApps.append(javascriptApp6)
        bestNewApps.append(javascriptApp7)
        bestNewApps.append(javascriptApp8)
        
        bestNewAppsCategory.apps = bestNewApps
        
        
        // Second Category
        let bestNewGamesCategory = AppCategory()
        bestNewGamesCategory.name = "Best New Games"
        
        var bestNewGameApps = [App]()
        
        let htmlApp = App()
        htmlApp.name = "This is a html app"
        htmlApp.imageName = "js"
        htmlApp.category = "Games"
        htmlApp.price = NSNumber(floatLiteral: 5.00)
        
        bestNewGameApps.append(htmlApp)
        bestNewGamesCategory.apps = bestNewGameApps
        
        
        return [bestNewAppsCategory, bestNewGamesCategory]
    }
}

class App: NSObject {
    var id: NSNumber?
    var name: String?
    var category: String?
    var imageName: String?
    var price: NSNumber?
}
