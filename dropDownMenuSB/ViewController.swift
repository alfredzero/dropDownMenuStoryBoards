import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var btnDrop: UIButton!
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var btnShow: UIButton!
    
    @IBOutlet weak var expandingTable: NSLayoutConstraint!
    
    @IBOutlet weak var lbl: UILabel!
    var fruitList = ["Orange", "Banana", "Apple", "Blueberry", "Mango", "Cherry", "Grape", "Strawberry"]
    
    override func viewDidLoad() {

        super.viewDidLoad()
        tblView.delegate = self
        tblView.dataSource = self
        tblView.reloadData()
        tblView.isHidden = true
        lbl.isHidden = true
        lbl.text = "This is Simple Drop Down"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onClickDropButton(_ sender: Any) {
        animate(toogle: tblView.isHidden, type: btnDrop)
    }
    
    @IBAction func onClickShow(_ sender: Any) {
        animate(toogle: lbl.isHidden, type: btnShow)
    }
    
    func animate(toogle: Bool, type: UIButton) {
        UIView.animate(withDuration: 0.3) {
            if type == self.btnDrop {
                if toogle {
                    self.expandingTable.constant = self.tblView.contentSize.height
                    self.tblView.isHidden = false
                } else {
                    self.expandingTable.constant = 0
                    self.tblView.isHidden = true
                }
            } else if type == self.btnShow {
                self.lbl.isHidden = !toogle
            }
            self.view.layoutIfNeeded()
        }
    }
    
    // MARK: - UITableView DataSource and Delegate Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fruitList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = fruitList[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        btnDrop.setTitle(fruitList[indexPath.row], for: .normal)
        animate(toogle: false, type: btnDrop)
    }
}
