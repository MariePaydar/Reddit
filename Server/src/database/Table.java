package database;

import utils.Convertor;

import java.io.File;
import java.io.FileWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Scanner;

public class Table {
    private String path;
    public Table(String path){
        this.path=path;
    }
    public void insert(HashMap<String,String> row) throws Exception {
        FileWriter fileWriter=new FileWriter(path,true);
        fileWriter.write(Convertor.mapToString(row)+"\n");
        fileWriter.close();
    }
    public ArrayList<HashMap<String,String>> get(){
        try {
            File file = new File(path);
            Scanner sc = new Scanner(file);
            ArrayList<HashMap<String,String>> data=new ArrayList<>();
            while(sc.hasNextLine())
            {
                String str=sc.nextLine();
                data.add(Convertor.stringToMap(str));
            }
            return data;
        }catch(Exception e){}
        return new ArrayList<>();
    }
}
