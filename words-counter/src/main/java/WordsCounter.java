package main.java;

public class WordsCounter{
    static final int ITERATIONS = Math.max(Integer.getInteger("iterations", 1), 1);

    public static void main(String... args){
        System.out.println("Inside Main !!!");
        //String sentence = String.join(" ", args);
        String sentence = "Hello World, Hello World";
        for (int iter = 0; iter < ITERATIONS; iter++) {
        if (ITERATIONS != 1) System.out.println("-- iteration " + (iter + 1) + " --");
        long total = 0, start = System.currentTimeMillis(), last = start;
        for (int i = 1; i < 10000000; i++) {
            total += sentence
              .chars()
              .filter((s)->Character.isUpperCase(s))
              .count();
            if (i % 1000000 == 0) {
                long now = System.currentTimeMillis();
                System.out.printf("%d (%d ms)%n", i / 1000000, now - last);
                last = now;
            }
        }
        System.out.printf("total: %d (%d ms)%n", total, System.currentTimeMillis() - start);
        }
    }
}