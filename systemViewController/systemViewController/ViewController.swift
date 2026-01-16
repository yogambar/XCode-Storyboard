//
//  ViewController.swift
//  systemViewController
//
//  Created by GEU on 15/01/26.
//

import UIKit
import SafariServices
import MessageUI

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, MFMailComposeViewControllerDelegate{
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else {
            return
        }
        imageView.image = image
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: (any Error)?) {
        print("I am Working!")
        dismiss(animated: true)
    }

    @IBAction func shareButtonTapped(_ sender: Any) {
        guard let image = imageView.image else {
            return
        }
        let activityViewController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = sender as? UIView //only for ipad, no effect on iphone
        present(activityViewController, animated: true)
    }
    
    @IBAction func safariButtonTapped(_ sender: Any) {
        guard let url = URL(string:"https://developer.apple.com")
                else { return }
        let safariViewController = SFSafariViewController(url: url)
        safariViewController.modalPresentationStyle = .popover
        present(safariViewController, animated: true)
    }
    
    @IBAction func alertButtonTapped(_ sender: Any) {
        let alertViewController = UIAlertController(title: "Alert", message: "Do you wish to proceed?", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) {
            _ in print("Cancelled")
        }
        let yesAction = UIAlertAction(title: "Yes", style: .default) {
            _ in print("Proceed")
        }
        let noAction = UIAlertAction(title: "No", style: .destructive) {
            _ in print("Deletion")
        }
        alertViewController.addAction(cancelAction)
        alertViewController.addAction(yesAction)
        alertViewController.addAction(noAction)
        present(alertViewController, animated: true)
    }
    
    @IBAction func photoButtonTapped(_ sender: Any) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = .photoLibrary
        present(imagePickerController, animated: true)
    }
    
    @IBAction func mailButtonTapped(_ sender: Any) {
        let mailComposeViewController = MFMailComposeViewController()
        mailComposeViewController.mailComposeDelegate = self
        mailComposeViewController.setToRecipients(["abc123@gmail.com"])
        mailComposeViewController.setSubject( "Testing Swift Mail" )
        mailComposeViewController.setMessageBody("This is a test email", isHTML: false)
        if MFMailComposeViewController.canSendMail() {
            present(mailComposeViewController, animated: true)
        }
        else {
            print("Can't send mail")
        }
    }
    
}

