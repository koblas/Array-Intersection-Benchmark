import java.io.*;
import java.util.*;

public class isect_2_java {
    private static Integer[] isect(Integer a[], Integer b[]) {
        ArrayList<Integer> l = new ArrayList<Integer>(a.length);
        HashSet<Integer>   h = new HashSet<Integer>();

        for (int i = 0; i < a.length; i++) {
            h.add(a[i]);
        }
        for (int i = 0; i < b.length; i++) {
            if (h.contains(b[i]))
                l.add(b[i]);
        }

        return (Integer[])l.toArray(new Integer[0]);
    }

    public static void main(String args[]) {
        try {
            BufferedReader reader = new BufferedReader(new FileReader(args[0]));

            String  line = reader.readLine();
            int     len  = Integer.parseInt(line);

            Integer x[] = new Integer[len];
            Integer y[] = new Integer[len];
            int     idx = 0;

            while ((line = reader.readLine()) != null) {
                String  p[] = line.split("\\s+");

                if (p.length == 2) {
                    int i;

                    x[idx] = Integer.valueOf(p[0]);
                    y[idx] = Integer.valueOf(p[1]);
                    idx++;
                }
            }

            long       t0 = System.currentTimeMillis();
            Integer[]  xy = isect(x, y);
            long       t1 = System.currentTimeMillis();

            Formatter   fmt = new Formatter();

            System.out.println(fmt.format("Set   | n = %d : %d intersects found in %f seconds",  x.length, xy.length, (t1 - t0) / 1000.0));
        } catch(IOException e) {
        }
    }
}
