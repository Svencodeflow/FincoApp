package de.sic.finco.fincowebapp;

import org.springframework.web.bind.annotation.PostMapping;
   import org.springframework.web.bind.annotation.RequestMapping;
   import org.springframework.web.bind.annotation.RequestParam;
   import org.springframework.web.multipart.MultipartFile;
   import org.springframework.stereotype.Controller;
   import org.springframework.ui.Model;

import java.util.List;

@Controller
@RequestMapping("/upload")
public class FileUploadCsvController {

    private final CsvToArrayConverter csvToArrayConverter;

    public FileUploadCsvController(CsvToArrayConverter csvToArrayConverter) {
        this.csvToArrayConverter = csvToArrayConverter;
    }

    @PostMapping
    public String handleFileUpload(@RequestParam("file") MultipartFile file, Model model) {
        if (file.isEmpty()) {
            model.addAttribute("message", "Please select a file to upload");
            return "uploadForm";
        }

        try {
            // Convert CSV to array
            List<String[]> csvData = csvToArrayConverter.convert(file.getInputStream());

            // Add CSV data to model
            model.addAttribute("csvData", csvData);
            return "uploadSuccess";
        } catch (Exception e) {
            model.addAttribute("message", "An error occurred while processing the CSV file: " + e.getMessage());
            return "uploadForm";
        }
    }
}