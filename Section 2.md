## Chapter 9: Table Views



- A **Table View** shows a list of thing. The three screens above all use a table view. In fact, all of this app's screens use table views.
- The **navigation controller** allows you to build a herarchy of screens that lead from one screen to another. It adds a navigation bar at the top with a title and a back button.



~~~SWIFT
class ViewController: UIViewController {
  ...
}

->

class ChecklistViewController: UITableViewController { 
	...
}
~~~

- With this change you tell the Swift compiler that your view controller is now a *UITableViewController* object instead of regular UIViewcontroller.
- Remember that everything starting with "UI" is part of UIKit.



> The anatomy of a table view

- A UITableView object displays a list of items.
- There are two style of tables: "plain" and "grouped". They mostly the same, but there are a few small diffferences. 
- The most visible difference is that rows in the grouped style table are placed into boxes on a light gray background.

<img width="658" alt="스크린샷 2019-11-20 오전 3 23 49" src="https://user-images.githubusercontent.com/48345308/69174440-2d5dea80-0b45-11ea-833f-0aaaebac035d.png">

- The plain style is used for rows that all represent something similar, such as contacts in an address book where each row contains the name of one person.
- The grouped style is used when the items in the list can be organized by a particular attribute, like book categories for a list of books.
- Tables display their data in **cells**. A cell is related to a row but it's not exactly the same. A cell is a view that shows a row of data that happens to be visible at that moment.



- *reuse identifier* is an internal name that the table view uses to find free cells to reuse when rows scroll off the screen and new rows must become visible.
- The table needs to assign cells for those new rows, and recycling existing cells is more efficient than creating new cells. This technique is what makes table views scroll smoothly.



> Protocols

- Its a standard set of methods that a class must adhere to - a protocol to be followed, so to speak.
- It allows code to be written in such a way that you know that a given class would implement certain methods (with specific parameter of a given type) but where you don't need to know all the implementation details of the class - such as all it's methods.
- The *data source* is the link between your data and the table view. Usually, the view controller plays the role of data source and implements the necessary methods. So, essentially, the view controller is acting as a delegate on behalf of the table view.
- The return value is often called the *result* of the method.



> Method signatures

- The method signature identifies where each parameter would be (and the parameter name, where necessary) by seperating out the parameters with a colon.

- ~~~swift
  tableView(_: numberOfRowsInSection:)
  ~~~

- for example, you might notice an underscore for the first parameter - that means that that method does not need to have the parameter name specified when calling the method - it is simply a convenience in Swift where the parameter can generally be inferred from the method name.

- **tableView** is not the method name - or rather, tableView by itself is not the method name. The method name is the tableView plus the parameter list.

- **IndexPath** is simply an object that points to a specific row in the table. When the table view asks the data source for a cell, you can look at the row number inside the indexPath.row property to find out the row for which the cell is intended.



> Special comments

~~~swift
// MARK:- Table View Data Source
~~~

- As the keyword at the beginning of the comment line, MARK, indicates, it is a marker.
- It's a marker to organize the code and for you to find a section of code(for example, a set of related methods, like for the table view data source) via the Xcode Jump Bar.
- If you pt in a hyphen(-), you get a seperator line followed by any text after the hypen as the section title.
- TODO: and FIXME: , The first is generally used to indicate portions of your code that need to be completed, while the latter is used to mark portions of code that need re-writing or fixing.



> Putting row data into the cells

- A *tag* is a numeric identifier that you can gice to a user interface control in order to uniquely identify it later.



**delegate**

- The concept of delegation is very common in iOS. An object will often rely on another object to help it out with certain tasks. 
- This seperation of concerns keeps the system simple, as each object does only what it is good at and lets other objects take care of the rest.
- Because every app has its own requirements for what its data looks like, the table view must be able to deal with lots of different types of data. Instead of making the table view very complex or requiring that you modify it to suit your own apps, the UIKit designers have chosen to delegate the duty of providing cells to display to another object ,the data source.
- Usually, components will have just one delegate. But the table view splits up its delegate duties into two seperate helpers: the **UITableViewDataSource** for putting rows in the table, and the **UITableViewDelegate** for handling taps on the rows and several other tasks.



## Chapter 10: The Data Model

> Model-View-Controller

- MVC is one of the tree fundamental design patterns of iOS. (delegation, target-action)
- Generally, a view controller handles one screen of the app. If your app has more than one screen, each of these is handled by its own view controller and has its own vies. 
- The Model-View-Controller pattern states that the object in your app can be split into three groups:
  - **Model Objects** : These objects contain your data and any operations on the data. The operations that the data model objects perform are sometimes called the *business rules* or the *domain logic*.
  - **View objects** : These make up the visual part of the app: images, buttons, labels, text fields, and so on. 
  - **Controller objects** : The controller is the object that connects your data model objects to the views. On iOS, the controller is called the "view controller".

