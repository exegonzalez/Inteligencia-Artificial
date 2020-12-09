package dijkstra;

import java.util.PriorityQueue;
import java.util.List;
import java.util.ArrayList;
import java.util.Collections;

class Vertex implements Comparable<Vertex>
{
       public final String name;
       public Edge[] adjacencies;
       public double minDistance = Double.POSITIVE_INFINITY;
       public Vertex previous;
       public Vertex(String argName) { name = argName; }
       public String toString() { return name; }
       public int compareTo(Vertex other)
       {
           return Double.compare(minDistance, other.minDistance);
       }

}


class Edge
{
       public final Vertex target;
       public final double weight;
       public Edge(Vertex argTarget, double argWeight)
       { target = argTarget; weight = argWeight; }
}

public class Dijkstra
{
       public static void computePaths(Vertex source)
       {
           source.minDistance = 0.;
           PriorityQueue<Vertex> vertexQueue = new PriorityQueue<Vertex>();
       vertexQueue.add(source);

       while (!vertexQueue.isEmpty()) {
           Vertex u = vertexQueue.poll();

               // Visit each edge exiting u
               for (Edge e : u.adjacencies)
               {
                   Vertex v = e.target;
                   double weight = e.weight;
                   double distanceThroughU = u.minDistance + weight;
           if (distanceThroughU < v.minDistance) {
               vertexQueue.remove(v);

               v.minDistance = distanceThroughU ;
               v.previous = u;
               vertexQueue.add(v);
           }
               }
           }
       }

       public static List<Vertex> getShortestPathTo(Vertex target)
       {
           List<Vertex> path = new ArrayList<Vertex>();
           for (Vertex vertex = target; vertex != null; vertex = vertex.previous)
               path.add(vertex);

           Collections.reverse(path);
           return path;
       }

