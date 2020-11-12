import UIKit
import PlaygroundSupport


let liveViewFrame = CGRect(x: 0, y: 0, width: 500, height: 500)
let liveView = UIView(frame: liveViewFrame)
liveView.backgroundColor = .white

PlaygroundPage.current.liveView = liveView

// Adding a subview
let smallFrame = CGRect(x: 0, y: 0, width: 100, height: 100)
let square = UIView(frame: smallFrame)
square.backgroundColor = .purple
liveView.addSubview(square)

// Adding my first animation
//UIView.animate(withDuration: 3.0) {
//    square.backgroundColor = .orange
//    square.center = CGPoint(x: liveViewFrame.width / 2, y: liveViewFrame.height / 2)
//}


//UIView.animate(withDuration: 3.0, animations: {
//    square.backgroundColor = .orange
//    square.frame = CGRect(x: 150, y: 150, width: 200, height: 200)
//}) { (_) in
//    UIView.animate(withDuration: 3.0) {
//        square.backgroundColor = .purple
//        square.frame = smallFrame
//    }
//}

// Adding delay and custom options
//func myAnimation() -> Void {
//    square.backgroundColor = .orange
//    square.frame = CGRect(x: 400, y: 400, width: 100, height: 100)
//}
// This function was built only to test if I could substitute the closure for a function. I am really starting to like closures, they really speed up the process of coding.

//UIView.animate(withDuration: 3.0, delay: 2.0, options: [.repeat], animations: {
//    square.backgroundColor = .orange
//    square.frame = CGRect(x: 400, y: 400, width: 100, height: 100)
//}, completion: nil)



UIView.animate(withDuration: 2.0) {
    square.backgroundColor = .orange
    
    let scaleTransform = CGAffineTransform(scaleX: 2.0, y: 2.0)
    let rotateTransform = CGAffineTransform(rotationAngle: .pi)
    let translateTransform = CGAffineTransform(translationX: 200, y: 200)
    
    let comboTransform = rotateTransform.concatenating(scaleTransform).concatenating(translateTransform)
    
    square.transform = comboTransform
}


// ANIMATE CONSTRAINTS
// Not only can you animate the properties of a UIView, every constraint (which is a NSLayoutConstraint) has a constant property that can be animated. In order to modify a constraint, you need to have a reference to it in code. Similar to creating outlets to views, you can create an outlet for a constraint.

// @IBOutlet var widthConstraint: NSLayoutConstraint!
// To update a constraint, modify the constant value. In the following example, imagine you have a view whose width is defined by widthConstraint. When buttonTapped(_:) method is called, the constraint's constant is set to 320, which will update the width the next time that the screen is redrawn

// @IBAction func buttonPressed(_ sender: UIButton) {
//      widthConstraint.constant = 320
// }

// In order to animate the change in width, iOS needs to be given the instruction to adjust width over time. To do this, call layoutIfNeeded() on the parent view inside an animation closure. This layoutIfNeeded() method tells the receiver to layout its subviews, and doing so within an animation will adjust the layout over a given time

// @IBAction func buttonPressed(_ sender: UIButton) {
//      widthConstraint.constant = 320
//      UIView.animate(withDuration: 0.5) {
//          self.view.layoutIfNeeded()
//      }
// }

// When should you animate constraints instead of modifying the frame or transform properties? Changing the view properties will not modify the position and size of other views on the screen. If, however, you have a series of views whose positions and sizes are based on one another AND ALL VIEWS SHOULD UPDATE to reflect new constraint values, you should animate the constraints.
