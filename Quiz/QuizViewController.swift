//
//  QuizViewController.swift
//  Quiz
//
//  Created by Mac on 2021/02/09.
//

import UIKit

class QuizViewController: UIViewController {

    var quizArray = [Any]() //問題文を格納する配列
    var correctAnswer: Int = 0 //正解数を数えるための変数
    
    @IBOutlet var quizTextView: UITextView! //クイズを表示
    
    @IBOutlet var choiceButton1: UIButton!
    @IBOutlet var choiceButton2: UIButton!
    @IBOutlet var choiceButton3: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //問題文, 3つの選択肢, 答えの番号
        quizArray.append(["fat", "賢い", "背の高い", "太った", 3]) //quizArray[0]
        quizArray.append(["human", "安易な", "電気の", "人間の", 3])
        quizArray.append(["friendly", "弱々しい", "親しい", "我慢強い", 2])
        quizArray.append(["wet", "湿った", "雨の", "地方の", 1])
        quizArray.append(["common", "共通の", "普通の", "怠惰な", 1])
        quizArray.append(["terrible", "退屈な", "ひどい", "魅力のない", 2])
        
        //問題文をシャッフル
        quizArray.shuffle()
        //print(quizArray[0])
        choiceQuiz()
    }
    
    //問題文と選択肢をラベルに表示させる
    func choiceQuiz()
    {
        print(quizArray[0])
        //一時的にクイズを取り出しておく配列
        let tmpArray = quizArray[0] as! [Any]
        
        //問題文を表示
        quizTextView.text = tmpArray[0] as? String
        
        //選択肢ボタンにそれぞれの選択肢をセット
        choiceButton1.setTitle(tmpArray[1] as? String, for: .normal)
        choiceButton2.setTitle(tmpArray[2] as? String, for: .normal)
        choiceButton3.setTitle(tmpArray[3] as? String, for: .normal)
    }
    
    //問題が全て終わったら,自動で画面遷移をする
    func performSegueToResult()
    {
        performSegue(withIdentifier: "toResultView", sender: nil) //画面遷移
    }
    
    //セグエを準備する
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        //セグエがtoResultViewだったら
        if segue.identifier == "toResultView"
        {
            //ResultViewControllerを宣言
            let resultViewController = segue.destination as! ResultViewController
            
            //ResultViewVontrollerのcorrectAnswerに正解数を格納
            resultViewController.correctAnswer = self.correctAnswer
        }
    }
    
    //選択肢のボタンの動作
    @IBAction func choiceAnswer(sender: UIButton)
    {
        let tmpArray = quizArray[0] as! [Any]
        
        //print(tmpArray)
        
        if tmpArray[4] as! Int == sender.tag
        {
            correctAnswer = correctAnswer + 1 //正解数を増やす
        }
        
        //解いた問題をquizArrayから取り除く
        quizArray.remove(at: 0)
        
        //解いた問題数の合計があらかじめ設定していた問題数に達したら結果画面へ
        if quizArray.count == 0 //要素が０個になったら
        {
            performSegueToResult() //結果画面
        }else{
            choiceQuiz() //次の問題の表示
        }
        print(quizArray.count)
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
