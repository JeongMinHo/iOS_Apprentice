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
- Force unwrapping is the simplest way to deal with optionals, but it comes with some danger: if you're wrong and the optional is nil, the app will crash. Use with caution!



> Delegates in five easy steps

These are the steps for setting up the delegate pattern between two objects, where object A is the delegate for object B, and object B will send messages back to A.

1. Define a delegate protocol for object B
2. Give object B an optional delegate variable. This variable should be weak.
3. Update object B to send messages to its delegate when something interesting happens, such as the user pressing the Cancel or Done buttons, or when it needs a piece of information. You write delegate?.methodName(self, ...)
4. Make object A conform to the delegate protocol. It should put the name of the protocol in its class line and implement the methods from the protocol.
5. Tell object B that object A is now its delegate.



> Weak

- Relationships between objects can be weak or strong.
- You use weak relationships to avoid what is known as an *ownership cycle.*
- When object A has a strong reference to object B, and at the same time object B also has a strong reference back to A, then these two objects are involoved in a dangerous kind of romance : an ownership cycle.

<img width="323" alt="스크린샷 2019-11-23 오전 12 23 28" src="https://user-images.githubusercontent.com/48345308/69437900-7b623080-0d87-11ea-9a58-33e575b17e12.png">

- To avoid ownership cycles you. can make one of these references **weak**.
- In the case of a view controller and its delegate, screen A usually has a strong reference to screen B, but B only has a weak reference back to its delegate A.

<img width="369" alt="스크린샷 2019-11-23 오전 12 25 16" src="https://user-images.githubusercontent.com/48345308/69438023-ba908180-0d87-11ea-84d0-4a1313bb2257.png">

- Such cycles can occure in other situations too, but they are most common with delegates. Therefore, delegates are always maed weak.
- There is another relationship type, *unowned*, that is similar to weak and can be used for delegates too. The difference is that weak variables are allowed to become nil again.
- *@IBOutlets* are usually also declared with the weak keyworld. This isn't done to avoid an ownership cycle, but to make it clear that the view controller isn't really the owner of the views from the outlets.



## Chapter 14: Edit Items



> if let

- *Unwrap the optional*

~~~swift
if let temporaryConstant = optionalVariable {
  // temporaryConstant now contains the unwrapped value of the 
  // optional variable. temporaryConstant is only avaliable from 
  // within this if block.
}
~~~



> Sending data between view controllers

- We've talkded about screen B(the Add/Edit Item screen) passing data back to screen A(the Checklist screen) via delegates.
- But here, you're passing a piece of data the other way around - from screen A to screen B - namely, the ChecklistItem to edit.



- Data transfer between view controllers works two ways:

  1) From A to B. When screen A opens screen B, A can give B the data it needs. You simply make a new instance variable in B's view controller. Screen A then puts an object into this property right before it makes screen B visible, usually in prepare(for:sender:).

  2) Form B to A. To pass data back from B to A you use a delegate.

<img width="383" alt="스크린샷 2019-11-26 오전 1 37 08" src="https://user-images.githubusercontent.com/48345308/69559413-435c2700-0fed-11ea-8f44-20d9d371fb62.png">



- Making iOS apps is all about creating view controllers and sending messages between them, so you want this to become second nature.



> Renaming the view controller

- Most IDEs(or Integrated Development Environments) such as Xcode have a feature named *refactoring* , which allows you to change the name of a class, method, or variable throughtout the entire project, safely.



## Chapter 15: Saving & Loading



> The need for data persistence

- Thanks to the multitasking nature of iOS, an app stays in memory when you close it and go back to the home screen or switch to another app.
- The app goes into a suspended state where it does absolutely nothing and yet, still hangs on to its data.
- During normal usuage, users will never truly terminate an app, just suspend it.
- However, the app can still be terminated when iOS runs out of avaliable working memory, as iOS will terminate any suspended apps in order to free up memory when necenssary.
- You will need to persist this data in a file on the device's long-term flash storage.

<img width="622" alt="스크린샷 2019-11-26 오전 4 26 36" src="https://user-images.githubusercontent.com/48345308/69571238-eff5d300-1004-11ea-9398-382e5dfa8ea2.png">



> The documents folder

