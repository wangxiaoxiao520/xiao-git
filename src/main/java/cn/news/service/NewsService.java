package cn.news.service;

import cn.news.entity.NewsCategory;
import cn.news.entity.NewsDetail;

import java.util.List;

public interface NewsService {

    //查询所有的新闻分类信息
    List<NewsCategory> queryAllCategory();

    //根据分类和标题模糊查询新闻信息
    List<NewsDetail> queryAllNews(Integer categoryId, String title);

    //根据新闻编号获取新闻信息
    NewsDetail queryNewsById(Integer id);

    //根据新闻标题查询新闻记录数
    int queryCountByTitle(String title);

    //更新
    int updateNews(NewsDetail detail);
}
