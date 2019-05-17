package cn.news.entity;

//新闻分类实体类
public class NewsCategory {
    private Integer id;
    private String name;
    private String address;
    private String title;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
