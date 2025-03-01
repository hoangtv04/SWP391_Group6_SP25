/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import model.Movie;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author tovie
 */
public class MovieDAO extends DBContext {

    public List<Movie> getAllMovies() {
        List<Movie> movies = new ArrayList<>();
        String query = "SELECT * FROM Movie";
        try (Connection connection = getConnection(); Statement stmt = connection.createStatement(); ResultSet rs = stmt.executeQuery(query)) {
            while (rs.next()) {
                Movie movie = new Movie();
                movie.setMovieId(rs.getInt("MovieID"));
                movie.setTitle(rs.getString("Title"));
                movie.setGenre(rs.getString("Genre"));
                movie.setDuration(rs.getInt("Duration"));
                movie.setReleaseDate(rs.getDate("ReleaseDate"));
                movie.setDescription(rs.getString("Description"));
                movies.add(movie);
            }
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(MovieDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(MovieDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return movies;
    }

    public Movie getMovieById(int movieId) {
        String query = "SELECT * FROM Movie WHERE MovieID = ?";
        try (Connection connection = getConnection(); PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, movieId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                Movie movie = new Movie();
                movie.setMovieId(rs.getInt("MovieID"));
                movie.setTitle(rs.getString("Title"));
                movie.setGenre(rs.getString("Genre"));
                movie.setDuration(rs.getInt("Duration"));
                movie.setReleaseDate(rs.getDate("ReleaseDate"));
                movie.setDescription(rs.getString("Description"));
                return movie;
            }
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(MovieDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(MovieDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Movie getMovieByTitle(String title) {
        String query = "SELECT * FROM Movie WHERE Title = ?";
        try (Connection connection = getConnection(); PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, title);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                Movie movie = new Movie();
                movie.setMovieId(rs.getInt("MovieID"));
                movie.setTitle(rs.getString("Title"));
                movie.setGenre(rs.getString("Genre"));
                movie.setDuration(rs.getInt("Duration"));
                movie.setReleaseDate(rs.getDate("ReleaseDate"));
                movie.setDescription(rs.getString("Description"));
                return movie;
            }
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(MovieDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(MovieDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Movie getMovieByGenre(String genre) {
        String query = "SELECT * FROM Movie WHERE Genre = ?";
        try (Connection connection = getConnection(); PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, genre);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                Movie movie = new Movie();
                movie.setMovieId(rs.getInt("MovieID"));
                movie.setTitle(rs.getString("Title"));
                movie.setGenre(rs.getString("Genre"));
                movie.setDuration(rs.getInt("Duration"));
                movie.setReleaseDate(rs.getDate("ReleaseDate"));
                movie.setDescription(rs.getString("Description"));
                return movie;
            }
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(MovieDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(MovieDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Movie getMovieByReleaseDate(Date releaseDate) {
        String query = "SELECT * FROM Movie WHERE ReleaseDate = ?";
        try (Connection connection = getConnection(); PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setDate(1, releaseDate);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                Movie movie = new Movie();
                movie.setMovieId(rs.getInt("MovieID"));
                movie.setTitle(rs.getString("Title"));
                movie.setGenre(rs.getString("Genre"));
                movie.setDuration(rs.getInt("Duration"));
                movie.setReleaseDate(rs.getDate("ReleaseDate"));
                movie.setDescription(rs.getString("Description"));
                return movie;
            }
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(MovieDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(MovieDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public boolean addMovie(Movie movie) {
        String query = "INSERT INTO Movie (Title, Genre, Duration, ReleaseDate, Description) VALUES (?, ?, ?, ?, ?)";
        try (Connection connection = getConnection(); PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, movie.getTitle());
            stmt.setString(2, movie.getGenre());
            stmt.setInt(3, movie.getDuration());
            stmt.setDate(4, movie.getReleaseDate());
            stmt.setString(5, movie.getDescription());
            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(MovieDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(MovieDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public boolean updateMovie(Movie movie) {
        String query = "UPDATE Movie SET Title = ?, Genre = ?, Duration = ?, ReleaseDate = ?, Description = ? WHERE MovieID = ?";
        try (Connection connection = getConnection(); PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, movie.getTitle());
            stmt.setString(2, movie.getGenre());
            stmt.setInt(3, movie.getDuration());
            stmt.setDate(4, movie.getReleaseDate());
            stmt.setString(5, movie.getDescription());
            stmt.setInt(6, movie.getMovieId());
            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(MovieDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(MovieDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public boolean deleteMovie(int movieId) {
        String query = "DELETE FROM Movie WHERE MovieID = ?";
        try (Connection connection = getConnection(); PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, movieId);
            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(MovieDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(MovieDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public static void main(String[] args) {
        MovieDAO dao = new MovieDAO();
        try {
            System.out.println(dao.getMovieById(1));
        } catch (Exception ex) {
            Logger.getLogger(MovieDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
