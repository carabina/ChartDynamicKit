//
//  MarkerManager.swift
//  Dynamico
//
//  Created by Steve on 6/1/18.
//  Copyright © 2018 Steve Wight. All rights reserved.
//

import MinChartKit
import Charts

public struct MarkerTag {
    public var name:String
    public var value:Double
    
    public init(name:String, value:Double) {
        self.name = name
        self.value = value
    }
}

class MarkerManager: NSObject {
    var line:MinLine
    
    public init(line:MinLine) {
        self.line = line
    }
    
    public func highlight(tag:MarkerTag) {
        if let set = line.lineData?.dataSets.first as? LineChartDataSet {
            highlighSettings(set: set)
            setMarker(text: tag.name)
            line.highlightValue(
                x: set.xMax, y: tag.value, dataSetIndex: 0
            )
        }
    }
    
    private func highlighSettings(set:LineChartDataSet) {
        set.highlightEnabled = true
        set.setDrawHighlightIndicators(false)
    }
    
    private func setMarker(text:String) {
        line.drawMarkers = true
        line.marker = MinMarker(
            text: text,
            line: line
        )
    }
}
