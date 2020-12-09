package astar;

import java.util.List;

public class AStarWorldmap {

    public static void main(String[] args) {
        Node initialNode = new Node(0, 0);
        Node finalNode = new Node(3, 10);
        int rows = 5;
        int cols = 11;
        AStar aStar = new AStar(rows, cols, initialNode, finalNode);
        int[][] blocksArray = new int[][]{{0, 4}, {2, 2}, {2, 3}, {3, 5}, {4, 5}, {1,8}, {2, 8}};
        aStar.setBlocks(blocksArray);
        List<Node> path = aStar.findPath();
        for (Node node : path) {
            System.out.println(node);
        }

        //Search Area
        //      0   1   2   3   4   5   6   7   8   9   10
        // 0    I   -   -   -   B   -   -   -   -   -   -
        // 1    -   -   -   -   -   -   -   -   B   -   -
        // 2    -   -   B   B   -   -   -   -   B   -   -
        // 3    -   -   -   -   -   B   -   -   -   -   F
        // 4    -   -   -   -   -   B   -   -   -   -   -

        //Expected output with diagonals
        // Node [row=0, col=0]
        // Node [row=0, col=1]
        // Node [row=0, col=2]
        // Node [row=1, col=3]
        // Node [row=1, col=4]
        // Node [row=1, col=5]
        // Node [row=1, col=6]
        // Node [row=2, col=7]
        // Node [row=3, col=8]
        // Node [row=3, col=9]
        // Node [row=3, col=10]
    }
}
