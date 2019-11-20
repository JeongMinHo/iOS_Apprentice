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