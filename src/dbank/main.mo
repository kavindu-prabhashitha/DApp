import Debug "mo:base/Debug";
import Nat "mo:base/Nat";


actor DBank {
  var currentValue = 300;
  currentValue := 100;
  let id = 123245434534 ;
  //Debug.print(debug_show(currentValue));
  //Debug.print(debug_show("id : " , id));

  //Access modifier is public which means its accessible from the outside
  public func topUp(amount: Nat) {
    currentValue += amount;
    Debug.print(debug_show(currentValue))
  };

  public func withdraw(amount: Nat){
    currentValue -= amount;
    Debug.print(debug_show(currentValue))
  }

}