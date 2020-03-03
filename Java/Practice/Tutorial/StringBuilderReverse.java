import java.io.*;
import java.util.*;

public class StringBuilderReverse {

    public static void main(String[] args) {

        Scanner scan = new Scanner(System.in);
        String a = scan.nextLine();

        //creates StringBuilder class
        StringBuilder str = new StringBuilder(a);

        //makes the string, reversed and converts it into string
        if(a.equals(str.reverse().toString()))
        {
            System.out.println("Yes");
        }
        else
        {
            System.out.println("No");
        }

    }
}

