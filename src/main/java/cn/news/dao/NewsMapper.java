package cn.news.dao;


import cn.news.entity.NewsCategory;
import cn.news.entity.NewsDetail;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface NewsMapper {

    //查询所有的新闻分类信息
    List<NewsCategory> queryAllCategory();

    //根据分类和标题模糊查询新闻信息
    List<NewsDetail> queryAllNews(@Param("categoryId") Integer categoryId,@Param("title") String title);

    //根据新闻编号获取新闻信息
    NewsDetail queryNewsById(@Param("id") Integer id);

    //根据新闻标题查询新闻记录数
    int queryCountByTitle(@Param("title") String title);

    //更新
    int updateNews(NewsDetail detail);
}