- iOS apps live in a sheltered environment known as the *sandbox*.
- Each app has its own folder for storing files but cannot access the directories of files belonging to any other app.
- This is a security measure, designed to prevent malicious software such as viruses from doing any damage.
- Your apps can store files in the "Documents" folder in the app's sandbox.
- The contents of the Document folder are backed up when the user syncs their device with iTunes or iCloud.



> Getting the save file paht

~~~swift
func documentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func dataFilePath() -> URL {
        return documentsDirectory().appendingPathComponent("Checklists.plist")
    }
~~~

- documentsDirectory() method is something i've added for convenience. There is no standard method you can call to get the full path to the Document folder, so I rolled my own. (?)
- The dataFilePath() method uses documentsDirectory() to construct the full path to the file that will store the checklist items. 
- This file is named **Checklists.plist** and it lives inside the Document folder.
- Notice that both methods return a URL object. iOS uses URLs to refer to files in its filesystem. Where websites use http:// or https:// URLs, to refer to a file you use a file:// URL.



<img width="418" alt="스크린샷 2019-11-26 오전 5 03 00" src="https://user-images.githubusercontent.com/48345308/69573717-06525d80-100a-11ea-9da2-74b289e2f0db.png">

- The Documents folder where the app will put its data files. 
- The Library folder has cache files and preferences files. The contents of this folder are managed by the *operating system*.
- The SystemData folder, as the name implies, is for use by the operating system to store any system level information relevant to the app.
- The tmp folder is for temporary files. Sometimes apps need to create files for temporary usage. You don't want these to clutter(어지럽히다) up your Documents folder, so tmp is a good place to put them. iOS will clear out this folder from time to time.



> .plist files

- What is a **.plist** file?
- Info.plist contains several configuration options that give iOS additional information about the app, such as what name to display under the app's icon on the home screen.
- ".plist" stands for Porperty List and it is an XML file format that stores structured data, usually in the form of a list of settings and their values. 
- To save the checklist items, you'll use Swift's *codable* protcol, which lets objects which support the Codable protocol to store themselves in a structured file format.
- When you add a view controller to a storyboard, Xcode uses the NSCoder(codable) system to write this object to a file(encoding).
- Then when your application starts up, it uses NSCoder again to read the objects from the storyboard file(decoding).



<img width="503" alt="스크린샷 2019-11-26 오전 5 16 15" src="https://user-images.githubusercontent.com/48345308/69574588-e9b72500-100b-11ea-89f1-f171da21736e.png">

- The process of converting objects to files and back again is also known as **serialization**.



> Saving data to a file

~~~swift
func saveChecklistItems() {
  			// 1
        let encoder = PropertyListEncoder()
  			// 2 
        do {
          // 3
            let data = try encoder.encode(items)
          // 4
            try data.write(to: dataFilePath(), options: Data.WritingOptions.atomic)
          // 5
        } catch {
          // 6
            print("Eroor encoding item array: \(error.localizedDescription)")
        }
    }
~~~

1. First, create an instance of PropertyListEncoder which will encode the items array, and all the ChecklistItems in it, into some sort of binary data format that can be written to a file.
2. The *do* keyword, which you have not encountered before, sets up a block of code to catch Swift *errors*. Swift handles a errors under certain conditions by *throwing* an error. The do keyword indicates the start of such a block. You will see the error catching code after comment #5, where the *catch* keyword can be seen.
3. The encoder you created earlier is used to try to encode the items array. The encode methods throws a Swift error if it is unable to encode the data for some reason. The try keyword indicates that the call to encode can fail and if that happens, that it will throw an error.
4. If the data constant was successfully created by the call to encode in the previous line, then you write the data to a file using the file path returned by a call to dataFilePath().
5. The catch statement indicates the block of code to be executed if an error was thrown by any line of code in the enclosing do block.
6. Handle the caught error.

- When you create a do-catch block of code, you can explicitly check for specific types of errors.
- Swift will automatically populate a local variable named error, so you can simply refer to that error variable in any code you write in the catch block.



> "NS" objects

- Objects whose name start with the "NS" prefix, like NSObject, NSString, or NSCoder, are provided by the Foundation framework.
- NS stands for **N**ext**S**tep, the operating system from the 1990's that later became Mac OS X and which also forms the basis of iOS.



> Reading data from a file

