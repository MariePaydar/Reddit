package database;

import java.util.HashMap;

public class Database {

    private static Database instance=null;
    private HashMap<String,Table> tables;

    private Database(){
        tables=new HashMap<>();
        tables.put("users",new Table("src/data/users.txt"));
        tables.put("comments",new Table("src/data/comments.txt"));
        tables.put("posts",new Table("src/data/posts.txt"));
        tables.put("communities",new Table("src/data/communities.txt"));
        tables.put("membership",new Table("src/data/membership.txt"));

    }
    public static Database getInstance(){
        if(instance==null){
            instance=new Database();
        }
        return instance;
    }
    public Table getTable(String name){
        return tables.get(name);
    }
}