<img width="363" alt="스크린샷 2019-11-21 오전 12 42 37" src="https://user-images.githubusercontent.com/48345308/69253327-d2d19680-0bf7-11ea-856f-f7aa8333a4b8.png">



<img width="590" alt="스크린샷 2019-11-21 오전 12 45 43" src="https://user-images.githubusercontent.com/48345308/69253607-42478600-0bf8-11ea-993d-8b3c069ced6b.png">



> Views vs view controllers

- Remember that a view and a view controller are two different things
- A *View* is an object that draws something on the screen, such as button or a lable. The view is what you see.
- The *View controller* is what does the work behind the sreens. It is the bridge that sits between your data model and the views.



> Arrays

- An **array** is an ordered list of objects. If you think of a variable as a container of one value(or one object) than an array is a container for multiple objects.
- The object inside an array are indexed by numbers, starting at 0 as usual.
- The array is *ordered*, meaning that the order of the object it contains matter. The object at index 0 always comes before the object at index 1.



- The process for cleaning up code is called *refactoring* and it's a cycle that never ends.



## Chapter 11: Navigation Controllers



> Displaying large titles

- With iOS 11, Apple introduced a new navigation bar design with large titles.

~~~swift
// add the following line to viewDidLoad
navigationController?.navigationBar.prefersLargeTitles = true
~~~

- Apple does not recommend using large titles for all of your screens. Rather, their recommendation is to use large titles on your main screen and any other subsequent sreens where it might make sense to have a prominent title.



> Destroying objects

- When you call items.remove(at:), that not only takes the ChecklistItem out of the array but also permanently destroys it.
- If there are no more references to an object, it is automatically destroyed.
- When you pull that ChecklistItem out of the array, the reference goes away and the object is destroyed. Or in compute-speak, it is *deallocated.*
- If the object is deallocated, that memory becomes avaliable again and will eventually be occupied by new objects. After it has been deleted, the object does not exist in memory any more and you can no longer use it.
- On older versions of iOS, you had to take care of this memory management by hand.
- But now, Swift uses a mechanism called **Automatic Reference Counting, or ARC**, to manage the lifetime of the objects in your app.



> Segue types

- When showing the new view controller above, you opted for a Show segue.

Examples)

- **Show** : Pushes the new view controller onto the navigation stack so that the new view controller is at the top of the navigation stack.(Navigation folders in the Mail app)
- **Show Detail** : For use in a split view controller. The new view controller replaces the detail view controller of the split view when in an expanded two-column interface. (In Messages, tapping a conversation will show the conversation details)
- **Present Modally** : Presents the new view controller to cover the previous view controller. (Selecting Touch ID & Passcode in Settings.)
- **Present as Popover** : When run on an iPad, the new view controller appears in a popover, and tapping anywhere outside of this popover will dismiss it. (Tapping the + button in Calendar)
- **Custom** : Allows you to implement your own custom segue and have control over its behavior.





- The navigation controller is a specaial type of view controller that acts as a container for other view controllers.
- It comes with a navigation bar and has the ability to easily go from one screen to another, by sliding them in and out of sight.



## Chapter 12: Add Item Screen



> Static table cells

- Table View는 static cell과 dynamic cell이 있다.
- Static은 말그대로 정적인 테이블뷰로서 파워포인트 그리듯이 스토리보드에서 형태와 내용을 입력하면 그대로 출력되게 된다.
- Dynamic은 반대로 데이터를 입력 받아서 내용과 형태가 바뀌는 동적인 셀이다.
- 예를 들어, 아이폰의 설정 화면은 Static cell 이고, 페이스북의 feed들은 Dynamic cell이다.
- You use static cells when you know beforehand how many sections and rows the table view will have.
- With static cells, you can design the rows directly in the storyboard. 
- For a table with static cells you don't need to provide a data source, and you can hook up the labels and other controls from the cells directly to outlets on the view controller.



> Returning to sender

- You use *return* to send a value from a method back to the method that called it.

<img width="533" alt="스크린샷 2019-11-21 오전 3 12 03" src="https://user-images.githubusercontent.com/48345308/69265494-b2600700-0c0c-11ea-8caa-7c46ae6779bc.png">

- Methods call other methods and receive values in return.
- You cannot return any value. The value you return must be of the data type that is specified after the -> arrow that follows the method name.

~~~swift
override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
    return nil
}
~~~

- That's what the ? behind IndexPath is for: The question mark tells the Swift compiler that you can also return nil from this method.
- Note that returning nil from a method is only allowed if there is a question mark behind the return type.
- A type declaration with a question mark behind it is known as an **optional.**
- The special value nil represents "no value" but it's used to mean different things throughout the iOS SDK. Sometimes it means "*nothing found* or "*don't do anything*.



> Becoming a delegate

