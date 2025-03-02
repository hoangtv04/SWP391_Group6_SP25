/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.List;
import model.Movie;

/**
 *
 * @author tovie
 */
public class test {
    public static void main(String[] args) {
        MovieDAO dao = new MovieDAO();
        List<Movie> list = dao.getAllMovies();
        for (Movie m : list) {
            System.out.println(m);
        }
    }
}
