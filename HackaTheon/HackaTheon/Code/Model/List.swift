//
//  List.swift
//  HackaTheon
//
//  Created by Michal Smialko on 09/04/16.
//  Copyright © 2016 Michal Smialko. All rights reserved.
//

import UIKit

class List: NSObject {
    
    var id: String?
    var title: String?
    
    var songs: Array<Song> = []
    var songsIds: Array<String> = []
    
    var image: UIImage?

}
