
import UIKit

class StoreItemListTableViewController: UITableViewController {
    
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var filterSegmentedControl: UISegmentedControl!
    
    // add item controller property
    
    var items = [StoreItem]()
    let queryOptions = ["movie", "music", "software", "ebook"]
    var storeItemController = StoreItemController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func fetchMatchingItems() {
        
        self.items = []
        self.tableView.reloadData()
        
        let searchTerm = searchBar.text ?? ""
        let mediaType = queryOptions[filterSegmentedControl.selectedSegmentIndex]
        
        if !searchTerm.isEmpty {
            let queryDictionary: [String: String] = [
                "term": searchTerm,
                "media": mediaType,
                "limit": "50",
                "lang": "en_us"
                ]
            
            storeItemController.fetchItems(matching: queryDictionary) { (storeItem) in
                if let storeItem = storeItem {
                    DispatchQueue.main.async {
                        self.items.append(contentsOf: storeItem)
                        self.tableView.reloadData()
                    }
                } else {
                    print("An error occurred when trying to retrieve the data")
                }
            }
        }
    }
    
    func configure(cell: UITableViewCell, forItemAt indexPath: IndexPath) {
        
        let item = items[indexPath.row]
        
        cell.textLabel?.text = item.song
        cell.detailTextLabel?.text = "\(item.name) - \(item.album)"
        
        // set label to the item's name
        // set detail label to the item's subtitle
        // reset the image view to the gray image
        let task = URLSession.shared.dataTask(with: item.artworkURL) { (data, response, error) in
            guard let data = data,
                let artwork = UIImage(data: data) else { return }
            DispatchQueue.main.async {
                cell.imageView?.image = artwork
                }
            }
        task.resume()
        }
        // initialize a network task to fetch the item's artwork
        // if successful, use the main queue capture the cell, to initialize a UIImage, and set the cell's image view's image to the 
        // resume the task
    
    @IBAction func filterOptionUpdated(_ sender: UISegmentedControl) {
        
        fetchMatchingItems()
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath)
        configure(cell: cell, forItemAt: indexPath)

        return cell
    }
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension StoreItemListTableViewController: UISearchBarDelegate {

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        fetchMatchingItems()
        searchBar.resignFirstResponder()
    }
}
