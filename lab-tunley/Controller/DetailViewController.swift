//
//  DetailViewController.swift
//  lab-tunley
//
//  Created by Charlie Hieger on 12/5/22.
//

import UIKit
import Nuke

class DetailViewController: UIViewController {

    @IBOutlet weak var trackImageView: UIImageView!
    @IBOutlet weak var trackNameLabel: UILabel!

    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var albumLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!

    // TODO: Pt 1 - Add a track property
    var track: Track!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Load the image located at the `artworkUrl100` URL and set it on the image view.
        Nuke.loadImage(with: track.artworkUrl100, into: trackImageView)
        
        // Set labels with the associated track values.
        trackNameLabel.text = track.trackName
        artistLabel.text = track.artistName
        albumLabel.text = track.collectionName
        genreLabel.text = track.primaryGenreName
        
        // Create a date formatter to style our date and convert it to a string
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        releaseDateLabel.text = dateFormatter.string(from: track.releaseDate)
        
        // Use helper method to convert milliseconds into `mm:ss` string format
        durationLabel.text = formattedTrackDuration(with: track.trackTimeMillis)
    }



}
