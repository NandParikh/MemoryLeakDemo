---
What is Memory Leak?
---
- Memory leaks happen when memory is allocated but never freed, typically because of strong reference cycles.

<img width="1376" height="890" alt="Screenshot 2025-11-26 at 3 00 14 PM" src="https://github.com/user-attachments/assets/fcd0a9c9-1adb-4e68-bbf0-5a5a3f75aa1e" />

- To test it -
- From right panel select "Show the debug navigator or
- click on share icon above the debug console
- it will show Person(1) and Pet(1) when you not use the weak 
- Alternet way - Product -> Profile -> Leak and run your app

```Swift
import UIKit
class Person {
    var pet: Pet?
    
    deinit { print("Person deinit called") }
}

class Pet {
    var owner: Person?
//    weak var owner: Person?
    deinit { print("Pet deinit called") }
}

class ViewController: UIViewController {

    @IBAction func btnClick(_ sender: UIButton) {
        var p : Person? = Person()
        var dog : Pet? = Pet()

        p?.pet = dog
        dog?.owner = p

        p = nil
        dog = nil
        print("End of viewDidLoad")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
```
---
output without weak 
---
End of viewDidLoad

---
output with weak
---
- Person deinit called
- Pet deinit called
- End of viewDidLoad