~~~swift
func loadChecklistItems() {
  			// 1
        let path = dataFilePath()
  			// 2
        if let data = try? Data(contentsOf: path) {
          	// 3
            let decoder = PropertyListDecoder()
            do {
              	// 4
                items = try decoder.decode([ChecklistItem].self, from: data)
            } catch {
                print("Error Decoding item array: \(error.localizedDescription)")
            }
        }
    }
~~~

1. First, you put the results of dateFilePath() in a temporary constant named path.
2. Try to load the contents of Checklist.plist into a new Data object. The try? commands attempts to create the Data object, but returns nil if it fails. That's why you put it in an if let statement.
3. When the app does find a Checklist.plist file, you'll load the entire array and its contents from the file using a PropertyListDecoder. So create the decoder instance.
4. Load the saved data back into items using the decoder's decode methods. The only item of interest here would be the first parameter passed to decode.



> Initializers

- Methods named init are special in Swift.
- They are only used when you're creating new objects, to make those new objects ready for use.

~~~swift
let item = ChecklistItem()
~~~

- Swift first allocates a chunk of memory big enought to hold the new object and then calls ChecklistItem's init() method with no parameters.

- It is pretty comman for objects to have more than one init mehtod. Which one is used depends on the circumstances.

- This is the standard way to write an init method:

  ~~~swift
  init() {
    // Put values into your instance variables and constants.
    super.init()
    // Other initialization code, such as calling methods, goes here.
  }
  ~~~

- Note that unlike other methods, init does not have the func keyword.
- Sometimes you'll see it written as override init or required init?. That is necessary when you're adding the init method to an object that is a subclass of some other object.
- The question mark is for when init? can potentially fail and reuturn a nil value instead of a real object.
- Inside the init method, you first need to make sure that all your instance variable and constants have a value.
- Once you've given all your instance variables and constants values, you call super.init() to initialize the object's superclass.



## Chapter 16: Lists

> The many ways to make table view cells

~~~swift
let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
~~~

- But here you have three separate bits of code to accomplish the same:

~~~swift
// At the top of the class implementation
let cellIdentifier = "ChecklistCell"

// In viewDidLoad
tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)

// Int tableView(_: cellForRowAt:)
let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
~~~

1. Using static cells. Static cells are limited to screens where you know in advance which cells you'll have. The big advantage with static cells is that you don't need to provide any of the data source methods.
2. Using a *nil* file. A nib(also known as a XIB) is like a mini storyboard that only contains a single customized UITablaViewCell object. This is very similar to using prototype cells, except that you can do it outside of a storyboard.

- Sometimes someone creates a new cell for every row rather than trying to reuse cells by dequeing them. Don't do that! 
  - Always ask the table view first whether it has a cell avaliable that can be recycled, using one of the dequeReusableCell methods.
- Creating a new cell for each row will cause your app to slow donw, as object creation is slower than simply re-using an existing object.



> prepare(for: sender: ) method

~~~swift
override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowChecklist" {
            let controller = segue.destination as! ChecklistViewVontroller
            controller.checklist = sender as? Checklist
        }
}
~~~

- prepare(for: sender:) is called right before a segue happens from a view controller. Here you get a chance to set the properties of the new view controller before it becomes visible.
- Inside prepare(for: sender: ), you need to pass the ChecklistViewController the Checklist object from the row that the user tapped. -> that's why you put that object in the sender parameter earlier.

<img width="609" alt="스크린샷 2019-11-27 오전 1 58 01" src="https://user-images.githubusercontent.com/48345308/69655175-59371e00-10b9-11ea-87d5-34945afbcd8b.png">

- This sequence of events is why the checklist property is declared as Checklist!

- You don't have to write if let to unwrap it. Such *implicity unwrapped* optionals should be used sparingly and with care, as they do not have any of the anti-crash protection that normal optionals do.



- Note that passing the Checklist object to the ChecklistViewController does not make a copy of it. 
- You only pass the view controller a *reference* to that object - any changes the user makes to that Checklist objects are also senn by AllListsViewController.



> Typing Casts

~~~swift
override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowChecklist" {
            let controller = segue.destination as! ChecklistViewVontroller
            controller.checklist = sender as? Checklist
        }
    }
~~~

