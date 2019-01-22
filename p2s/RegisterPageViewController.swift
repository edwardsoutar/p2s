import UIKit

class RegisterPageViewController: UIViewController {

    
    @IBOutlet weak var userFirstNameTextField: UITextField!
    @IBOutlet weak var userLastNameTextField: UITextField!
    @IBOutlet weak var userEmailTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func registerButtonTapped(_ sender: Any) {
        
        let userFirstName = userFirstNameTextField.text;
        let userLastName = userLastNameTextField.text;
        let userEmail = userEmailTextField.text;
        let userPassword = userPasswordTextField.text;
        let userConfirmPassword = confirmPasswordTextField.text;
        
        //Check for empty fields
        
        if((userFirstName?.isEmpty)! || (userLastName?.isEmpty)! || (userEmail?.isEmpty)! || (userPassword?.isEmpty)! || (userConfirmPassword?.isEmpty)!) {
            
            //Display alert message
            displayMyAlertMessage(userMessage: "All fields are required")
            
            return
        
    }
    
        //Check passwords match
        
        if(userPassword != userConfirmPassword) {
            
            displayMyAlertMessage(userMessage: "Passwords do not match")
            
            return
            
        }
        
        //Store data
        
        
        
        //Display alert message with confirmation
        
        var myAlert = UIAlertController(title:"Alert", message: "Registration successful", preferredStyle: UIAlertControllerStyle.alert)
        
        let okButtonAlertAction = UIAlertAction(title:"Ok", style: UIAlertActionStyle.default){ action in
            self.dismiss(animated: true, completion:nil)
        }
        
        myAlert.addAction(okButtonAlertAction)
        
        self.present(myAlert, animated: true, completion: nil)
    
    }
    
    func displayMyAlertMessage(userMessage:String){
        
        var myAlert = UIAlertController(title:"Alert", message: userMessage, preferredStyle: UIAlertControllerStyle.alert)
        
        let okButtonAlertAction = UIAlertAction(title:"Ok", style: UIAlertActionStyle.default, handler:nil)
        
        myAlert.addAction(okButtonAlertAction)
        
        self.present(myAlert, animated:true, completion:nil)
        
    }
}
