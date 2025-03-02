
package dal;

import model.Movie;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

                movies.add(movie);
            }
        } catch (SQLException ex) {
            Logger.getLogger(MovieDAO.class.getName()).log(Level.SEVERE, null, ex);

        }
        return movies;
    }


        }
        return null;
    }

        }
        return false;
    }

    public boolean updateMovie(Movie movie) {

        }
        return false;
    }


}
