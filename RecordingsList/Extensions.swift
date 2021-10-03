//
//  File.swift
//  RecordingsList
//
//  Created by Willhite on 10/3/21.
//

import Foundation
extension Date
{
    func toString( dateFormat format  : String ) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }

}