- A **type cast** tells Swift to interpret a value as having a different data type.

- Here, sender has type Any? meaning that it can be any sort of a object: a UIBarButtonItem, a UITableViewCell, or in this case, a Checklist.
- But the controller.checklist property always expects a Checklist object- it wouldn't know what to do with a UITableVieCell... Hence, Swift demands that you only put Checklist objects into the checklisty property.
- By writing sender as? Checklist, you tell Swift that it can safely treat sender as a Checklist object, if it can be used as a Checklist object, or to send nil if there is an issue.
- The main reason you need all these type cast is for interoperability(정보 처리 상호 운용) with the iOS frameworks that are written in Objective-C.
- Swift is less forgiving about types than Objective-C and requires you to be much more explicit about specifying the types of the various data items you work with.



## Chapter 17: Improved Data Model

> Programming language constructs

- Most modern programming languages offer at least the following basic building blocks:

1. The ability to remember values by storing things into variables. Some variables are simple, such as Int and Bool. Others can store objects(ChecklistItem, UIButton) or even collections of objects(Array).
2. The ability to read values from variables and use them for basic arithmetic and comparisons.
3. The ability to make decisions. You've already senn the if statement, but there is also a switch statement that is shorthand for if with may else ifs.
4. The ability to group functionality into units such as methods and functions. You can call those methods and receive back a result value that can you can then use in further computations.
5. The ability to bundle functionality (methods) and data (variables) together into objects.
6. The ability to execute one or more lines of code inside a **do** block and to **catch** and errors thrown via a **try** statement. (Or, to simply bypass the do block by using a try? statement instead.)
7. The ability to repeat a set of statements more than once. This is what the **for** in statement as well: **while** and **repeat**. Endlessly repeating things is what computers are good at.



> Parents and their children

- A parent is an object higher up in some hierarchy; a child is an object lower in the hierarchy.
- In this case, the "hierarchy" represents the navigation flow between the different screens of the app.

<img width="582" alt="스크린샷 2019-11-27 오후 11 33 47" src="https://user-images.githubusercontent.com/48345308/69732102-5e09d980-116e-11ea-8ee1-fb0fb04fb78b.png">



> Save changes one app termination

- The ideal place for handling app termination notification is inside the **application delegate.**
- As its name implies, it is the delegate object for notifications that concern the app as a whole.
- This is where you receive the "app will terminate" and "app will be suspended" notifications.



- Objects that you define with the keyworld *class* are reference types. 
- The variable or constant does not contain the actual object, only a reference to the object - the reference is simply the memory location where the object is stored.



## Chapter 18: UserDefaults

- Yo could store this information in the Checklist.plist file, but for simple settings such as this, there is another option - the **UserDefaults** objects.
- UsrDefaults works like a *dictionary*, which is a collection object for storing key-value pairs.

<img width="339" alt="스크린샷 2019-11-28 오전 4 02 31" src="https://user-images.githubusercontent.com/48345308/69752130-e9499600-1193-11ea-82fb-fa595895c83d.png">

- You can put objects into the dictionary under a reference key and then retrieve it later using that key. That is, in fact, how Info.plist works.
- The Info.plist file is read into a dictionary and then iOS uses the various keys to obtain the values. Keys are usually strings but values can be any type of object.
- To be accurate, UserDefaults isn't a true dictionary, but it certainly acts like one.
- When you insert new values into UserDefaults , they are saved somewhere in your app's sandbox. So, these values persist even after the app terminates.



> Equal or identical

- If you use == , you're checking whether two variables have the same value.
- With === you're checking whether two variables refer to the exact same object.



> get{} set{} blocks

~~~swift
var indexOfSelectedChecklist: Int {
    get {
      return UserDefaults.standard.integer(forKey: "ChecklistIndex")
    }
    
    set {
      UserDefaults.standard.set(newValue, forKey: "ChecklistIndex")
    }
}
~~~

- This is an example of a *computed property.*
- There isn't any storage allocated for this property - so it's not really a variable.
- Instead, when the app tries to read the value of indexOfSelectedChecklist, the code in the **get** block is performed. And when the app trieds to put a new value into indexOfSelectedChecklist, the **set** block is performed.

- Hiding implementation details is an important object-oriented programming principle, and this is one way to do it.