//
//  ViewController.swift
//  ButtonCombineMVVM
//
//  Created by Вячеслав Квашнин on 13.05.2022.
//

import UIKit
import Combine

final class ViewController: UIViewController {

    @IBOutlet weak var switchSubscriber: UISwitch!
    @IBOutlet weak var submitButton: UIButton!
    
    private var cancellabel: AnyCancellable?
    private var viewModel = FormViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cancellabel = viewModel.$isSubmitAllowed
            .receive(on: DispatchQueue.main)
            .assign(to: \.isEnabled, on: submitButton)
    }
    
    @IBAction func didSwitch(_ sender: Any) {
        viewModel.isSubmitAllowed = (sender as AnyObject).isOn
    }
}

