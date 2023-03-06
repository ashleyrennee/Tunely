//
//  Album.swift
//  lab-tunley
//
//  Created by Ashley Acevedo on 3/6/23.
//

import Foundation
struct Album: Decodable{
    let artworkUrl100 : URL
}
 
struct AlbumResults : Decodable{
    let results : [Album]
}
