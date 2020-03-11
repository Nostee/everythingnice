import java.util.Scanner;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class RegexDuplicate
{
    public static void main(String[] args)
    {
        Scanner scan = new Scanner(System.in);
        int num = scan.nextInt();
        Pattern pt = Pattern.compile("(\\b\\w+)(\\s\\1\\b)+",Pattern.CASE_INSENSITIVE);
        scan.nextLine();
        for(int ctr = 1;ctr<=num;ctr++)
        {
            String current = scan.nextLine();
            Matcher mt = pt.matcher(current);
            while(mt.find())
            {
                // replaces the whole group with what match on the index no.1 group. (which is the 2nd)
                // do this in order to eliminate reoccuring words
                current = current.replaceAll(mt.group(),mt.group(1));
            }
            System.out.println(current);
        }
    }
}