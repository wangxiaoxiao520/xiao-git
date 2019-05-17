package cn.news.service;


import cn.news.dao.NewsMapper;
import cn.news.entity.NewsCategory;
import cn.news.entity.NewsDetail;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("newsService")
public class NewsServiceImpl implements NewsService {

    @Resource
    private NewsMapper newsMapper;

    @Override
    public List<NewsDetail> queryAllNews(Integer categoryId, String title) {
        return newsMapper.queryAllNews(categoryId, title);
    }

    @Override
    public NewsDetail queryNewsById(Integer id) {
        return newsMapper.queryNewsById(id);
    }

    @Override
    public List<NewsCategory> queryAllCategory() {
        return newsMapper.queryAllCategory();
    }

    @Override
    public int queryCountByTitle(String title) {
        return newsMapper.queryCountByTitle(title);
    }

    @Override
    public int updateNews(NewsDetail detail) {
        return newsMapper.updateNews(detail);
    }
}
