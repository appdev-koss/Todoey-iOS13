//
//  Item.swift
//  Todoey
//
//  Created by Koss Ivanovsky on 5/27/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

class Item {
    let title: String
    var done: Bool = false
    init(title: String) {
        self.title = title
    }
}
