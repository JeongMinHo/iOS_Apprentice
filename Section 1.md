# iOS_Apprentice



## Chapter 1: Introduction

- Swift is a hot new language that combines traditional object-oriented programming with aspects of functional programming.



## Chapter 2: The One-Button App

- Whenever I start working on a new app, I first make a list of laa the different pieces of functionality I think th app will need. -> programming to-do list.
- By cutting up the workload into small steps you make the project less daunting - you can always find a step that is simple and small enough to make a good starting point and take if from there.



- What happens when you press Run?
  - Xcode will first compile your source code : Swift에서 machine code로 변환해준다.
- **Navigator area** : the row of icons along the top lets you select a specific navigator.
- **Storyboard** : contains the design for all of my app's screens and shows the navigation flow in my app from one screen to anther.
- When Xcode detects an error, it switches the pane on the left from the Project navigator, to the **Issue Navigator**, which shows all the errors and warnings that Xcode has found.



- Xcode will autosave 
  - Xcode will automatically save any modified files when you press the Run button.
  - Neverthelss, Xcode isn't the most stable piece of software out there, do remember to press command+S on a regular basis to save any changes that you've made



- Two files - the storyboard and the Swift file - together form the desing and implementation of a view controller. 
- *The job of a view controller, generally, is to manage a single screen in your app.*



> The anatomy of an app

- An app is essentially made up of objects that can send messages to each other.
- Many of the objects in your app are provided by iOS; for example, the button is a UIButton object and the alert pop-up is a UIAlertController object. 
- Some objects you will have to program yourself, such as the View controller.
- These objects communicate by passing messages to each other. 
  - Ex) When the user taps the Hit Me button in your arpp, that UIButton object sends a message to your view controller. In turn, the view controller may message more objcets.
- On iOS, apps are *event-driven*, which means that the objects listen for certain events to occur and then process them.

![event](https://user-images.githubusercontent.com/48345308/68919170-63e9dd00-07b4-11ea-9e5e-0034ae0e233e.jpeg)



## Chapter 3: Slider & Labels



> Portait vs. landscape

- The iPhone is roatated to its side and the screen is wider but less tall. This is called *landscape* orientation

<img width="624" alt="스크린샷 2019-11-15 오후 2 50 27" src="https://user-images.githubusercontent.com/48345308/68920008-49653300-07b7-11ea-86bb-dd07f6c92173.png">

- On older devices - up to the iPhone 3GS and corresponding iPod touch models, as well as the first iPads  - one point corresponds to one pixel.
  - *Pixel* : it's the smallest element that a screen is made up of. The display of your iPhone is a big matrix of pixels that each can have their own color, just like a television screen. The more pixels, the better the image looks.
- On the high-resolution Retina display of the iPhone 4 and later models, one point actually corresponds to two pixels horizontally and vertically, so four pixels in total.
- On the Plus devices, they have 3x resolution with nine pixels for every point.
- Remember that UIKit works with points instead of pixels, so you only have to worry about the differences between the screen sizes measured in points. 
  - Developers work in points, designers work in pixels.



> UIkit and other frameworks

- iOS offers a lot of building blocks int the form of frameworks of "kits".
- The UIKit frameworks provides the *user interface controls* such as buttons, labels, and navigation bars. It manages the view controllers and generally takes care of anything else that deals with your app's user interface.
- Examples of other frameworks are Foundation, which provides many of the basic building blocks for building apps; Core Graphics(CG) for drawing basic shapes such as lines, gradients and images on the sreen.
- AVFoundation for playing sound and video; and many others.
- The complete set of frameworks for iOS is known collectively as Cocoa Touch.



> Understanding objects, data and methods

- Swift is a so-called "object-oriented" programming languate, which means that most of the stuff you do involves objects of some kind. 

1. Objects

- Programmers like to group related functionality into objects.
- Each object takes care of a specific part of the program. In a full-blown app, you will have many different types of objects.
- The project also has an object names **AppDelegate**.



2. Data and methods 

- An object can have both data and functionality.
- *Data contains something.* ex) view controller contains the button.
- An example of functionality is the showAlert() action that you added to respond to taps ont the button. 
  - *Functionality does something.*

- The thing that provides functionality to an object is commonly calles a *method*. a method is simply a function that belongs to an object.

<img width="310" alt="스크린샷 2019-11-15 오후 3 18 55" src="https://user-images.githubusercontent.com/48345308/68921201-41a78d80-07bb-11ea-8a5b-29c340f91cb3.png">



> Messages

- Often the terms "calling a method" or "invoking a method" are used instead. That means the exact same thing as sending a message: The computer jumps to the method you're calling and returns to where it left off when that method is done.





