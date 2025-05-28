//
//  ProfileStatService.swift
//  MintynTask
//
//  Created by waheedCodes on 28/05/2025.
//

import Foundation

struct ProfileStats {
    let profilePicture: String
    let growingPlace: String
    let location: String
    let years: Int
    let helps: Int
    let pounds: Int
    let numberOfPlants: Int
    let typeOfPlants: [String]
}

class ProfileService {
    static func fetchProfile(completion: @escaping (ProfileStats) -> Void) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 2.0) {
            let profile = ProfileStats(
                profilePicture: "rita-malcok",
                growingPlace: "Outdoor",
                location: "Sanremo, Italy",
                years: 45,
                helps: 1050,
                pounds: 987,
                numberOfPlants: 100,
                typeOfPlants: [
                    "Cloni",
                    "Tecolote"
                ])
            completion(profile)
        }
    }
}