       public static void main(String[] args)
       {
            // Columna 1
            Vertex C1F1 = new Vertex ("11.2");
            Vertex C1F2 = new Vertex ("10.8");
            Vertex C1F3 = new Vertex ("10.4");
            Vertex C1F4 = new Vertex ("10.8");
            Vertex C1F5 = new Vertex ("11.2");
            // Columna 2
            Vertex C2F1 = new Vertex ("10.2");
            Vertex C2F2 = new Vertex ("9.8");
            Vertex C2F3 = new Vertex ("9.4");
            Vertex C2F4 = new Vertex ("9.8");
            Vertex C2F5 = new Vertex ("10.2");
            // Columna 3
            Vertex C3F1 = new Vertex ("9.2");
            Vertex C3F2 = new Vertex ("8.8");
            Vertex C3F4 = new Vertex ("8.8");
            Vertex C3F5 = new Vertex ("9.2");
            // Columna 4
            Vertex C4F1 = new Vertex ("8.2");
            Vertex C4F2 = new Vertex ("7.8");
            Vertex C4F4 = new Vertex ("7.8");
            Vertex C4F5 = new Vertex ("8.2");
            // Columna 5       
            Vertex C5F2 = new Vertex ("6.8");
            Vertex C5F3 = new Vertex ("6.4");
            Vertex C5F4 = new Vertex ("6.8");
            Vertex C5F5 = new Vertex ("7.8");
            // Columna 6       
            Vertex C6F1 = new Vertex ("6.8");
            Vertex C6F2 = new Vertex ("5.8");
            Vertex C6F3 = new Vertex ("5.4");
            // Columna 7
            Vertex C7F1 = new Vertex ("5.8");
            Vertex C7F2 = new Vertex ("4.8");
            Vertex C7F3 = new Vertex ("4.4");
            Vertex C7F4 = new Vertex ("4");
            Vertex C7F5 = new Vertex ("4.4");
            // Columna 8
            Vertex C8F1 = new Vertex ("4.8");
            Vertex C8F2 = new Vertex ("3.4");
            Vertex C8F3 = new Vertex ("3.4");
            Vertex C8F4 = new Vertex ("3");
            Vertex C8F5 = new Vertex ("3.4");
            // Columna 9
            Vertex C9F1 = new Vertex ("3.8");
            Vertex C9F4 = new Vertex ("2");
            Vertex C9F5 = new Vertex ("2.4");
            // Columna 10
            Vertex C10F1 = new Vertex ("3.4");
            Vertex C10F2 = new Vertex ("2.4");
            Vertex C10F3 = new Vertex ("1.4");
            Vertex C10F4 = new Vertex ("1");
            Vertex C10F5 = new Vertex ("1.4");
            // Columna 11
            Vertex C11F1 = new Vertex ("3");
            Vertex C11F2 = new Vertex ("2");
            Vertex C11F3 = new Vertex ("1");
            Vertex C11F4 = new Vertex ("0");
            Vertex C11F5 = new Vertex ("1");
            
            // set the edges and weight

            /////////////////////////////////////////////////////////////// Columna 1

            C1F1.adjacencies = new Edge[] { 
                new Edge(C1F2, 10.8), 
                new Edge(C2F1, 10.2), 
                new Edge(C2F2, 9.8)
            };
            
            C1F2.adjacencies = new Edge[]{ 
                new Edge(C1F1, 11.2), 
                new Edge(C1F3, 10.4), 
                new Edge(C2F1, 10.2), 
                new Edge(C2F2, 9.8), 
                new Edge(C2F3, 9.4)
            };
            
            C1F3.adjacencies = new Edge[]{ 
                new Edge(C1F2, 10.8), 
                new Edge(C1F4, 10.8), 
                new Edge(C2F2, 9.8), 
                new Edge(C2F3, 9.4), 
                new Edge(C2F4, 9.8)
            };
            
            C1F4.adjacencies = new Edge[]{ 
                new Edge(C1F3, 10.4), 
                new Edge(C1F5, 11.2), 
                new Edge(C2F3, 9.4), 
                new Edge(C2F4, 9.8), 
                new Edge(C2F5, 10.2) 
            };
            
            C1F5.adjacencies = new Edge[]{ 
                new Edge(C1F4, 10.8), 
                new Edge(C2F4, 9.8), 
                new Edge(C2F5, 10.2) 
            };
            
            //////////////////////////////////////////////
            C2F1.adjacencies = new Edge[]{ 
                new Edge(C1F1, 11.2), 
                new Edge(C1F2, 10.8), 
                new Edge(C2F2, 9.8), 
                new Edge(C3F1, 9.2), 
                new Edge(C3F2, 8.8) 
            };
            
            C2F2.adjacencies = new Edge[]{ 
                new Edge(C1F1, 11.2), 
                new Edge(C1F2, 10.8), 
                new Edge(C1F3, 10.4), 
                new Edge(C2F1, 10.2), 
                new Edge(C2F3, 9.4), 
                new Edge(C3F1, 9.2), 
                new Edge(C3F2, 8.8)
            };
            
            C2F3.adjacencies = new Edge[]{ 
                new Edge(C1F2, 10.8), 
                new Edge(C1F3, 10.4), 
                new Edge(C1F4, 10.8), 
                new Edge(C2F2, 9.8), 
                new Edge(C2F4, 9.8), 
                new Edge(C3F2, 8.8), 
                new Edge(C3F4, 8.8) 
            };
            
            C2F4.adjacencies = new Edge[]{ 
                new Edge(C1F3, 10.4), 
                new Edge(C1F4, 10.8), 
                new Edge(C1F5, 11.2), 
                new Edge(C2F3, 9.4), 
                new Edge(C2F5, 10.2), 
                new Edge(C3F4, 8.8), 
                new Edge(C3F5, 9.2) 
            };
            
            C2F5.adjacencies = new Edge[]{ 
                new Edge(C1F4, 10.8), 
                new Edge(C1F5, 11.2), 
                new Edge(C2F4, 9.8), 
                new Edge(C3F4, 8.8), 
                new Edge(C3F5, 9.2)
            };
            
            /////////////////////////////////////////////////////
            C3F1.adjacencies = new Edge[]{ 
                new Edge(C2F1, 10.2), 
                new Edge(C2F2, 9.8), 
                new Edge(C3F2, 8.8), 
                new Edge(C4F1, 8.2), 
                new Edge(C4F2, 7.8)
            };
            
            C3F2.adjacencies = new Edge[]{ 
                new Edge(C2F1, 10.2), 
                new Edge(C2F2, 9.8), 
                new Edge(C2F3, 9.4), 
                new Edge(C3F1, 9.2), 
                new Edge(C4F1, 8.2), 
                new Edge(C4F2, 7.8) 
            };
            
            C3F4.adjacencies = new Edge[]{ 
                new Edge(C2F3, 9.4), 
                new Edge(C2F4, 9.8), 
                new Edge(C2F5, 10.2), 
                new Edge(C3F5, 9.2), 
                new Edge(C4F4, 7.8), 
                new Edge(C4F5, 8.2) 
            };
            
            C3F5.adjacencies = new Edge[]{ 
                new Edge(C2F4, 9.8), 
                new Edge(C2F5, 10.2), 
                new Edge(C3F4, 8.8), 
                new Edge(C4F4, 7.8), 
                new Edge(C4F5, 8.2) 
            };
            
            //////////////////////////////////////////////////
            C4F1.adjacencies = new Edge[]{ 
                new Edge(C3F1, 9.2), 
                new Edge(C3F2, 8.8), 
                new Edge(C4F2, 7.8), 
                new Edge(C5F2, 6.8) 
            };
            
            C4F2.adjacencies = new Edge[]{ 
                new Edge(C3F1, 9.2), 
                new Edge(C3F2, 8.8), 
                new Edge(C4F1, 8.2),
                new Edge(C5F2, 6.8), 
                new Edge(C5F3, 6.4) 
            };
            
            C4F4.adjacencies = new Edge[]{ 
                new Edge(C3F4, 8.8), 
                new Edge(C3F5, 9.2), 
                new Edge(C4F5, 8.2), 
                new Edge(C5F3, 6.4), 
                new Edge(C5F4, 6.8), 
                new Edge(C5F5, 7.8)
            };
            
            C4F5.adjacencies = new Edge[]{ 
                new Edge(C3F4, 8.8), 
                new Edge(C3F5, 9.2), 
                new Edge(C4F4, 7.8), 
                new Edge(C5F4, 6.8), 
                new Edge(C5F5, 7.8)
            };
            
            ////////////////////////////////////////////////
            C5F2.adjacencies = new Edge[]{ 
                new Edge(C4F1, 8.2), 
                new Edge(C4F2, 7.8), 
                new Edge(C5F3, 6.4), 
                new Edge(C6F1, 6.8), 
                new Edge(C6F2, 5.8), 
                new Edge(C6F3, 5.4) 
            };
            
            C5F3.adjacencies = new Edge[]{ 
                new Edge(C4F2, 7.8), 
                new Edge(C4F4, 7.8), 
                new Edge(C5F2, 6.8), 
                new Edge(C5F4, 6.8), 
                new Edge(C6F2, 5.8), 
                new Edge(C6F3, 5.4) 
            };

            /////////////////////////////////////////////////////////////// Columna 4

            C5F4.adjacencies = new Edge[]{ 
                new Edge(C4F4, 7.8),
                new Edge(C4F5, 8.2),
                new Edge(C5F3, 6.4),
                new Edge(C5F5, 7.8),
                new Edge(C6F3, 5.4),
            };

            /////////////////////////////////////////////////////////////// Columna 5

            C5F5.adjacencies = new Edge[]{ 
                new Edge(C4F4, 7.8),
                new Edge(C4F5, 8.2),
                new Edge(C5F4, 6.8),
            };

            /////////////////////////////////////////////////////////////// Columna 6

            C6F1.adjacencies = new Edge[]{ 
                new Edge(C5F2, 6.8),
                new Edge(C6F2, 5.8),
                new Edge(C7F1, 5.8),
                new Edge(C7F2, 4.8),
            };
            
            C6F2.adjacencies = new Edge[]{ 
                new Edge(C5F2, 6.8),
                new Edge(C5F3, 6.4),
                new Edge(C6F1, 6.8),
                new Edge(C6F3, 5.4),
                new Edge(C7F1, 5.8),
                new Edge(C7F2, 4.8),
                new Edge(C7F3, 4.4),
            };
            
            C6F3.adjacencies = new Edge[]{ 
                new Edge(C5F2, 6.8),
                new Edge(C5F3, 6.4),
                new Edge(C5F4, 6.8),
                new Edge(C6F2, 5.8),
                new Edge(C7F2, 4.8),
                new Edge(C7F3, 4.4),
                new Edge(C7F4, 4),
            };

            /////////////////////////////////////////////////////////////// Columna 7

            C7F1.adjacencies = new Edge[]{ 
                new Edge(C6F1, 6.8),
                new Edge(C6F2, 5.8),
                new Edge(C7F2, 4.8),
                new Edge(C8F1, 4.8),
                new Edge(C8F2, 4.4),
            };
            
            C7F2.adjacencies = new Edge[]{ 
                new Edge(C6F1, 6.8),
                new Edge(C6F2, 5.8),
                new Edge(C6F3, 5.4),
                new Edge(C7F1, 5.8),
                new Edge(C7F3, 4.4),
                new Edge(C8F1, 4.8),
                new Edge(C8F2, 4.4),
                new Edge(C8F3, 3.4),
            };
            
            C7F3.adjacencies = new Edge[]{ 
                new Edge(C6F2, 5.8),
                new Edge(C6F3, 5.4),
                new Edge(C7F2, 4.8),
                new Edge(C7F4, 4),
                new Edge(C8F2, 4.4),
                new Edge(C8F3, 3.4),
                new Edge(C8F4, 3),
            };
            
            C7F4.adjacencies = new Edge[]{ 
                new Edge(C6F3, 5.4),
                new Edge(C7F3, 4.4),
                new Edge(C7F5, 4.4),
                new Edge(C8F3, 3.4),
                new Edge(C8F4, 3),
                new Edge(C8F5, 3.4),
            };

            C7F5.adjacencies = new Edge[]{ 
                new Edge(C7F4, 4),
                new Edge(C8F4, 3),
                new Edge(C8F5, 3.4),
            };

            /////////////////////////////////////////////////////////////// Columna 8

            C8F1.adjacencies = new Edge[]{ 
                new Edge(C7F1, 5.8),
                new Edge(C7F2, 4.8),
                new Edge(C8F2, 4.4),
                new Edge(C9F1, 3.8),
            };

            C8F2.adjacencies = new Edge[]{ 
                new Edge(C7F1, 5.4),
                new Edge(C7F2, 4.8),
                new Edge(C7F3, 4.4),
                new Edge(C8F1, 4.8),
                new Edge(C8F3, 3.4),
                new Edge(C9F1, 3.8),
            };
            
            C8F3.adjacencies = new Edge[]{ 
                new Edge(C7F2, 4.8),
                new Edge(C7F3, 4.4),
                new Edge(C7F4, 4),
                new Edge(C8F2, 4.4),
                new Edge(C8F4, 3),
                new Edge(C9F4, 3.4),
            };
            
            C8F4.adjacencies = new Edge[]{ 
                new Edge(C7F3, 4.4),
                new Edge(C7F4, 4),
                new Edge(C7F5, 4.4),
                new Edge(C8F3, 3.4),
                new Edge(C8F5, 3.4),
                new Edge(C9F4, 2),
                new Edge(C9F5, 2.4),
            };

            C8F5.adjacencies = new Edge[]{ 
                new Edge(C7F4, 4),
                new Edge(C7F5, 4.4),
                new Edge(C8F4, 3),
                new Edge(C9F4, 2),
                new Edge(C9F5, 2.4),
            };

            /////////////////////////////////////////////////////////////// Columna 9

            C9F1.adjacencies = new Edge [] {
                new Edge (C8F1, 5.8),
                new Edge (C8F2, 4.4),
                new Edge (C10F1, 3.4),
                new Edge (C10F2, 2.4),
            };

            C9F4.adjacencies = new Edge [] {
                new Edge (C8F4, 2),
                new Edge (C8F5, 2.4),
                new Edge (C10F3, 1.4),
                new Edge (C10F4, 1),
                new Edge (C10F5, 1.4),
            };

            C9F5.adjacencies = new Edge [] {
                new Edge (C8F5, 3.4),
                new Edge (C8F4, 3),
                new Edge (C9F4, 2),
                new Edge (C10F4, 1),
                new Edge (C10F5, 1.4),
            };

            /////////////////////////////////////////////////////////////// Columna 10

            C10F1.adjacencies = new Edge [] {
                new Edge (C9F1, 3.8),
                new Edge (C10F2, 2.4),
                new Edge (C11F1, 3),
                new Edge (C11F2, 2),
            };

            C10F2.adjacencies = new Edge [] {
                new Edge (C10F1, 3.4),
                new Edge (C10F3, 1.4),
                new Edge (C11F1, 3),
                new Edge (C11F2, 2),
            };

            C10F3.adjacencies = new Edge [] {
                new Edge (C10F2, 2.4),
                new Edge (C11F2, 2),
                new Edge (C10F4, 1),
                new Edge (C11F4, 0),
                new Edge (C10F4, 1),
            };

            C10F4.adjacencies = new Edge [] {
                new Edge (C10F3, 1.4),
                new Edge (C11F3, 1),
                new Edge (C11F4, 0),
                new Edge (C11F5, 1),
                new Edge (C10F5, 1.4),
                new Edge (C9F5, 2.4),
                new Edge (C9F4, 2),
            };

            C10F5.adjacencies = new Edge [] {
                new Edge (C11F5, 1),
                new Edge (C11F4, 0),
                new Edge (C10F4, 1),
                new Edge (C9F4, 2),
                new Edge (C9F5, 2.4),
            };

            /////////////////////////////////////////////////////////////// Columna 11

            C11F1.adjacencies = new Edge[]{ 
                new Edge(C10F1, 3.4),
                new Edge(C10F2, 2.4),
                new Edge(C11F2, 2),
            };
            
            C11F2.adjacencies = new Edge[]{ 
                new Edge(C10F1, 3.4),
                new Edge(C10F2, 2.4),
                new Edge(C10F3, 1.4),
                new Edge(C11F1, 3),
                new Edge(C11F3, 1),
            };

            C11F3.adjacencies = new Edge[]{ 
                new Edge(C10F2, 2.4),
                new Edge(C10F3, 1.4),
                new Edge(C10F4, 1),
                new Edge(C11F2, 2),
                new Edge(C11F4, 0),
            };
            
            C11F4.adjacencies = new Edge[]{ 
                new Edge(C10F3, 1.4),
                new Edge(C10F4, 1),
                new Edge(C10F5, 1.4),
                new Edge(C11F3, 1),
                new Edge(C11F5, 1),
            };
            
            C11F5.adjacencies = new Edge[]{ 
                new Edge(C10F4, 1),
                new Edge(C10F5, 1.4),
                new Edge(C11F4, 0),
            };

            computePaths(C1F1); // run Dijkstra
            System.out.println("Distance to " + C11F4 + ": " + C11F4.minDistance);
            List<Vertex> path = getShortestPathTo(C11F4);
            System.out.println("Path: " + path);

            // Distance to 0: 48.2
            // Path: [11.2, 9.8, 8.8, 7.8, 6.4, 5.4, 4, 3, 2, 1, 0]
       }
}