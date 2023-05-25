import UIKit

class QuizViewController: UIViewController {

    @IBOutlet var numberImage: UIImageView!
    @IBOutlet var answerLabel: UILabel!
    var randomNumber: Int = 0
    var answerNumber: Int = 0

    var language:[String] = ["チベット数字","マラヤーミム数字","カンダナ数字","オリヤー数字","グルムキー数字","タミル数字","クメール数字","オスマニャ数字","タイ数字","テルグ数字"]

    override func viewDidLoad() {
        super.viewDidLoad()
        randomNumber = Int.random(in: 0...9)
        // Do any additional setup after loading the view.
        numberImage.image = UIImage(named: "number\(randomNumber)")

        answerLabel.text = String(answerNumber)
    }
    @IBAction func add(){
        answerNumber += 1
        answerLabel.text = String(answerNumber)
    }
    @IBAction func minus(){
        if(answerNumber == 0){
            answerNumber = 0
            answerLabel.text = String(answerNumber)
        }else{
            answerNumber -= 1
            answerLabel.text = String(answerNumber)
        }
    }
    @IBAction func reset(){
        answerNumber = 0
        answerLabel.text = String(answerNumber)
    }
    @IBAction func answerButton() {
        if(randomNumber == answerNumber){
            //hintLabel.text = "正解！これは\(language[randomNumber])で\(randomNumber)です！"
            correctAlert()
//            self.navigationController?.popToRootViewController(animated: true)
        }else{
            if(abs(randomNumber - answerNumber) <= 2){
                chikaicorrectAlert()
            }else{
                discorrectAlert ()
            }
        }
    }
    func correctAlert() {
        let alert: UIAlertController = UIAlertController(title: "正解", message: "これは\(language[randomNumber])で\(randomNumber)です！", preferredStyle: .alert)
        let defaultAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler:{
                // ボタンが押された時の処理を書く（クロージャ実装）
                (action: UIAlertAction!) -> Void in
            self.navigationController?.popToRootViewController(animated: true)
            })
            alert.addAction(defaultAction)
        present(alert, animated: true, completion: nil)
    }
    func chikaicorrectAlert() {
        let alert: UIAlertController = UIAlertController(title: "残念", message: "結構近いよ！頑張って。", preferredStyle: .alert)
        let defaultAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler:{
                // ボタンが押された時の処理を書く（クロージャ実装）
                (action: UIAlertAction!) -> Void in
                print("OK")
            })
            alert.addAction(defaultAction)
        present(alert, animated: true, completion: nil)
    }
    func discorrectAlert (){
        let alert: UIAlertController = UIAlertController(title: "残念", message: "まだ結構遠いかも、、", preferredStyle: .alert)
        let defaultAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler:{
                // ボタンが押された時の処理を書く（クロージャ実装）
                (action: UIAlertAction!) -> Void in
                print("OK")
            })
            alert.addAction(defaultAction)
        present(alert, animated: true, completion: nil)
    }
}
