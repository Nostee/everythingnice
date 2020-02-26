import java.util.*;
import java.io.*;

class DataTypesConversion{
    public static void main(String []argh)
    {
        Scanner scan = new Scanner(System.in);
        int len = scan.nextInt();
        scan.nextLine();
        for (int ctr = 1;ctr<=len;ctr++)
        {
            int check = 0;
            String num = scan.nextLine();
            try
            {
                long d = Long.valueOf(num).longValue();
                check = check+1;
                int c = Integer.valueOf(num).intValue();
                check = check+1;
                short b = Short.valueOf(num).shortValue();
                check = check+1;
                byte a = Byte.valueOf(num).byteValue();
                check = check+1;

                System.out.println(num+" can be fitted in:");
                System.out.println("* byte");
                System.out.println("* short");
                System.out.println("* int");
                System.out.println("* long");
            }
            catch(Exception e)
            {
                if(check!=0)
                {
                    System.out.println(num+" can be fitted in:");
                    if(check==4)
                    {
                        System.out.println("* byte");
                        System.out.println("* short");
                        System.out.println("* int");
                        System.out.println("* long");
                    }
                    else if(check==3)
                    {
                        System.out.println("* short");
                        System.out.println("* int");
                        System.out.println("* long");
                    }
                    else if(check==2)
                    {
                        System.out.println("* int");
                        System.out.println("* long");
                    }
                    else if(check==1)
                    {
                        System.out.println("* long");
                    }
                }
                else
                {
                    System.out.println(num+" can't be fitted anywhere.");
                }
            }
        }
    }
}