import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class RegexTagContentExtractor
{
    public static void main(String[] args)
    {
        String testCase = "<h1>Nayeem loves counseling.</h1>";
        String expression = "<(.+)>([^<]+)<[/]\\1>";

        Pattern pt = Pattern.compile(expression);
        Matcher mt = pt.matcher(testCase);

        while(mt.find())
        {
            // gets the second grouped string which is the ([^<]+)
            System.out.println("The extracted content is: "+mt.group(2));
        }
    }
}
