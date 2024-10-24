//
//  dateViewController.swift
//  sotsugyo
//
//  Created by clark on 2024/10/04.
//
import UIKit
import AVFoundation
import AVKit

class TiDate1ViewController: UIViewController {
    
    var player: AVPlayer!
    var playerLayer: AVPlayerLayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("a")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        playvideo()
        print("play")
    }
    
    @objc func playvideo() {
        guard let filePath = Bundle.main.path(forResource: "TiDate1", ofType: "mp4") else {
            print("動画が見つからない")
            return
        }
        let videoURL = URL(fileURLWithPath: filePath)
        self.player = AVPlayer(url: videoURL) // ここで self.player に代入
        
        let videoView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 850))
        videoView.backgroundColor = .black
        view.addSubview(videoView)
        
        self.playerLayer = AVPlayerLayer(player: self.player) // self.playerLayer に代入
        self.playerLayer.frame = videoView.bounds
        self.playerLayer.videoGravity = .resizeAspect
        
        videoView.layer.addSublayer(self.playerLayer)
        
        self.player.play() // プレイヤーを再生
        
        // ボタンを作成して動画ビューの上に追加
        let nextButton = UIButton(type: .system)
        videoView.addSubview(nextButton)
        nextButton.setTitle("", for: .normal) // ボタンのタイトルを非表示に
        nextButton.backgroundColor = UIColor.clear // ボタンの背景を透明に
        nextButton.frame = view.frame // ボタンを画面全体に配置
        nextButton.addTarget(self, action: #selector(goToNextScreen), for: .touchUpInside)
    }
    
    @objc func goToNextScreen() {
        self.player.pause() // プレイヤーを一時停止
        self.playerLayer.removeFromSuperlayer() // レイヤーを削除
        print("次の画面2")
        // 次の画面に遷移
        let nextViewController = TiDate2ViewController()
        nextViewController.modalPresentationStyle = .fullScreen
        present(nextViewController, animated: true, completion: nil)
    }
}
