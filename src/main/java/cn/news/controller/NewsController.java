package cn.news.controller;

import cn.news.entity.NewsCategory;
import cn.news.entity.NewsDetail;
import cn.news.service.NewsService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/index")
public class NewsController {

    @Resource
    private NewsService newsService;

    @RequestMapping("/saveUpdate")
    public String saveUpdate(NewsDetail detail, Model model) {
        detail.setUpdateDate(new Date());
        int result = newsService.updateNews(detail);
        if (result > 0) {
            model.addAttribute("msg", "修改成功！");
            return "redirect:/index/list";
        } else {
            model.addAttribute("msg", "修改失败！");
            return "redirect:/index/list";
        }
    }

    @RequestMapping("/validateTitle")
    @ResponseBody
    public String validateTitle(@RequestParam String title) {
        int row = newsService.queryCountByTitle(title);
        if (row > 0) {
            return "false";
        } else {
            return "true";
        }
    }

    @RequestMapping("/toUpdate")
    public String toUpdate(@RequestParam Integer id, Model model) {
        //按id查询新闻信息，并跳转到修改页面，在修改页面中进行显示
        NewsDetail detail = newsService.queryNewsById(id);
        //查询所有的新闻分类信息
        List<NewsCategory> categoryList = newsService.queryAllCategory();
        model.addAttribute("detail", detail);
        model.addAttribute("categoryList", categoryList);
        return "update";
    }


    @RequestMapping("/list")
    public String lis(@RequestParam(value="categoryId",required = false,defaultValue = "0") Integer categoryId,
                        @RequestParam(value="title",required = false) String title, Model model) {
        //查询所有的新闻分类信息
        List<NewsCategory> categoryList = newsService.queryAllCategory();
        //按条件查询新闻信息
        List<NewsDetail> detailList = newsService.queryAllNews(Integer.valueOf(categoryId),title);
        model.addAttribute("categoryList", categoryList);
        model.addAttribute("detailList", detailList);
        model.addAttribute("categoryId",categoryId);
        return "list";
    }

}