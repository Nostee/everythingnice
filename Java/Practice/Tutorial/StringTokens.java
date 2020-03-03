import java.io.*;
import java.util.*;

public class StringTokens {
    //splits the string into tokens
    public static void main(String[] args)
    {
        Scanner scan = new Scanner(System.in);
        String s = scan.nextLine();
        int count = 0;

        //initializes StringTokenizer with the string and delimiter.
        StringTokenizer st = new StringTokenizer(s,"[ !,?._'@]+");

        //for checking the number of elements
        while(st.hasMoreElements()) //checks if st has element left
        {
            st.nextElement(); //goes to the next element
            count++;
        }
        System.out.println(count);

        //for printing the tokens
        st = new StringTokenizer(s,"[ !,?._'@]+");
        while(st.hasMoreElements())
        {
            System.out.println(st.nextElement());
        }

        scan.close();
    }
}