import UIKit
import RxSwift

class SignupViewController: UIViewController {
	
	// MARK: - Variables
    private let viewModel = SignupViewModel()
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.signupValidationSubject.observeOn(MainScheduler.instance)
            .subscribe(onNext: {signupValidation in
            	// RECEIVED
            }, onError: {error in
                // ERROR
            })
        .disposed(by: disposeBag)
    }

    // MARK: - Actions
    @IBAction func onCreateAccountTapped(_ sender: UIButton) {

    	let signupModel = SignupModel(displayName: displayName.text ?? "", email: emailAddress.text ?? "", password: password.text ?? "", confirmPassword: confirmPassword.text ?? "")
    	
    	viewModel.validateSignupForm(signupModel: signupModel)
    }

}