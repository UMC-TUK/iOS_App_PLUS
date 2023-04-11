import UIKit

var optionalValue: Int? = 2
var optionalValueNil: Int?

func unwrap_guard(optinal: Int?){
    guard let value = optinal else{return}
    
    print("=== Guard-let ===")
    print("unwrap before \(optinal)")
    print("unwrap after \(value)")
}

unwrap_guard(optinal: optionalValue)
unwrap_guard(optinal: optionalValueNil)

func unwrap_if(optinal: Int?){
    if let value = optinal {
        print("=== if-let ===")
        print("unwrap before \(optinal)")
        print("unwrap after \(value)")
    }
    else{
        print("=== if-let ===")
        print("this is nil")
        print("unwrap before \(optinal)")
        
    }
}

unwrap_if(optinal: optionalValue)
unwrap_if(optinal: optionalValueNil)

print("unwrap ??")
print(optionalValue ?? 0)
print(optionalValueNil ?? 0)

print("unwrap !")
print(optionalValue!)
print(optionalValueNil!)  //오류 발생
