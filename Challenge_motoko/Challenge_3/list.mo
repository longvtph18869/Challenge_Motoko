module{
    public type List<T> = ?(T,List<T>);
    //Challenge 7:
    public func is_null<T>(l : List<T>): Bool{
        switch(l){
            case(null) true;
            case(?l) false;
        };
    };

    //Challenge 8:
    public func last<T>(l : List<T>) : ?T{
        return List.last(l);
    }

    //Challenge 9:
    public func size<T>(l : List<T>) : Nat{
        return List.size(l);
    }

    //Challenge 10:
    public func get<T>(l : List<T>, n : Nat) : ?T{
        return List.get(l,n);
    }

}