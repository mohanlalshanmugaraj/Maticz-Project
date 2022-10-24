//
//  Place.swift
//  MAP EXAMPLE
//
//  Created by Ajaaypranav R K on 23/10/22.
//

import Foundation
import MapKit

struct Place : Identifiable {
    var id = UUID().uuidString
    var place : CLPlacemark
}
