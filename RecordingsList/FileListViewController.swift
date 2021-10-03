//
//  FileListViewController.swift
//  RecordingsList
//
//  Created by Willhite on 10/3/21.
//

import UIKit
import Foundation
import AVFoundation

class FileListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //temp fileList
    var pictures = [String]()
    //tempFileList
    //temp segue
    var recordedAudioList: [String] = ["files","more files"]
    //temp segue
    
    let cellReuseIdentifier = "CellReuse"
    
   
    

    
    // MARK: UITableViewDataSource
    
    // Add the two essential table data source methods here
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.recordedAudioList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellReuse")!
        let recordedFileRow = self.recordedAudioList[(indexPath as NSIndexPath).row]
        cell.textLabel?.text = recordedFileRow
        
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
//tempfilelist test
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)

        for item in items {
            if item.hasSuffix(".mp4") {
                pictures.append(item)
            }
        }
        print(pictures)
        //tempfilelist test
    }
    

    

}
