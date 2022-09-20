//
//  RequestShow.swift
//  NewProyectTvShow
//
//  Created by Luis Enrique Erazo Amador on 16/09/22.
//

import Foundation




struct Cuentas {
    let title: String
}



struct ShowElement: Decodable {
    let name: String
    let image: Image?
}

struct Image: Codable {
    let medium, original: String
}
