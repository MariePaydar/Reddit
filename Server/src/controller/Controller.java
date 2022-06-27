package controller;

import database.Database;
import utils.Convertor;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Objects;

public class Controller {
    private String login(HashMap<String ,String> data)
    {
        ArrayList<HashMap<String,String>> list=Database.getInstance().getTable("users").get();
        for (HashMap<String, String> sSH : list) {
            if (Objects.equals(sSH.get("username"), data.get("username"))) {
                return "this username is taken";
            }
        }
        return "The username or password is incorrect!";
    }

    private String signup(HashMap<String ,String> data)
    {
        try {
            ArrayList<HashMap<String,String>> list=Database.getInstance().getTable("users").get();
            for (HashMap<String, String> sSH : list) {
                if (Objects.equals(sSH.get("username"), data.get("username"))) {
                    return "this username is already taken";
                }
                if (Objects.equals(sSH.get("email"), data.get("email"))) {
                    return "this email is already have an account";
                }
            }
            Database.getInstance().getTable("users").insert(data);
            return "accepted";
        }catch (Exception e){
            return "oops, something goes wrong";
        }
    }
    
    public String run(String command, String data)
    {
        HashMap<String,String> dataMap= Convertor.stringToMap(data);
        return switch (command) {
            case "login" -> login(dataMap);
            case "signup" -> signup(dataMap);
            default -> "invalid command";
        };
    }
}
