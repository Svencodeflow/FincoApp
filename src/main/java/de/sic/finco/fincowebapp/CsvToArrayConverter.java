package de.sic.finco.fincowebapp;

import org.springframework.stereotype.Service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

@Service
public class CsvToArrayConverter {
    // existing fields and methods

    public List<String[]> convert(InputStream inputStream) {
        List<String[]> csvData = new ArrayList<>();
        try (BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream))) {
            String line;
            while ((line = reader.readLine()) != null) {
                csvData.add(line.split(";"));
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return csvData;
    }
}