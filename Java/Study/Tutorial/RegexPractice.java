import java.util.Scanner;
import java.util.regex.*;

public class RegexPractice
{
    public static void main(String[] args)
    {
        String y = "<(\\w+)>.+<[/]\\1>";
        String x = "<h1>asdfds fds fsad</h1>";

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

