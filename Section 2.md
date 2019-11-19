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