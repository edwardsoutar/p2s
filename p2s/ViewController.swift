import UIKit
import MapKit

protocol HandleMapSearch: class {
    func dropPinZoomIn(_ placemark:MKPlacemark)
}

class ViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var searchText: UITextField!
    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet var mapView: MKMapView!
    
    var matchingItems: [MKMapItem] = [MKMapItem]()
    
    @IBAction func textFieldReturn(_ sender: Any) {
        
        _ = (sender as AnyObject).resignFirstResponder()
        mapView.removeAnnotations(mapView.annotations)
        self.performSearch()
    }

    override func viewDidLoad() {
        
        super.viewDidLoad()
        mapView.showsUserLocation = true
        
        sideMenu()

    }
    
    override func didReceiveMemoryWarning() {
       
        super.didReceiveMemoryWarning()
        
    }
    
    func performSearch() {
        
        matchingItems.removeAll()
        let request = MKLocalSearchRequest()
        request.naturalLanguageQuery = searchText.text
        request.region = mapView.region
        
        let search = MKLocalSearch(request: request)
        
        search.start(completionHandler: {(response, error) in
            
            if error != nil {
                print("Error occured in search: \(error!.localizedDescription)")
            } else if response!.mapItems.count == 0 {
                print("No matches found")
            } else {
                print("Matches found")
                
                for item in response!.mapItems {
                    
                    self.matchingItems.append(item as MKMapItem)
                    print("Matching items = \(self.matchingItems.count)")
                    
                    let annotation = MKPointAnnotation()
                    annotation.coordinate = item.placemark.coordinate
                    annotation.title = item.name
                    self.mapView.addAnnotation(annotation)
                }
            }
        })
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        //self.performSegue(withIdentifier: "loginView", sender: self)
    }
    
    @IBAction func logoutButtonTapped(_ sender: Any) {
        
    }
    
    
    func sideMenu() {
        
        if revealViewController() != nil {
            
            menuButton.target = revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            revealViewController().rearViewRevealWidth = 275
            revealViewController().rightViewRevealWidth = 160
            
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            
        }
    }
}


