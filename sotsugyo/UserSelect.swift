//
//  UserSelect.swift
//  sotsugyo
//
//  Created by clark on 2024/06/26.
//

import Foundation
import UIKit

class UserSelect: UIViewController{
    override func viewDidLoad(){
        super.viewDidLoad()
    }
    @IBAction func Confirm(){
        let alert = UIAlertController(title: "タイトル", message: "メッセージ", preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default) { (action) in
            self.performSegue(withIdentifier: "matchingYamauchiKouki", sender: nil)
        }
        //ここから追加
        let cancel = UIAlertAction(title: "キャンセル", style: .cancel) { (acrion) in
            self.dismiss(animated: true, completion: nil)
        }
        alert.addAction(cancel)
        //ここまで追加
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func next(_ sender: UIButton){
        let nowPage = self.restorationIdentifier
        let nextPage:Int
        if Int(nowPage!) == 4{
            nextPage = 0
        }else{
            nextPage = Int(nowPage!)! + 1
        }
        let nextVC = storyboard?.instantiateViewController(withIdentifier: "\(nextPage)")
        nextVC?.modalPresentationStyle = .fullScreen
        let transition = CATransition()
        transition.duration = 0.25
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromLeft
        view.window!.layer.add(transition,forKey: kCATransition)
        self.present(nextVC!, animated: false)
    }
    @IBAction func back(_ sender: UIButton){
        let nowPage = self.restorationIdentifier
        let nextPage:Int
        if Int(nowPage!) == 0{
            nextPage = 4
        }else{
            nextPage = Int(nowPage!)! - 1
        }
        let nextVC = storyboard?.instantiateViewController(withIdentifier: "\(nextPage)")
        nextVC?.modalPresentationStyle = .fullScreen
        let transition = CATransition()
        transition.duration = 0.25
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromRight
        view.window!.layer.add(transition,forKey: kCATransition)
        self.present(nextVC!, animated: false)
    }
    
    
    
}
