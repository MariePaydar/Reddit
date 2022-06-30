package controller;

import database.Database;
import utils.Convertor;

import javax.swing.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Objects;

public class Controller {
    static int numberOfUser = 0;
    private String login(HashMap<String ,String> data)
    {
        ArrayList<HashMap<String,String>> list=Database.getInstance().getTable("users").get();
        for (HashMap<String, String> sSH : list) {
            if (Objects.equals(sSH.get("username"), data.get("username"))) {
                return "accepted";
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
            data.put("number",String.valueOf(numberOfUser));
            Database.getInstance().getTable("users").insert(data);
            numberOfUser++;
            return "accepted\n"+ (numberOfUser - 1);
        }catch (Exception e){
            return "oops, something goes wrong";
        }
    }

    private String editProfile(HashMap<String, String> data) {
        try {
            ArrayList<HashMap<String,String>> list=Database.getInstance().getTable("users").get();
            System.out.println("data number"+data.get("number"));
            for (HashMap<String, String> stringStringHashMap : list) {
                if (!Objects.equals(stringStringHashMap.get("number"), data.get("number"))) {

                    if (Objects.equals(stringStringHashMap.get("username"), data.get("username"))) {
                        return "this username is already taken";
                    }
                    if (Objects.equals(stringStringHashMap.get("email"), data.get("email"))) {
                        return "this email is already have an account";
                    }
                }
            }
            for (HashMap<String, String> sSH : list) {
                if (Objects.equals(sSH.get("number"), data.get("number"))) {
                    sSH.put("email",data.get("email"));
                    sSH.put("username",data.get("username"));
                    if(!Objects.equals(data.get("password"), "")){
                        sSH.put("password",data.get("password"));
                    }
                    sSH.put("bio",data.get("bio"));
                }
            }
            System.out.println("replacing...");
            Database.getInstance().getTable("users").replace(list);
            return "accepted\n"+ (data.get("number"));
        }catch (Exception e){
            return "oops, something goes wrong";
        }
    }

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
        return switch (command) {
            case "get" -> get(dataMap);
            case "getBy" -> getBy();
            case  "send" -> send(dataMap);
            case "login" -> login(dataMap);
            case "signup" -> signup(dataMap);
            case "editProfile" -> editProfile(dataMap);
            default -> "invalid command";
        };
    }
}
