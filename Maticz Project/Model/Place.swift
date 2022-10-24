//
//  Place.swift
//  Maticz Project
//
//  Created by Ajaaypranav R K on 24/10/22.
//

import Foundation
import MapKit

struct Place : Identifiable {
    var id = UUID().uuidString
    var place : CLPlacemark
}
