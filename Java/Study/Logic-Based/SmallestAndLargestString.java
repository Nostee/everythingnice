import java.util.Scanner;

public class SmallestAndLargestString {
    //gets string and integer from the main method
    public static String getSmallestAndLargest(String s, int k) {
        String smallest = "";
        String largest = "";
        int len = s.length();
        String tempo = "";
        int check;

        //loops for the len-k times. k is the integer. len is the length of the string
        for(int ctr = 0;ctr<=(len-k);ctr++)
        {
            //gets the substring
            tempo = s.substring(ctr,ctr+k);
            System.out.println("Current substring: "+tempo);
            //puts the tempo in empty variables
            if(smallest.equals(""))
            {
                smallest = tempo;
            }
            if(largest.equals(""))
            {
                largest = tempo;
            }
            else
            {
                check = tempo.compareTo(smallest);
                if(check<0)
                {
                    smallest = tempo;
                }
                check = tempo.compareTo(largest);
                if(check>0)
                {
                    largest = tempo;
                }
            }
        }
        return smallest + "\n" + largest;
    }

    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
        String s = scan.next();
        int k = scan.nextInt();
        scan.close();
        //passes the string and integer to the method
        System.out.println(getSmallestAndLargest(s, k));
    }
}