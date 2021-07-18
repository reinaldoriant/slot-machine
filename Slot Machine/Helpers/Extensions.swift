//
//  Extensions.swift
//  Slot Machine
//
//  Created by TI Digital on 19/07/21.
//

import SwiftUI

extension Text{
    func scoreLabelStyle() -> Text{
        self
            .foregroundColor(Color.white)
            .font(.system(size: 10, weight: .bold, design: .rounded))
    }
    func scoreNumberStyle() -> Text{
        self
            .foregroundColor(Color.white)
            .fontWeight(.heavy)
            .font(.system(.title, design: .rounded))
    }
    
}

