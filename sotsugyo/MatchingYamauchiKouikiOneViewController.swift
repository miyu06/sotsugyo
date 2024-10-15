import UIKit
import AVFoundation
import AVKit

class MatchingYamauchiKoukiOneViewController: UIViewController {
    
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
        self.player = AVPlayer(url: videoURL) // ここで self.player に代入
        
        let videoView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 850))
        videoView.backgroundColor = .black
        view.addSubview(videoView)
        
        self.playerLayer = AVPlayerLayer(player: self.player) // self.playerLayer に代入
        self.playerLayer.frame = videoView.bounds
        self.playerLayer.videoGravity = .resizeAspect
        
        videoView.layer.addSublayer(self.playerLayer)
        
        self.player.play() // プレイヤーを再生
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
        self.player.pause() // プレイヤーを一時停止
        self.playerLayer.removeFromSuperlayer() // レイヤーを削除

        // 次の画面に遷移
//        let nextViewController = DateViewController()
//        nextViewController.modalPresentationStyle = .fullScreen
//        present(nextViewController, animated: true, completion: nil)
    }
}

