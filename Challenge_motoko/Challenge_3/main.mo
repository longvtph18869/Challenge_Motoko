import Custom "custom";
import Animal "animal";
import List "mo:base/List";
import HashMap "mo:base/HashMap";
import Iter "mo:base/Iter";
import Option "mo:base/Option";
import Principal "mo:base/Principal";
import Cycles "mo:base/ExperimentalCycles";
actor {
  // public type Girl_Friends = Custom.Girl_Friends;
  // public type Animal = Animal.Animal;
  // let Maria = {
  //   name = "Maria";
  //   height = 162;
  //   weight = 50;
  //   status = true;
  // };
  // //Challenge 1:
  // public func test() : async Girl_Friends{
  //   return Maria;
  // };

  // //Challenge 4:
  // public func create_animal_then_takes_a_break(specie_new : Text, energy_new : Nat) : async Animal{
  //   var animal_new = Animal.animal_sleep({
  //     specie = specie_new;
  //     energy = energy_new;
  //   });
  //   return animal_new
  // };

  // //Challenge 5:
  // public type List<T> = ?(T,List<T>);
  // var lst_animals : List<Animal> = List.nil<Animal>();

  // //Challenge 6:
  // public func push_animal(animal : Animal) {
  //   lst_animals := List.push(animal,lst_animals);
  // };
  // public func get_animals() : async [Animal]{
  //   return List.toArray(lst_animals);
  // };


  //Challenge 11:
  public shared({caller}) func is_anonymous() : async Bool{
    return Principal.isAnonymous(caller);
  };

  //Challenge 12:
  stable var entries : [(Principal, Nat)] = [];
  let favoriteNumber:HashMap.HashMap<Principal,Nat>  = HashMap.fromIter<Principal,Nat>(entries.vals(),entries.size(),Principal.equal,Principal.hash);

  //Challenge 13:
  public shared(msg) func add_favorite_number(n : Nat) : async Text{
    let prinicipal = msg.caller;
    if(not Option.isNull(favoriteNumber.get(prinicipal))){
      return "You've already registered your number";
    };
    favoriteNumber.put(prinicipal,n);
    return "You've successfully registered your number";
  };
  public shared(msg) func show_favorite_number() : async ?Nat{
    return favoriteNumber.get(msg.caller);
  };

  //Challenge 15 :
  public shared({caller}) func update_favorite_number(n:Nat):async (){
    favoriteNumber.put(caller,n);
  };

  public shared({caller}) func delete_favorite_number():async ?Nat{
    return favoriteNumber.remove(caller);
  };

  //Challenge 16 :
  public func deposit_cycles():async Nat{
    return Cycles.accept(Cycles.available());
  };

  //Challenge 17:
  public shared({caller}) func withdraw_cycles(n:Nat):async (){
    let canister_id =  "";
  };

  //Challenge 18:
  stable var counter:Nat = 0;
  stable var version_number:Nat = 1;
  public func increment_counter(n:Nat):async Nat{
    counter:= (counter+n);
    return counter;
  };

  public func clear_counter():async Nat{
    counter:=0;
    return counter;
  };

  public func get_version_number():async Nat{
    return version_number;
  };

  //Challenge 20:
  system func preupgrade() {
        entries := Iter.toArray(favoriteNumber.entries()); 
  };

  system func postupgrade() {
        version_number+=1; 
        entries:=[]; 
  };
};
