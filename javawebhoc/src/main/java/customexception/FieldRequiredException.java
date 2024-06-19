package customexception;

//public class FieldRequiredException extends Exception{
//    public FieldRequiredException(String s){
//        super(s);
//    }
//}

public class FieldRequiredException extends RuntimeException{
    public FieldRequiredException(String s){
        super(s);
    }
}
