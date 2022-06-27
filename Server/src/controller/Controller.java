package controller;

import database.Database;
import utils.Convertor;

import java.util.ArrayList;
import java.util.HashMap;

public class Controller {
    private String login(HashMap<String ,String> data)
    {
        ArrayList<HashMap<String,String>> list=Database.getInstance().getTable("users").get();
        for (HashMap<String, String> stringStringHashMap : list) {
            if (stringStringHashMap.equals(data)) {
                return "accepted";
            }
        }
        return "The username or password is incorrect!";
    }
    
    public String run(String command, String data)
    {
        HashMap<String,String> dataMap= Convertor.stringToMap(data);
        switch (command)
        {
            case "login":
                return login(dataMap);
        }
        return "dadash eshteb zadi";
    }
}
