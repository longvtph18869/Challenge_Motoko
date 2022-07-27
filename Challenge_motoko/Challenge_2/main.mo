import Nat "mo:base/Nat";
import Nat8 "mo:base/Nat8";
import Result "mo:base/Result";
import Text "mo:base/Text";
import Char "mo:base/Char";
import Prim "mo:prim";
import Iter "mo:base/Iter";
import Array "mo:base/Array";
actor {
 //Challenge 1:
 public func nat_to_nat8(n : Nat ) : async Nat8 {
    if(n > 255) {
      return 0;
    };
    return(Nat8.fromNat(n));
  };

  //Challenge 2:
  public func max_number_with_n_bits(n : Nat) : async Nat {
    return (Nat.pow(2,n) - 1);
  };

  //Challenge 3:
  public func decimal_to_bits(n : Nat) : async Text{
    var binary = 0;
    var temp = 1;
    var n1 = n;
    while(n1 > 0){
      binary += (n % 2) * temp;
      n1 /= 2;
      temp *= 10;
    };
    return Nat.toText(binary);
  };

  //Challenge 4 : 
  public func capitalize_character(c : Char) : async Result.Result<Char,Text>{
    if(Char.isUppercase(c)){
    return#ok(c);
    }
    else if(Char.isAlphabetic(c)){
    return#ok(Char.fromNat32(Char.toNat32(c) - 32));
    };
    return#err("Không phải là kí tự chữ");
  };

  //Challenge 5 : 
  public func capitalize_text(t : Text) : async Text{
    return Text.map(t, Prim.charToUpper);
  };

  //Challenge 6:
  public func is_inside (t : Text, c : Char) : async Bool{
    for(i in t.chars()){
      if(c == i){
        return true;
      }
    };
    return false;
  };

  //Challenge 7:
  public func  trim_whitespace(t : Text) : async Text{
    return Text.trim(t,#text " ");
  };

  //Challenge 8:
  private func char_at_text(t : Text , n : Nat): Char{
        var c = 0;
        for(char in t.chars()){
            if(c == n){
                return char;
            };
            c += 1;
        };
        return '?';
    };
  public func duplicated_character(t : Text) : async Text{
    for(i in Iter.range(0,t.size() - 1)){
      var count = 0 ;
      for(j in Iter.range(i+1,t.size()-1)){
        if(char_at_text(t,j) == char_at_text(t,i)){
          return Text.fromChar(char_at_text(t,j))
        }
      };
    };
    return t;
  };

  //Challenge 9:
  public func size_in_bytes(t : Text): async Nat{
    let text : Blob = Text.encodeUtf8(t);
    var count = 0;
    for(x in text.vals()){
      count += Nat8.toText(x).size();
    };
    return count;
  };
    //Challenge 10:
    public func bubble_sort(a : [Nat]) : async [Nat]{
      var a1 : [var Nat]  = Array.thaw(a); 
      for(i in Iter.range(0 , a1.size() - 1)){
        for(j in Iter.range(0 , a1.size() - i - 2)){
          if(a1[j] > a1[j+1]){
            let tmp = a1[j];
            a1[j] := a1[j+1];
            a1[j+1] := tmp;
          }
        }
      };
      return Array.freeze(a1);
    };

    //Challenge 11:
    public func nat_opt_to_nat(n : ?Nat, m : Nat): async Nat{
      switch(n){
        case(null) m;
        case(?v) v;
        };
      };

    //Challenge 12:
    public func day_of_the_week(n : Nat) : async ?Text{
     switch(n){
      case(1) ?"Monday";
      case(2) ?"Tuesday";
      case(3) ?"Wednesday";
      case(4) ?"Thursday";
      case(5) ?"Friday";
      case(6) ?"Saturday";
      case(7) ?"Sunday";
      case _  null;
     };
    };

    //Challenge 13:
    public func populate_array(a : [?Nat]) :async [Nat]{
      return Array.map(a,func(x : ?Nat) : Nat{
        switch(x){
        case(null) 0;
        case(?v) v;
        };
      });
    };

    //Challenge 14:
    public func sum_of_array(a : [Nat]) : async Nat{
      return Array.foldRight(a,0,Nat.add);
    };

    //Challenge 15:
    public func squared_array(a : [Nat]) : async [Nat]{
      return Array.map(a,func(x : Nat) : Nat{
        return x*x;
      });
    };

    //Challenge 16:
    public func increase_by_index(a : [Nat]) : async [Nat]{
      var i = 0;
      return Array.map(a,func(x : Nat) : Nat{
        var x1 = x + i;
        i += 1;
        return x1;
      });
    };

    //Challenge 17:
    private func contains<A>(array : [A], a : A, f:(A,A)->Bool) : Bool{
      for(x in array.vals()){
        if(f(x,a)){
          return true;
        }
      };
      return false;
    };
    public func test(arr : [Nat], a : Nat) : async Bool{
      return contains<Nat>(arr,a,Nat.equal);
    }
};
