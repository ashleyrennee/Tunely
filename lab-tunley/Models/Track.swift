//
//  Track.swift
//  lab-tunley
//
//  Created by Charlie Hieger on 12/2/22.
//

import Foundation



struct TrackResults: Decodable{
    let results : [Track]
}

struct Track :Decodable{
    let trackName : String
    let artistName : String
    let artworkUrl100 : URL
    let collectionName: String
    let primaryGenreName: String
    let releaseDate: Date
    let trackTimeMillis: Int
}


/*extension Track {
    static var mockTracks: [Track] =
    [
        Track(trackName: "You're Not Good Enough", artistName: "Blood Orange", artworkUrl100: URL(string: "https://is5-ssl.mzstatic.com/image/thumb/Music124/v4/52/ac/30/52ac30de-191a-7f46-b6cd-051f5be848ad/BloodOrangeCVRupdated.jpg/100x100bb.jpg")!,collectionName: "Cupid Deluxe",primaryGenreName: "Alternative",releaseDate: Date(),trackTimeMillis: 261364),
        Track(trackName: "It is What It Is", artistName: "Blood Orange", artworkUrl100: URL(string: "https://is5-ssl.mzstatic.com/image/thumb/Music124/v4/52/ac/30/52ac30de-191a-7f46-b6cd-051f5be848ad/BloodOrangeCVRupdated.jpg/100x100bb.jpg")!,collectionName: "Cupid Deluxe",primaryGenreName: "Alternative",releaseDate: Date(),trackTimeMillis: 307395),
        Track(trackName: "Champagne Coast", artistName: "Blood Orange", artworkUrl100:  URL(string: "https://is4-ssl.mzstatic.com/image/thumb/Music124/v4/da/5d/19/da5d19d4-bbb4-7cee-ad2f-2505b698f445/mzi.cqmfeflv.jpg/100x100bb.jpg")!,collectionName: "Coastal Grooves",primaryGenreName: "Alternative",releaseDate: Date(),trackTimeMillis: 294413),
        Track(trackName: "Sutphin Boulevard", artistName: "Blood Orange", artworkUrl100: URL(string: "https://is3-ssl.mzstatic.com/image/thumb/Music/0f/3a/5f/mzi.zyazxulx.jpg/100x100bb.jpg")!,collectionName: "Coastal Grooves",primaryGenreName: "Alternative",releaseDate: Date(),trackTimeMillis: 214040)
    ]
}*/

// MARK: Helper Methods
/// Converts milliseconds to mm:ss format
///  ex:  208643 -> "3:28"
///  ex:
func formattedTrackDuration(with milliseconds: Int) -> String {
    let (minutes, seconds) = milliseconds.quotientAndRemainder(dividingBy: 60 * 1000)
    let truncatedSeconds = seconds / 1000
    if truncatedSeconds >= 10 {
        return "\(minutes):\(truncatedSeconds)"
    } else {
        return "\(minutes):0\(truncatedSeconds)"
    }
}