- The inspector area shows various aspects of the item that is currently selected. The Atrributes inspector, for example, lets you change the background color of a label or the size of the text on a button. 

- Variables won't spoil if you keep them for too long - a variable will hold onto its value indefinitely, until you put a new value into that variable or until you destroy the container altogether.-



> Function and methods

- The difference between the two is that a function doesn't belong to an object while a method does.
- In other words, a method is exactly like a function - that's why you use the func keyword to define them - except that you need to have an object to use the method. 
- But regular functions, or free functions as they are sometimes called, can be used anywhere.



## Chapter 4: Outlets

- The **viewDidLoad()** method is sent by UIKit immediately after the view controller loads its user interface from the storyboard file. At this point, the view controller isn't visible yet, so this is a good place to set instance variables to their proper initial value.



- Action methods can have a parameter that refers to the UI control that triggered the method.
- This is convenient when you wish to refer to that object in the method, just as you did here.



> Locals

- Each variable has a certain lifetime, known as its *scope*.
  - The scope of a variable depends on where in your program defined that variable.
- Scope level in swift
  1. **Global scope** : These objects exist for the duration of the app and are accessible from anywhere.
  2. **Instance scope** : This is for variable such as currentValue. These objects are alive for as long as the object that owns them stays alive.
  3. **Local scope** : Objects with a local scope, such as the slider parameter of sliderMoved(), only exists for the duration of that method. As soon as the execution of the program leaves this method, the local objects are no longer accessible.





~~~swift
@IBOutlet weak var slider: UISlider!
~~~

- This line tells interface Builder that you now have a variable names *slider* that can be connected to a UISlider object.
- Just as Interface Builder likes to call methods *actions*, it calls these variables *outlets*.
- Interface Builder doesn't see any of your other variables, only the ones marked with @IBOutlets.



> Commenting

- You can write any text you want after the // symbol as the compier ignore such lines from the // to the end of the line completely.
- Example

~~~swift
// This is comment

/*

*/
~~~



~~~swift
receiver.methodName(parameters)
~~~

- The *receiver* is the object you're sending the message to. If you're sending the message to yourself, then the receiver is **self**. But because sending message to **self ** is very common, you can also leave this special keyword out for many cases.



- The advantages of using methods : 중복되는 코드들을 묶어서 관리할 수 있다. -> 변경이 용이하다.
- Swift is a *Stronly typed language*, meaning that it is really picky about the shapes that you can put into the boxes.
  - If you get an error message saying, *Cannot assign value of type 'something' to type 'something else'*, *then you're probably trying to mix incompatible data types.*



> Action methods vs. normal methods

- Same
- An action method is really just the same as any other method. The only special thing is the @IBAction attribute, which allows Interface Builder to see the method so you can connect it to your buttons, sliders and so on.



## Chapter 5: Rounds & Score

- 문제가 생겼을때 코딩을 멈추고 종이에 쓰면서 해결 방법을 생각하는 시간을 가지자.



## Chapter 6: Polish



> Alert event handling

~~~swift
let action = UIAlertAction(title: "OK", style: .default, handler: nil)
~~~

- The third parameter, *handler*, tells the alert what should happen when the button is pressed.



~~~swift
let action = UIAlertAction(title: "OK", style: .default) { (_ ) in self.startNewRound()}
~~~

- Such a block of code is called a *closure*.
- This code is not performed right away. Rather, it's performed only when the OK button is tapped.
- This particular closure tells the app to start a new round(and update the labels) when the alert is dismissed.



> **Self**

- You may be wondering why in the handler block you did self.startNewRound() instead of just writing startNewRound() like before.
- The *self* keyword allows the view controller to refer to itself. 
- Normally you don't need to use self to send messages to the view controller, even though it is allowed. The exception: inside closure you do have to use **self** to refer to the view controller.



## Chapter 7: The New Look



> **Info.plist**

- Info.plist is a configuration file inside the application bundle that tells iOS how the app will behave.
- It also describes certain characteristics of the app, such as the version number, that don't really fit anywhere else.
- You can make most of the changes directly from the Project Settings screen.



> Assets.xcassets

- This item is known as the asset catalog for the app and it contains all the app's image.



> 1x, 2x, 3x displays

- Having multiple versions of the same image in varying size allows your apps to support the wide variety of iPhone and iPad displays in existence.

  1) **1x** is for low-resolution screens. 1x is only a concern if you're working on an app that still needs to support iOS 9 or older.

  2) **2x** is for high-resolution Retina screens. This covers most modern iPhones, iPod touches, and iPads.

  3) **3x** is for the super high-resolution Retina HD screen of the iPhone Plus devices. 



## Chapter 8: The Final App

- Auto Layout 적용해보기
- Application 내 iPhone에서 실행시켜 보기.


