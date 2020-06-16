import java.util.Scanner;
class UsernameValidator
{
    static String x = "[A-Za-z][A-Za-z0-9_]{7,29}";
    public static final String regularExpression = x;
}

public class Solution
{
    private static final Scanner scan = new Scanner(System.in);
    public static void main(String[] args)
    {
        int n = Integer.parseInt(scan.nextLine());
        while (n-- != 0)
        {
            String userName = scan.nextLine();
            // matches the username into the regex expression
            if (userName.matches(UsernameValidator.regularExpression))
            {
                System.out.println("Valid");
            }
            else
            {
                System.out.println("Invalid");
            }
        }
    }
}