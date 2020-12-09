import java.util.ArrayList;
import java.util.List;

// PROGRAMA N-REINAS

class Main {

  static List calculateSolutions(int n) {
        long TInicio, TFin, tiempo;
        TInicio = System.currentTimeMillis();
        int[] arr = createZeroToNIntArray(n - 1);
        List<List<Integer>> validSolutions = new ArrayList<>();// The Integer Lists represent the positions of the
        // queens. The indexes are the x positions, and the values are the y positions.
        populateValidSolutions(arr, validSolutions, new ArrayList<>());
        TFin = System.currentTimeMillis();
        tiempo = TFin - TInicio;
        System.out.println("Tiempo de ejecución en milisegundos: " + tiempo);
        return validSolutions;
    }

    private static int[] createZeroToNIntArray(int n) {
        int[] arr = new int[n + 1];
        for (int i = 0; i < n + 1; i++) {
            arr[i] = i;
        }
        return arr;
    }

    static void populateValidSolutions(int[] arr, List<List<Integer>> validSolutions, List<Integer> queensYPosition) {
        /*
         *  Getting the permutations of the vertical positions of the queens, using DFS algorithm.
         */
        if (queensYPosition.size() == arr.length && !areDiagonalThreatens(queensYPosition)) {
            validSolutions.add(new ArrayList<>(queensYPosition));
        }
        for (int i : arr) {
            if (!queensYPosition.contains(i)) {
                queensYPosition.add(i);
                populateValidSolutions(arr, validSolutions, queensYPosition);
                queensYPosition.remove(queensYPosition.size() - 1);
            }
        }
    }

    static boolean areDiagonalThreatens(List<Integer> queensYPosition) {
        int n = queensYPosition.size();
        for (int i = 0; i < n; i++) {
            int min = Math.min(i, queensYPosition.get(i));
            int x = i - min;
            int y = queensYPosition.get(i) - min;
            while(x < n && y < n) {
                if(x != i && queensYPosition.get(x) == y) {
                    return true;
                }
                x++;
                y++;
            }
            x = n;
            y = queensYPosition.get(i) - n + i;
            while(x > 0 && y < n - 1) {
                x--;
                y++;
                if(x != i && queensYPosition.get(x) == y) {
                    return true;
                }
            }
        }
        return false;
    }

  public static void main(String[] args) {
    System.out.println("-- SOLUCIONES --");
    System.out.println("  ");
    System.out.println(calculateSolutions(8));
  }

}
