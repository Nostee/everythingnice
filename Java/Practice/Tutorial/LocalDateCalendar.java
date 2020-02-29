import java.time.LocalDate;
import java.util.*;

public class LocalDateCalendar
{
    public static void main(String [] args)
    {
        Scanner scan = new Scanner(System.in);
        System.out.println("Enter Year:");
        int yr = scan.nextInt();
        System.out.println("Enter Month:");
        int mt = scan.nextInt();
        System.out.println("Enter Day:");
        int dy = scan.nextInt();

        //puts the elements of the date into the local date method
        LocalDate ld = LocalDate.of(yr,mt,dy);
        System.out.println(ld);

        //gets the day of the week
        System.out.print(ld.getDayOfWeek());
    }
}
