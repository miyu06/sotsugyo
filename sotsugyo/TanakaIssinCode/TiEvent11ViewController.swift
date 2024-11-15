import UIKit
import AVFoundation
import AVKit

class TiEvent11ViewController: UIViewController {
    
    var player: AVPlayer!
    var playerLayer: AVPlayerLayer!
    var currentFlaggedButton: UIButton?
    var labels: [UILabel] = []
    var flag:[Bool] = [false,false,false]
    var oldFlag: Int = 0
    let buttonWidth:[CGFloat] = [150,340,190]
    let fixHeight:[CGFloat] = [0,0,5]
    
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
        guard let filePath = Bundle.main.path(forResource: "TiBar11", ofType: "mp4") else {
            print("見つからないんだけどぉ")
            return
        }
        let videoURL = URL(fileURLWithPath: filePath)
        self.player = AVPlayer(url: videoURL)
        
        let videoView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 850))
        videoView.backgroundColor = .black
        view.addSubview(videoView)
        
        self.playerLayer = AVPlayerLayer(player: self.player)
        self.playerLayer.frame = videoView.bounds
        self.playerLayer.videoGravity = .resizeAspect
        videoView.layer.addSublayer(self.playerLayer)
        
        self.player.play()
        print("iikanji")
        
        // ボタンとラベルの設定
        let buttonHeight: CGFloat = 50
        let initialYPosition: CGFloat = 230 // 最初のボタンのY位置
        let verticalSpacing: CGFloat = 22 // ボタン間のスペース
        
        for i in 0..<3 {
            // ボタンの作成
            let button = UIButton(type: .system)
            button.setTitle("", for: .normal)
            button.backgroundColor = UIColor.clear // ボタンを透明に
            button.tag = i + 1 // タグを設定
            
            // ボタンのフレームを設定
//            let buttonWidth: CGFloat = (i == 1) ? videoView.frame.width - 40 : 150 // 2つ目のボタンだけ横に長く
            let buttonXPosition = (videoView.frame.width - buttonWidth[i]) / 2
            let buttonYPosition = initialYPosition + CGFloat(i) * (buttonHeight + verticalSpacing) + fixHeight[i]
            button.frame = CGRect(x: buttonXPosition, y: buttonYPosition, width: buttonWidth[i], height: buttonHeight)
            
            // タップアクションを追加
            button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
            videoView.addSubview(button)
            
            // ラベルの作成
            let label = UILabel(frame: CGRect(x: buttonXPosition - 20, y: buttonYPosition, width: 20, height: 50))
            label.text = "▶︎"
            label.textAlignment = .center
            label.textColor = .white
            label.isHidden = true // 初期は非表示
            label.tag = 100 + i + 1
            videoView.addSubview(label)
            labels.append(label)
        }
    }
    
    @objc func buttonTapped(_ sender: UIButton) {
        
        if flag[sender.tag - 1] {
            navigateToNextScreen(for: sender.tag)
        }else{
            if oldFlag == 0 {
                oldFlag = sender.tag
            }else{
                flag[oldFlag - 1] = false
                view.viewWithTag(100+oldFlag)?.isHidden = true
                oldFlag = sender.tag
            }
            flag[sender.tag - 1] = true
            view.viewWithTag(100+sender.tag)?.isHidden = false
        }
        
        //        if let currentButton = currentFlaggedButton {
        //            // フラグがあるボタンを再度押した場合は遷移する
        //            if currentButton == sender {
        //                navigateToNextScreen(for: sender.tag)
        //                return
        //            }
        //            // 現在のラベルを非表示にする
        //            labels[currentButton.tag - 1].isHidden = true
        //        }
        
        //        // フラグを新しいボタンに設定し、そのラベルを表示
        //        currentFlaggedButton = sender
        //        labels[sender.tag - 1].isHidden = false
        
    }
    
    func navigateToNextScreen(for tag: Int) {
        self.player.pause()
        self.playerLayer.removeFromSuperlayer()
        print("Navigating to screen \(tag)")
        
        var nextViewController: UIViewController
        
        // タグによって遷移先を決定
        switch tag {
        case 1:
            nextViewController = TiGive12aViewController()
        case 2:
            nextViewController = TiQuestion12bViewController()
        case 3:
            nextViewController = TiRefuse12cViewController()
        default:
            return
        }
        
        nextViewController.modalPresentationStyle = .fullScreen
        present(nextViewController, animated: true, completion: nil)
    }
}
