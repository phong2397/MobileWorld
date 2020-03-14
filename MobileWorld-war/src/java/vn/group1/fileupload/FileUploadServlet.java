package vn.group1.fileupload;

import com.google.gson.Gson;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FilenameUtils;
import vn.group1.entity.Customer;
import vn.group1.sb.CustomerFacadeLocal;

/**
 *
 * @author junev
 */
@WebServlet(name = "FileUploadServlet", urlPatterns = {"/upload"})
public class FileUploadServlet extends HttpServlet {

    @EJB
    private CustomerFacadeLocal customerFacade;

    // location to store file uploaded
    private static final String UPLOAD_DIRECTORY = "uploads";

    // upload settings
    private static final int MEMORY_THRESHOLD = 1024 * 1024 * 3;  // 3MB
    private static final int MAX_FILE_SIZE = 1024 * 1024 * 5; // 5MB
    private static final int MAX_REQUEST_SIZE = 1024 * 1024 * 50; // 50MB

    /**
     * Upon receiving file upload submission, parses the request to read upload
     * data and saves the file on disk.
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.setAttribute("uid", 1);
        String uid = session.getAttribute("uid").toString();
        Customer user = customerFacade.find(Integer.parseInt(uid));

        if (user == null) {
            response.sendError(203, "Authorization is required");
        }

        // checks if the request actually contains upload file
        if (!ServletFileUpload.isMultipartContent(request)) {
            // if not, we stop here
            PrintWriter writer = response.getWriter();
            writer.println("Error: Form must has enctype=multipart/form-data.");
            writer.flush();
            writer.close();
            return;
        }

        // configures upload settings
        DiskFileItemFactory factory = new DiskFileItemFactory();
        // sets memory threshold - beyond which files are stored in disk
        factory.setSizeThreshold(MEMORY_THRESHOLD);
        // sets temporary location to store files
        factory.setRepository(new File(System.getProperty("java.io.tmpdir")));

        ServletFileUpload upload = new ServletFileUpload(factory);

        // sets maximum size of upload file
        upload.setFileSizeMax(MAX_FILE_SIZE);

        // sets maximum size of request (include file + form data)
        upload.setSizeMax(MAX_REQUEST_SIZE);

        // constructs the directory path to store upload file
        // this path is relative to application's directory
        String uploadPath = "C:" + File.separator + UPLOAD_DIRECTORY;

        // creates the directory if it does not exist
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }

        try {
            // parses the request's content to extract file data
            @SuppressWarnings("unchecked")
            List<FileItem> formItems = upload.parseRequest(request);

            if (formItems != null && formItems.size() > 0) {
                PrintWriter writer = response.getWriter();
                List<String> fileNames = new ArrayList<>();

                for (int i = 0; i < formItems.size(); i++) {
                    FileItem file = formItems.get(i);
                    if (!file.isFormField()) {
                        String ext = FilenameUtils.getExtension(file.getName());
                        String fileName = new Date().getTime() + i + "." + ext;
                        String filePath = uploadPath + File.separator + fileName;
                        File storeFile = new File(filePath);
                        file.write(storeFile);
                        fileNames.add(fileName);
                    }
                }

                Gson gson = new Gson();
                String json = gson.toJson(fileNames);
                writer.print(json);
                writer.close();
            }
        } catch (Exception ex) {

        }

    }
}