- Delegates are used everywhere in the iOS SDK, so it's good to remember that it always takes three steps to become a delegate.

  1) You declare yourself capable of being a delegate. To become the delegate for UITextField you need to include UITextFieldDelegate in the class line for the view controller. This tells the complier that this particular view controller can actually handle the notification messages that the text field sends to it.

  2) You let the object in question, in this case the UITextField, know that the view controller wishes to become its delegate. If you forget to tell the text field that it has a delegate, it will never send you any notifications.

  3) Implement the delegate methods. 



> NSRange vs Range and NSString vs String

~~~swift
func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    let oldText = textField.text!
    let stringRange = Range(range, in:oldText)!
    let newText = oldText.replacingCharacters(in: stringRange, with: string)
    
    if newText.isEmpty {
      doneBarButton.isEnabled = false
    } else {
      doneBarButton.isEnabled = true
    }
   	return true
  }
~~~

- In the above code, you get a parameter as NSRange and you convert it to a Range value.
- A range object gives you a range of values, or in this case, a range of characters - with a lower bound and an upper bound.
- So, why did we convert the original NSRange value to a Range value? 
  - NSRange is an Objective-C structure whereas Range is its Swift equivalent - they are simila, but not exactly the same.
  - So, while an NSRange parameter is used by the UITextField in its delegate method, in our Swift code, if we wanted to do any String operations, such as replacingCharacters, then we need a Range value instead.
  - Swift methods generally use Range values and do not understand NSRange values, which is why we coverted the NSRange value to a Swift-understandable Range value.
- Another example is Array and its Objective-C counterparts NSArray.



## Chapter 13: Delegates & Protocols



> The delegate way

- The delegate pattern is commonly used to handle the situation you find yourself in: Screen A opens Screen B.
- At some point screen B needs to communicate back to screen A, usually when it closes. 
- The solution is to make screen A the delegate of screen B, so that B can send its messages to A whenever it needs to.

<img width="354" alt="스크린샷 2019-11-21 오전 5 08 47" src="https://user-images.githubusercontent.com/48345308/69274102-02df6080-0c1d-11ea-89e6-3147738b32af.png">

- The cool thing about the delegate pattern is that screen B doesn't really know anything about screen A.
- It just knows that some object is its delegate, but doesn't really care who that is. Just like how UITableView doesn't really care about your view controller, only that it delivers table view cells when the table view asks for them.
- This principle, where screen B is independent of screen A and yet can still talk to it, is called *loose coupling* and is considered good software design practice!

<img width="477" alt="스크린샷 2019-11-21 오전 5 13 50" src="https://user-images.githubusercontent.com/48345308/69274446-b6e0eb80-0c1d-11ea-9ec1-56f26a8b2046.png">

- Delegates go hand-in-hand with protocols, a prominent feature of the Swift language.



> The delegate protocol

~~~swift
protocol AddItemViewControllerDelegate: class {
  func addItemViewControllerDidCancel(_ controller: AddItemViewController)
  func addItemViewController(_ controller: AddItemViewController, didFinishAdding item: ChecklistItem)
}
~~~

- This defines the AddItemViewControllerDelegate protocol.
- You should recognize the lines inside the protocol {...} blocks as method declarations.
- The protocol just lists the names of the methods.
- From then on, you can refer to ChecklistViewController using the protocol name, instead of class name.
- It is customary for the delegate methods to have a reference to their owner as the first(or only) parameter.



- 프로토콜을 선언하고 뒤에 : class를 붙이는 이유
  - protocol을 선언하는 것이 class를 선언할 때와 비슷하다.
  - You can have one protocol inherit from another protocol. But you can also specify a particular type of object which can adopt your protocl.
  - The *class* keyword identifies that we want the AddItemViewControllerDelegate protocl to be limited to class types.



> Protocols

- In Swift, a protocol doesn't have anything to do with computer networks or meeting royalty. It is simply a name for a group of methods.
- A protocol normally doesn't implement any of the methods it declares.



> Notifying the delegate

~~~swift
weak var delegate: AddItemViewControllerDelegate?
~~~

- Delegates are usually declared as being *weak* - not a statement of their moral character but a way to describe the relationship between the view controller and its delegate.
- Delegates are also optional.
- You may be wondering why the delegate would ever be nil.
  1. Often, delegates are truly optional; a UITableView works fine even if you don't implement any of its delegate method.
  2. More importantly, when AddItemViewController is loaded from the storyboard and instantiated(예시), it won't know right away who its delegate is. Between the time the view controller is loaded and the delegate is assigned, the delegate variable will be nil. And variables that can be nil, even if it is only temporary, must be optionals. (**중요)**



> Optionals

- Variables and constants in Swift must alyways have a value.
- In other programming languages the special symbol nil or NULL is often used to indicate that a variable has no value.
- Sometimes a variable does need to have "no value". In that case you can make it an *optional*.
- Only variables that are made optional can have the value nil.

~~~swift
delegate?.addItemViewControllerDidCancel(self)
~~~

- Here the ? tells Swift not to send the message if delegate is nil. -> Is there a delegate? Then send the messages.
- This practice is called *optional chaining* and it's used a lot in Swift.