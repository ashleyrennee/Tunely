//
//  TrackCell.swift
//  lab-tunley
//
//  Created by Ashley Acevedo on 2/27/23.
//

import UIKit
import Nuke

class TrackCell: UITableViewCell {

    @IBOutlet weak var trackNameLabel: UILabel!
    @IBOutlet weak var trackArtistLabel: UILabel!
    
    @IBOutlet weak var trackImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

     
    }
    func configure(with track: Track) {
        trackNameLabel.text = track.trackName
        trackArtistLabel.text = track.artistName
        Nuke.loadImage(with: track.artworkUrl100, into: trackImageView)
    }
}
