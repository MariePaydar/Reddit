package utils;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class Convertor {
    public static HashMap<String,String> stringToMap(String str)
    {
        String[] exprs=str.split(",,");
        HashMap<String,String> data=new HashMap<>();
        for(String expr: exprs)
        {
            int colon=expr.indexOf(':');
            String key=expr.substring(0,colon);
            String value=expr.substring(colon+1);
            data.put(key,value);
        }
        return data;
    }
    public  static  String mapToString(HashMap<String,String> map)
    {
        StringBuilder str=new StringBuilder();
        for(Map.Entry<String,String>entry : map.entrySet())
        {
             str.append(String.format("%s:%s,,",entry,entry.getKey(),entry.getValue()));

        }
        str.delete(str.length()-2,str.length());
        return str.toString();
    }
    public static String arrMapToString(ArrayList<HashMap<String ,String>>arr){
        StringBuilder str=new StringBuilder();
        for(HashMap<String,String> row: arr){
            str.append(mapToString(row)).append("\n");
        }
        return str.toString();
    }
}
