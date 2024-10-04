//
//  FeatureViewController.swift
//  MyApp
//
//  Created by Radha Devi H on 03/10/24.
//

import Foundation
import UIKit
import ComposableArchitecture

class FeatureViewController: UIViewController {
	let store: StoreOf<Feature>
	
	init(store: StoreOf<Feature>) {
		self.store = store
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let countLabel = UILabel()
		let decrementButton = UIButton()
		let incrementButton = UIButton()
		let factLabel = UILabel()
		
		// Omitted: Add subviews and set up constraints...
		
		observe { [weak self] in
			guard let self
			else { return }
			
			countLabel.text = "\(String(describing: self.store.text))"
			factLabel.text = self.store.numberFact
		}
	}
	
	@objc private func incrementButtonTapped() {
		self.store.send(.incrementButtonTapped)
	}
	@objc private func decrementButtonTapped() {
		self.store.send(.decrementButtonTapped)
	}
	@objc private func factButtonTapped() {
		self.store.send(.numberFactButtonTapped)
	}
}
