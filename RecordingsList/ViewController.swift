//
//  RecordingViewController.swift
//  RecordingsList
//
//  Created by Willhite on 10/3/21.
//

import UIKit


import AVFoundation

class RecordingViewController: UIViewController, AVAudioPlayerDelegate, AVAudioRecorderDelegate {
    



        var audioRecorder: AVAudioRecorder!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBOutlet weak var recordingLabel: UILabel!
    
 
    @IBAction func recordSwitch(_ sender: UISwitch) {
    
    
        if sender.isOn == true {
            recordingLabel.text = "Continuous Record ON"
            
            let documentPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            let audioFilename = documentPath.appendingPathComponent("\(Date().toString(dateFormat: "dd-MM-YY_'at'_HH:mm:ss")).m4a")
           // let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask, true)[0] as String
            //    let recordingName = "recordedVoice.wav"
            //    let pathArray = [dirPath, recordingName]
           //     let filePath = URL(string: pathArray.joined(separator: "/"))
//print(filePath)
                let session = AVAudioSession.sharedInstance()
                try? session.setCategory(AVAudioSession.Category.playAndRecord, mode: AVAudioSession.Mode.default, options: AVAudioSession.CategoryOptions.defaultToSpeaker)

                try? audioRecorder = AVAudioRecorder(url: audioFilename, settings: [:])
            audioRecorder.delegate = self
                audioRecorder.isMeteringEnabled = true
                audioRecorder.prepareToRecord()
                audioRecorder.record()
            print(audioFilename)
        } else {recordingLabel.text = "Continuous Record OFF"
            audioRecorder.stop()
                let audioSession = AVAudioSession.sharedInstance()
                try? audioSession.setActive(false)
        }
    }
}
