import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class HomeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getServletPath();
        if (path.equals("/")){
            request.getRequestDispatcher("/WEB-INF/view/index.jsp").forward(request, response);
        }
        else if (path.equals("/welcome")){
            request.getRequestDispatcher("/WEB-INF/view/welcome.jsp").forward(request, response);
        }
        else if (path.equals(("/logError"))){
            request.getRequestDispatcher("/WEB-INF/view/logError.jsp").forward(request, response);
        }
        else if (path.equals(("/admin/main"))){
            request.getRequestDispatcher("/WEB-INF/view/admin/main.jsp").forward(request, response);
        }
        else if (path.equals(("/user/main"))){
            request.getRequestDispatcher("/WEB-INF/view/user/main.jsp").forward(request, response);
        }
        else if (path.equals(("/logout"))){
            request.getRequestDispatcher("/WEB-INF/backend/logout.jsp").forward(request, response);
        }
        else if (path.equals(("/admin/students"))){
            request.getRequestDispatcher("/WEB-INF/view/admin/students.jsp").forward(request, response);
        }
        else if (path.equals(("/admin/timetable"))){
            request.getRequestDispatcher("/WEB-INF/view/admin/timetable.jsp").forward(request, response);
        }
        else if (path.equals(("/user/timetable"))){
            request.getRequestDispatcher("/WEB-INF/view/user/timetable.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String path = request.getServletPath();
        if (request.getServletPath().equals(("/login"))) {
            request.getRequestDispatcher("/WEB-INF/backend/login.jsp").forward(request, response);
        } else if (path.equals(("/logError"))) {
            request.getRequestDispatcher("/WEB-INF/view/logError.jsp").forward(request, response);
        }
        else if (path.equals(("/admin/addStudent"))) {
            request.getRequestDispatcher("/WEB-INF/backend/addUser.jsp").forward(request, response);
        }
        else if (path.equals(("/admin/addGroup"))) {
            request.getRequestDispatcher("/WEB-INF/backend/addGroup.jsp").forward(request, response);
        }
        else if (path.equals(("/admin/deleteUser"))) {
            request.getRequestDispatcher("/WEB-INF/backend/deleteUser.jsp").forward(request, response);
        }
        else if (path.equals(("/admin/addUserToGroup"))) {
            request.getRequestDispatcher("/WEB-INF/backend/addUserToGroup.jsp").forward(request, response);
        }
        else if (path.equals(("/admin/deleteFromGroup"))) {
            request.getRequestDispatcher("/WEB-INF/backend/deleteFromGroup.jsp").forward(request, response);
        }
        else if (path.equals(("/admin/deleteGroup"))) {
            request.getRequestDispatcher("/WEB-INF/backend/deleteGroup.jsp").forward(request, response);
        }
        else if (path.equals(("/admin/alterGroup"))) {
            request.getRequestDispatcher("/WEB-INF/backend/alterGroup.jsp").forward(request, response);
        }
        else if (path.equals(("/admin/alterTimetable"))) {
            request.getRequestDispatcher("/WEB-INF/backend/alterTimetable.jsp").forward(request, response);
        }
    }
}