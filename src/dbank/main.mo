import Debug "mo:base/Debug";
import Nat "mo:base/Nat";
import Int "mo:base/Int";


actor DBank {
  //Orthogonal persistance ( preserve the variable state forever)
  stable var currentValue = 300;
  //currentValue := 100;
  let id = 123245434534 ;
  //Debug.print(debug_show(currentValue));
  //Debug.print(debug_show("id : " , id));

  //Access modifier is public which means its accessible from the outside
  public func topUp(amount: Nat) {
    currentValue += amount;
    Debug.print(debug_show(currentValue))
  };

  public func withdraw(amount: Nat){
    let tempValue: Int = currentValue - amount;
    if (tempValue >= 0){
      currentValue -= amount;
      Debug.print(debug_show(currentValue));
    }else{
      Debug.print("Insufficiant Amount, amount too large, current value less than zero")
    }
  };

  public query func checkBalance(): async Nat{
    return currentValue;
  };

}