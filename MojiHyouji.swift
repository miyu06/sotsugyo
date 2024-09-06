//
//  File.swift
//  sotsugyo
//
//  Created by clark on 2024/07/11.
//

import Foundation
import UIKit
// MARK: - Properties
@IBOutlet weak var questionText: UITextView! //問題文
var timer = Timer() //問題文タイマー
var currentCharNum = 0 //現在の文字数

// 問題文表示開始
func start() {
timer = Timer.scheduledTimer(timeInterval: 0.05, target: self, selector:#selector(showDelayText(time:)), userInfo: q.question, repeats: true)
}

@objc func showDelayText(time: Timer) {
    let message = time.userInfo as! String
    questionText.text = String(message.prefix(currentCharNum))
    if message.count <= currentCharNum {
        time.invalidate()
        currentCharNum = 0
        return
    }
    currentCharNum += 1
}
