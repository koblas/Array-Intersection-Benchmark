import java.io.*;
import java.util.*;

public class isect_1_java {
    private static int[] isect(int a[], int b[]) {
        int            l[] = new int[a.length];
        TreeMap        h = new TreeMap();
        int            idx = 0;

        for (int i = 0; i < a.length; i++) {
            h.put(new Integer(a[i]), 1);
        }
        for (int i = 0; i < b.length; i++) {
            if (h.containsKey(new Integer(b[i])))
                l[idx++] = b[i];
        }

        int o[] = new int[idx];
        for (int i = 0; i < idx; i++) {
            o[i] = l[i];
        }

        return o;
    }

    public static void main(String args[]) {
        try {
            BufferedReader reader = new BufferedReader(new FileReader(args[0]));

            String  line = reader.readLine();
            int     len  = Integer.parseInt(line);

            int x[] = new int[len];
            int y[] = new int[len];
            int     idx = 0;

            while ((line = reader.readLine()) != null) {
                String  p[] = line.split("\\s+");

                if (p.length == 2) {
                    int i;

                    x[idx] = Integer.parseInt(p[0], 10);
                    y[idx] = Integer.parseInt(p[1], 10);
                    idx++;
                }
            }

            long    t0 = System.currentTimeMillis();
            int[]   xy = isect(x, y);
            long    t1 = System.currentTimeMillis();

            Formatter   fmt = new Formatter();

            System.out.println(fmt.format("Set   | n = %d : %d intersects found in %f seconds",  x.length, xy.length, (t1 - t0) / 1000.0));
        } catch(IOException e) {
        }
    }
}
