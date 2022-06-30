package controller;

import database.Database;
import utils.Convertor;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Objects;

public class Controller {
    static int numberOfUser = 0;
    static int numberOfCommunities = 0;
    static int numberOfPost;
    private String login(HashMap<String ,String> data)
    {
        ArrayList<HashMap<String,String>> list=Database.getInstance().getTable("users").get();
        for (HashMap<String, String> sSH : list) {
            if (Objects.equals(sSH.get("username"), data.get("username"))) {
                return "accepted"+ sSH.get("number");
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

    private String showComment(HashMap<String ,String> data)
    {
        ArrayList<HashMap<String,String>> list=Database.getInstance().getTable("comments").get();
        StringBuilder output = new StringBuilder();
        int commentCounter=0;
        for (HashMap<String, String> stringStringHashMap : list) {
            if (Objects.equals(stringStringHashMap.get("post"), data.get("post"))) {
                commentCounter++;
                output.append(stringStringHashMap.get("username")).append(": ").append(stringStringHashMap.get("comment")).append("\n");
            }
        }
        return  "accepted"+commentCounter+"\n"+ output;
    }
    private String addComment(HashMap<String ,String> data)
    {
        try {
            Database.getInstance().getTable("comments").insert(data);
            return "accepted";
        } catch (Exception e) {
            return "not accepted";
        }
    }

    private String createCommunity(HashMap<String, String> data) {
        try {
            data.put("number",String.valueOf(numberOfCommunities));
            Database.getInstance().getTable("communities").insert(data);
            numberOfCommunities++;
            return "accepted";
        } catch (Exception e) {
            return "not accepted";
        }
    }

    public String run(String command, String data)
    {
        HashMap<String,String> dataMap= Convertor.stringToMap(data);
        return switch (command) {
            case "showcomment" -> showComment(dataMap);
            case "addcomment" -> addComment(dataMap);
            case "login" -> login(dataMap);
            case "signup" -> signup(dataMap);
            case "editProfile" -> editProfile(dataMap);
            case "createcommunity" -> createCommunity(dataMap);
            case "showcommunities" -> showCommunities(dataMap);
            case "createpost" -> createPost(dataMap);
            case "showposts" -> showPosts(dataMap);
            default -> "invalid command";
        };
    }

    private String showPosts(HashMap<String, String> dataMap) {
        ArrayList<HashMap<String,String>> list=Database.getInstance().getTable("posts").get();
        StringBuilder output = new StringBuilder();
        for (HashMap<String, String> stringStringHashMap : list) {

            output.append(stringStringHashMap.get("user")).append(" ").append(stringStringHashMap.get("title")).append(" ").append(stringStringHashMap.get("text")).append(" ").append(stringStringHashMap.get("time")).append(" ").append(stringStringHashMap.get("number")).append("\n");

        }
        return  "accepted\n" + output;
    }

    private String createPost(HashMap<String, String> data) {
        try {

            data.put("number",String.valueOf(numberOfPost));
            Database.getInstance().getTable("posts").insert(data);
            numberOfPost++;
            return "accepted";
        } catch (Exception e) {
            return "not accepted";
        }
    }

    private String showCommunities(HashMap<String, String> data) {

        ArrayList<HashMap<String,String>> list=Database.getInstance().getTable("communities").get();
        StringBuilder output = new StringBuilder();
        for (HashMap<String, String> stringStringHashMap : list) {

                output.append(stringStringHashMap.get("name")).append(" ").append(stringStringHashMap.get("admin")).append(" ").append(stringStringHashMap.get("number")).append("\n");

        }
        return  "accepted\n" + output;
    }


}
