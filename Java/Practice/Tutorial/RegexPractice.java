import java.util.Scanner;
import java.util.regex.*;

public class RegexPractice
{
    public static void main(String[] args)
    {
        String y = "(([2][0-5][0-5])|([0-1][0-9][0-9])|([0-9][0-9]))\\.(([2][0-5][0-5])|([0-1][0-9][0-9])|([0-9][0-9]))" +
                "\\.(([2][0-5][0-5])|([0-1][0-9][0-9])|([0-9][0-9]))\\.(([2][0-5][0-5])|([0-1][0-9][0-9])|([0-9][0-9]))";
        String x = "000.12.12.034";

        Pattern pt = Pattern.compile(y); //takes the regex expression
        Matcher mt = pt.matcher(x); //takes the string to be checked

        while(mt.find()) //loops at all matched words
        {
            System.out.println("Word is: "+mt.group()); //takes the string found
            System.out.println("Start index: "+mt.start()); //takes the first index
            System.out.println("End index: "+mt.end()); //takes the last index(after the last char)
            System.out.println("---------------------");
        }
    }
}

