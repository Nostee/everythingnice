import java.util.Scanner;

public class Anagram {

    static boolean isAnagram(String a, String b) {
        //gets the length of the characters
        int lenA = a.length();
        int lenB = b.length();

        //initializes arrays
        char arrayA[] = new char[lenA];
        char arrayB[] = new char[lenB];

        //puts the letters of the string in their respective array. it also makes the characters, lower case.
        for(int ctrA = 0;ctrA<lenA;ctrA++)
        {
            arrayA[ctrA] = Character.toLowerCase(a.charAt(ctrA));
        }
        for(int ctrB = 0;ctrB<lenB;ctrB++)
        {
            arrayB[ctrB] = Character.toLowerCase(b.charAt(ctrB));
        }a

        //sorts the array.
        //note: we didnt import Arrays so we put "java.util.Arrays in the code" (1)
        java.util.Arrays.sort(arrayA);
        java.util.Arrays.sort(arrayB);

        //note: we didnt import Arrays so we put "java.util.Arrays in the code" (2)
        //checks if the arrays are equal
        if(java.util.Arrays.equals(arrayA,arrayB))
        {
            return true;
        }
        else
        {
            return false;
        }
    }

    public static void main(String[] args)
    {
        Scanner scan = new Scanner(System.in);
        String a = scan.next();
        String b = scan.next();
        scan.close();
        boolean ret = isAnagram(a, b);
        System.out.println( (ret) ? "Anagrams" : "Not Anagrams" );
    }
}