

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var myArray: [Articles] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.callArticleAPI()
    }
}

//MARK: - UITableViewDataSource,UITableViewDelegate
extension ViewController : UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableCell
        
        cell.titleLabel.text = self.myArray[indexPath.row].title
        cell.authorLabel.text = self.myArray[indexPath.row].author
        cell.DescriptionLabel.text = self.myArray[indexPath.row].description
        
        //Mark:- For Shadows on Cells.
        
        cell.layer.cornerRadius = 10
        let shadowPath2 = UIBezierPath(rect: cell.bounds)
        cell.layer.masksToBounds = false
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOffset = CGSize(width: CGFloat(1.0), height: CGFloat(3.0))
        cell.layer.shadowOpacity = 0.5
        cell.layer.shadowPath = shadowPath2.cgPath
        
        //MARK:- for animations on cells
        
        cell.layer.transform = CATransform3DMakeScale(0.1,0.1,1)
        UIView.animate(withDuration: 0.9, animations: {
            cell.layer.transform = CATransform3DMakeScale(1.05,1.05,1)
        },completion: { finished in
            UIView.animate(withDuration: 0.9, animations: {
                cell.layer.transform = CATransform3DMakeScale(1,1,1)
            })
        })
     
        if let gimage = myArray[indexPath.row].urlToImage {
            let data = try? Data(contentsOf: gimage)
            let image: UIImage = UIImage(data: data!)!
            cell.middleimageView.image = image
        }
        
      return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
}

//MARK: - API calls
extension ViewController {
    func  callArticleAPI() {
        APICaller.shared.fetchData(){ (success, message, newsArticles) in
            if success {
                guard let articleArr = newsArticles?.articles else {
                    print(message)
                    return
                }
                self.myArray = articleArr
                DispatchQueue.main.async(execute: {
                    self.tableView.reloadData()
                })
            } else {
                print(message)
            }
        }
    }
}





