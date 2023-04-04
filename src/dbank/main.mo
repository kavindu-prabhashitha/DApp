import Debug "mo:base/Debug";
import Nat "mo:base/Nat";
import Int "mo:base/Int";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DBank {
  //Orthogonal persistance ( preserve the variable state forever)
  stable var currentValue : Float = 300;
  // currentValue := 300;

  stable var startTime = Time.now();
  // startTime :=  Time.now();
  Debug.print(debug_show(startTime));

  let id = 123245434534 ;
  //Debug.print(debug_show(currentValue));
  //Debug.print(debug_show("id : " , id));

  //Access modifier is public which means its accessible from the outside
  public func topUp(amount: Float) {
    currentValue += amount;
    Debug.print(debug_show(currentValue))
  };

  public func withdraw(amount: Float){
    let tempValue: Float = currentValue - amount;
    if (tempValue >= 0){
      currentValue -= amount;
      Debug.print(debug_show(currentValue));
    }else{
      Debug.print("Insufficiant Amount, amount too large, current value less than zero")
    }
  };

  public query func checkBalance(): async Float{
    return currentValue;
  };


  public func compund(){
    let currentTime = Time.now();
    let timeElapsedNS = currentTime- startTime;
    let timeElapsedS = timeElapsedNS / 1000000000;
    currentValue := currentValue * (1.01 ** Float.fromInt(timeElapsedS));
    startTime := currentTime ;
  }

}