import java.util.*;

public class StringMethods {

    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);
        //input 2 strings.
        String A =sc.next();
        String B =sc.next();

        //finds the length of the words
        int lenA = A.length();
        int lenB = B.length();
        System.out.println(lenA+lenB);

        //compares their value lexicographically. returns a positive if greater, 0 if                                                                           else.
        int z = A.compareTo(B);
        if(z>0)
        {
            System.out.println("Yes");
        }
        else
        {
            System.out.println("No");
        }

        //capitalizes the first letter then adds the remaining substring
        String newA = A.substring(0,1).toUpperCase() + A.substring(1);
        String newB = B.substring(0,1).toUpperCase() + B.substring(1);

        System.out.println(newA+" "+newB);
    }
}

