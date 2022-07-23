import Buffer "mo:base/Buffer";
import Array "mo:base/Array";
import Iter "mo:base/Iter";
actor {
  public func greet(name : Text) : async Text {
    return "Hello, " # name # "!";
  };
  
  //Challenge 1
  public func add(n : Nat, m : Nat) : async Nat{
    return n + m;
  };

  //Challenge 2
  public func square(n : Nat) : async Nat{
    return n * n;
  };

  //Challenge 3
  public func days_to_second(n : Nat) : async Nat{
    return n * 24 * 60 * 60;
  };

  //Challenge 4
  var counter : Nat = 0;
  public func increment_counter(n : Nat) : async Nat{
    counter += n;
    return counter;
  };
  public func clear_counter() : async Nat{
    counter := 0;
    return counter;
  };

  //Challenge 5
  public func devide(n : Nat, m : Nat) : async Bool{
    if(n % m == 0){
      return true;
    }else{
      return false;
    }
  };

  //Challenge 6
  public func is_even(n : Nat) : async Bool{
    if(n % 2 == 0){
      return true;
    }else{
      return false;
    };
  };

  //Challenge 7
  public func sum_of_array(arr : [Nat]) : async Nat{
    var sum : Nat = 0;
    for(x in arr.vals()){
      sum += x;
    };
    return sum;
  };

  //Challenge 8
  public func maximum(arr : [Nat]) : async Nat{
    var max : Nat = 0;
    for(x in arr.vals()){
      if(max < x){
        max := x;
      };
    };
    return max;
  };

  //Challenge 9
  public func remove_from_array(arr : [Nat], n : Nat) : async [Nat] {
    let arr1 : Buffer.Buffer<Nat> = Buffer.Buffer(arr.size());
    for (x in arr.vals()) {
      if (n != x) {
        arr1.add(x);
      };
    };
    return arr1.toArray();
  };

  //Challenge 10
  public func selection_sort(array:[Nat]):async [Nat]{
       var array1:[var Nat] = Array.thaw(array);
        for (i in Iter.range(0,array1.size()-1)) {
            var min:Nat=i;
            for(j in Iter.range(i+1,array1.size()-1)){
                if(array1[j] < array1[min]){
                    min:=j;
                }
            };
            if(min!=i){
                let temp = array1[min];
                array1[min]:=array1[i];
                array1[i]:=temp;
            }
        };
        return Array.freeze<Nat>(array1);
    };
}
