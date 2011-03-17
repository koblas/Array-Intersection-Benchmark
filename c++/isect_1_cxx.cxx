#include <stdio.h>
#include <unistd.h>
#include <strings.h>
#include <backward/hash_set>
#include <list>
#include <time.h>

std::list<int>* isect(int len, int a[], int b[]) {
    __gnu_cxx::hash_set<int>   h = __gnu_cxx::hash_set<int>();

    for (int i = 0; i < len; i++) 
        h.insert(a[i]);

    std::list<int>   *l = new std::list<int>();

    for (int i = 0; i < len; i++) 
        if (h.find(b[i]) != h.end()) 
            l->push_back(b[i]);

    return l;
}

main(int argc, char *argv[]) {
    FILE    *fd;
    char    buf[1024];
    int     size;

    if (argc == 1) 
        fd = stdin;
    else
        fd = fopen(argv[1], "r");

    fgets(buf, sizeof(buf), fd);
    size = atoi(buf);

    int     *x = new int[size];
    int     *y = new int[size];
    int     idx = 0;

    while (fgets(buf, sizeof(buf), fd) != NULL) {
        const char    *cp = index(buf, ' ');

        x[idx] = atoi(buf); 
        y[idx] = atoi(cp+1); 
        idx++;
    }

    clock_t         t0 = clock();
    std::list<int>  *l = isect(idx, x, y);
    clock_t         t1 = clock();

    printf("Set   | n = %d : %d intersects found in %f seconds\n", idx, l->size(), (double)(t1 - t0) / CLOCKS_PER_SEC);

    fclose(fd);
}
