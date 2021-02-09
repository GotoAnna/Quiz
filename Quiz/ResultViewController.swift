//
//  ResultViewController.swift
//  Quiz
//
//  Created by Mac on 2021/02/09.
//

import UIKit

class ResultViewController: UIViewController {

    var correctAnswer: Int = 0 //正解数
    
    @IBOutlet var resultLabel: UILabel! //結果を表示
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        resultLabel.text = String(correctAnswer)
    }
    
    //タイトルに戻るボタン
    @IBAction func back() {
        print("back")
        //一度に２画面分戻る
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
