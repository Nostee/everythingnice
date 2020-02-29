import java.util.*;
import java.io.*;

class DataTypesConversion{
    public static void main(String []argh)
    {
        Scanner scan = new Scanner(System.in);
        //asks how many numbers will be checked to fit into data
        int len = scan.nextInt();

        //BONUS: String s = String.valueOf(n); (When converting any datatype to string.)
        scan.nextLine();
        for (int ctr = 1;ctr<=len;ctr++)
        {
            //check is to determine whether it can fit into a certain data type
            int check = 0;
            //inputs any number to string
            String num = scan.nextLine();
            try
            {
                //converts any number to data types
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