//
//  ViewController.swift
//  lab-tunley
//
//  Created by Charlie Hieger on 12/1/22.
//

import UIKit

class TracksViewController: UIViewController,UITableViewDataSource {
   

    var tracks : [Track] = []
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //URL session
        let url = URL(string: "https://itunes.apple.com/search?term=bloodorange&attribute=artistTerm&entity=song&media=music")!
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            if let error = error {
                  print("❌ Network error: \(error.localizedDescription)")
              }
            guard let data = data else {
                   print("❌ Data is nil")
                   return
               }
            
            do {

                let decoder = JSONDecoder()
                
                let dateFormatter = DateFormatter()
                
                dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
                
                decoder.dateDecodingStrategy = .formatted(dateFormatter)
                
                let response = try decoder.decode(TrackResults.self, from: data)
                
                let tracks = response.results
            
                //populating data into TracksVC
                DispatchQueue.main.async {
                    self?.tracks = tracks
                    self?.tableView.reloadData()
                }
        
                print("✅ \(tracks)")
            
             } catch {
                 print("❌ Error parsing JSON: \(error.localizedDescription)")
             }
         }
        //begin network request
        task.resume()
        
        tableView.dataSource = self
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let cell = sender as? UITableViewCell,

           let indexPath = tableView.indexPath(for: cell),

           let detailViewController = segue.destination as? DetailViewController {
            
            let track = tracks[indexPath.row]
            
            detailViewController.track = track
            
        }
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tracks.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TrackCell", for: indexPath) as! TrackCell
        
        let track = tracks[indexPath.row]
        
        cell.configure(with: track)
        
        return cell
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let indexPath = tableView.indexPathForSelectedRow {

        tableView.deselectRow(at: indexPath, animated: true)
        }
    }
   
}
