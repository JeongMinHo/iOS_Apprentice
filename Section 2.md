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

