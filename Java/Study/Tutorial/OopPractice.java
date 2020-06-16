import java.util.*;

public class OopPractice
{
    //void returns nothing
    public static void Hello()
    {
        System.out.println("Hello");
    }

    //returns an int
    public static int Number()
    {
        int x = 5;
        return x;
    }

    public static void main(String [] args)
    {
        Hello();
        System.out.println(Number());
    }
}