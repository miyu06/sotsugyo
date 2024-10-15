//
//  MatchingYamauchiKoukiViewController.swift
//  sotsugyo
//
//  Created by clark on 2024/09/19.
//

import UIKit
import AVFoundation
import AVKit

class MatchingYamauchiKoukiViewController: UIViewController {
    
    var player: AVPlayer!
    var playerLayer: AVPlayerLayer!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        playvideo()
        print("play")
    }
    
    @objc func playvideo() {
        guard let filePath = Bundle.main.path(forResource: "MatchingYamauchiKouki", ofType: "mp4") else {
            print("動画が見つからない")
            return
        }
        let videoURL = URL(fileURLWithPath: filePath)
        let player = AVPlayer(url: videoURL)
        
        let videoView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 850))
        videoView.backgroundColor = .black
        view.addSubview(videoView)
        
        playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = videoView.bounds
        playerLayer.videoGravity = .resizeAspect
        
        videoView.layer.addSublayer(playerLayer)
        
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        player.play()
        print("iikanji")
        
        // ボタンを作成して動画ビューの上に追加
        let nextButton = UIButton(type: .system)
        videoView.addSubview(nextButton)
        nextButton.setTitle("Next", for: .normal)
        nextButton.backgroundColor = UIColor.white.withAlphaComponent(0.7)
        nextButton.setTitleColor(.black, for: .normal)
        nextButton.frame = CGRect(x: view.frame.width / 2 - 50, y: view.frame.height - 100, width: 100, height: 50)
        nextButton.addTarget(self, action: #selector(goToNextScreen), for: .touchUpInside)
    }
    
    @objc func goToNextScreen() {
        player.pause() // プレイヤーを一時停止
        playerLayer.removeFromSuperlayer() // レイヤーを削除

        // 次の画面に遷移
        
        //let nextViewController = DateViewController()
        //nextViewController.modalPresentationStyle = .fullScreen
        //present(nextViewController, animated: true, completion: nil)
        
//        let storyboard = UIStoryboard(name: "DateViewContoroller", bundle: nil)
//        let nextVC = storyboard.instantiateViewController(withIdentifier: "DateVCYK")
//        navigationController?.pushViewController(nextVC, animated: true)
        
        self.performSegue(withIdentifier: "toDateYK", sender: self)
        print("dada")
        
    }

   // @objc func goToNextScreen() {
     //   playerLayer.removeFromSuperlayer()
// 次の画面に遷移
         //   let nextViewController = DateViewController() // 次の画面のViewControllerをインスタンス化
       //     nextViewController.modalPresentationStyle = .fullScreen  // フルスクリーンで遷移（任意）
           // present(nextViewController, animated: true, completion: nil)  // 画面遷移を実行
    // }

}
