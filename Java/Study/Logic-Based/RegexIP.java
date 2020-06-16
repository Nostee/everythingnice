import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.Scanner;

class RegexIP
{
    public static void main(String[] args)
    {
        String hey = "(([2][0-5][0-5])|([0-1][0-9][0-9])|([0-9][0-9])|([0-9])|(2[1-4][0-9]))";
        String pattern = hey+"\\."+hey+"\\."+hey+"\\."+hey;
        Scanner in = new Scanner(System.in);
        while(in.hasNext())
        {
            String IP = in.next();
            //prints true if it matches. false if not
            System.out.println(IP.matches(pattern));
        }
    }
}


