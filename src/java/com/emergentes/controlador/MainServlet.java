package com.emergentes.controlador;

import com.emergentes.modelo.EstudianteNAVC;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Villalba
 */
@WebServlet(name = "MainServlet", urlPatterns = {"/MainServlet"})
public class MainServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String op = request.getParameter("op");
        EstudianteNAVC objEst = new EstudianteNAVC();
        int id, pos;
        HttpSession ses = request.getSession();
        ArrayList<EstudianteNAVC> lista = (ArrayList<EstudianteNAVC>) ses.getAttribute("listaest");
        switch (op) {
            case "nuevo":
                request.setAttribute("miobjest", objEst);
                request.getRequestDispatcher("editar.jsp").forward(request, response);
                break;
            case "editar":
                id = Integer.parseInt(request.getParameter("id"));
                pos = buscarPorId(request, id);
                objEst = lista.get(pos);
                request.setAttribute("miobjest", objEst);
                request.getRequestDispatcher("editar.jsp").forward(request, response);
                break;
            case "eliminar":
                id = Integer.parseInt(request.getParameter("id"));
                pos = buscarPorId(request, id);
                if (pos >= 0) {
                    lista.remove(pos);
                }
                request.setAttribute("listaest", lista);
                response.sendRedirect("index.jsp");
                break;
            default:
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        HttpSession ses = request.getSession();
        ArrayList<EstudianteNAVC> lista = (ArrayList<EstudianteNAVC>) ses.getAttribute("listaest");
        EstudianteNAVC objest = new EstudianteNAVC();
        objest.setId(id);
        if (Integer.parseInt(request.getParameter("p1")) <= 30 && Integer.parseInt(request.getParameter("p2")) <= 30 && Integer.parseInt(request.getParameter("ef")) <= 40) {
            objest.setNombre(request.getParameter("nombre"));
            objest.setP1(Integer.parseInt(request.getParameter("p1")));
            objest.setP2(Integer.parseInt(request.getParameter("p2")));
            objest.setEf(Integer.parseInt(request.getParameter("ef")));
            if (id == 0) {
                int idNuevo = obtenerId(request);
                objest.setId(idNuevo);
                lista.add(objest);
            } else {
                int pos = buscarPorId(request, id);
                lista.set(pos, objest);
            }
            request.setAttribute("listaest", lista);
            response.sendRedirect("index.jsp");
        } else {
            response.sendRedirect("index.jsp");
        }

    }

    public int buscarPorId(HttpServletRequest request, int id) {
        HttpSession ses = request.getSession();
        ArrayList<EstudianteNAVC> lista = (ArrayList<EstudianteNAVC>) ses.getAttribute("listaest");
        int pos = -1;
        if (lista != null) {
            for (EstudianteNAVC elem : lista) {
                ++pos;
                if (elem.getId() == id) {
                    break;
                }
            }
        }
        return pos;
    }

    public int obtenerId(HttpServletRequest request) {
        HttpSession ses = request.getSession();
        ArrayList<EstudianteNAVC> lista = (ArrayList<EstudianteNAVC>) ses.getAttribute("listaest");
        int idn = 0;
        for (EstudianteNAVC item : lista) {
            idn = item.getId();
        }
        return idn + 1;
    }

}
