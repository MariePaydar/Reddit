package controller;

import database.Database;
import utils.Convertor;

import java.util.ArrayList;
import java.util.HashMap;

public class Controller {
    private String get(HashMap<String ,String> data)
    {
        int count=Integer.valueOf(data.get("count"));
        ArrayList<HashMap<String,String>> list=Database.getInstance().getTable("mwssages").get();
        ArrayList<HashMap<String,String>> finalList=new ArrayList<>();
        for(int i= list.size()-1;i>=Math.max(0, list.size())-count;i--){
            finalList.add(list.get(i));
        }
        return  Convertor.arrMapToString(finalList);
    }
    private String getBy()
    {
        return  "";
    }
    private String send(HashMap<String,String> data)
    {
        try {
            Database.getInstance().getTable("massages").insert(data);
            return "massage successfully saved";
        }catch (Exception e){
            return "something goes wrong";
        }
    }
    public String run(String command, String data)
    {
        HashMap<String,String> dataMap= Convertor.stringToMap(data);
        switch (command)
        {
            case "get":
                return get(dataMap);
            case "getBy":
                return getBy();
            case  "send":
                return send(dataMap);
        }
        return "dadash eshteb zadi";
    }
}
