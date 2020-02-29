import java.util.*;

public class StaticInitialization
{
    static Scanner scan = new Scanner(System.in);
    static int B = scan.nextInt();
    static int H = scan.nextInt();
    static boolean flag;

    static
    {
        if(B<=0 || H<=0)
        {
            System.out.println("java.lang.Exception: Breadth and height must be positive");
            flag = false;
        }
        else
        {
            flag = true;
        }
    }
    public static void main(String[] args){
        if(flag){
            int area=B*H;
            System.out.print(area);
        }
    }
}
