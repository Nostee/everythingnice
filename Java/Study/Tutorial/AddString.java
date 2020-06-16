import java.util.*;

public class AddString
{
    public static void main(String [] args)
    {
        String x = "111";
        //adds another string to the string
        x = x + "1";

        //converts the string into integer
        int y = Integer.valueOf(x).intValue();
        //converts the integer to string
        String z = String.valueOf(y);

        System.out.println(y);
        System.out.println(z);
    }

}