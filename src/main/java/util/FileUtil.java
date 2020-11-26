/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.UUID;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Bian
 */
public class FileUtil {
    public String WriteFileToPath(String path, String id, InputStream input) throws IOException{        
        path = path.trim().replace("\\build\\exploded\\ECommerce.war", "\\src\\main\\webapp");

        try(FileOutputStream output = new FileOutputStream(path+id)){
            int b = 0;
            while ((b = input.read()) >= 0) {
                output.write(b);
            }
            input.close();            
            output.close();
            return id;
        } catch (FileNotFoundException ex) {
            return null;
        }
    }
    
    public void WriteCopy(String source, String imageName, String destiny, InputStream input) throws IOException{        
        Files.copy(input, Paths.get(destiny + imageName), StandardCopyOption.REPLACE_EXISTING);
    }
    
    public boolean DeleteFile(String path, String name){
        path = path.trim().replace("\\build\\exploded\\ECommerce.war", "\\src\\main\\webapp");
        
        File file = new File(path+name);
        if(file.delete()){
            return true;
        } else {
            return false;
        }
    }
}