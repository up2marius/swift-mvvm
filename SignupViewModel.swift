import Foundation
import RxSwift

class SignupViewModel {
    
    var signupValidationSubject: PublishSubject<SignupValidation> = PublishSubject.init()
    
    func validateSignupForm(signupModel: SignupModel) -> Void {
    	let signupValidation = SignupValidation()
    	// Validate the form here
        signupValidationSubject.onNext(signupValidation)
    }
}
