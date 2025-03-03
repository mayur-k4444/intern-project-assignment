package com;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@WebServlet("/upload")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, // 1MB (threshold for writing to disk)
                maxFileSize = 10485760 * 2,   // 20MB (double the current limit)
                maxRequestSize = 10485760 * 4) // 40MB (double the maxFileSize)
public class upload extends HttpServlet {
    private static final String UPLOAD_DIRECTORY = "C:/Assingment-project/backend_assinment/src/main/uploads";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");

        String stdId = req.getParameter("StudentId2");
        String Coursename = req.getParameter("FirstYear");
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/assignmentupdow", "root", "");
            PreparedStatement pr = con.prepareStatement("UPDATE bscit SET FirstYear = ? WHERE StudentId = ?");
            pr.setString(1, Coursename);
            pr.setString(2, stdId);
            int i = pr.executeUpdate();
            if (i > 0) {
                System.out.println("Upload successfully");
            }
            pr.close();
            con.close();
        } catch (Exception e) {
            System.out.println("Error :" + e.getMessage());
        }

        updateField(req, "Ipa", stdId);
        updateField(req, "Dea", stdId);
        updateField(req, "Osa", stdId);
        updateField(req, "Dma", stdId);
        updateField(req, "Csa", stdId);
        updateField(req, "Oops", stdId);
        updateField(req, "Maa", stdId);
        updateField(req, "Wpa", stdId);
        updateField(req, "NSma", stdId);
        updateField(req, "Gca", stdId);
    }

    private void updateField(HttpServletRequest req, String fieldName, String stdId) {
        // String fieldValue = req.getParameter(fieldName);
        
            try {
                Part filePart = req.getPart(fieldName);
                InputStream fileContent = filePart.getInputStream();

                Path uploadPath = Paths.get(UPLOAD_DIRECTORY);
                if (!Files.exists(uploadPath)) {
                    Files.createDirectories(uploadPath);
                }
                Path filePath = uploadPath.resolve(filePart.getSubmittedFileName());
                Files.copy(fileContent, filePath, StandardCopyOption.REPLACE_EXISTING);

                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/assignmentupdow", "root", "");
                PreparedStatement pr = con.prepareStatement("UPDATE bscit SET " + fieldName + " = ? WHERE StudentId = ?");
                pr.setString(1, filePath.toString());
                pr.setString(2, stdId);
                int i = pr.executeUpdate();
                if (i > 0) {
                    System.out.println("Upload file" + fieldName + " successfully");
                }
                pr.close();
                con.close();
            } catch (Exception e) {
                System.out.println("Error :" + e.getMessage());
            }
        }
    }
