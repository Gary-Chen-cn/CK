package com.code.admin;

import com.baomidou.mybatisplus.plugins.Page;
import com.code.mapper.UserinfoMapper;
import com.code.entity.Userinfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * 后台userinfo表的管理操作
 */
@Controller
@RequestMapping("/userinfo")
public class UserinfoController {

    @Autowired   //注入对象
    private UserinfoMapper userinfoMapper;

    @RequestMapping("/add")
    public String toAdd(Model model) {
        return "userinfo/userinfoAdd";
    }

    @RequestMapping("/insert") //插入数据
    public String save(Userinfo userinfo) {
        userinfoMapper.insert(userinfo);
        return "redirect:list";
    }

    @RequestMapping("/update") //修改数据
    public String update(Userinfo userinfo) {
        userinfoMapper.updateById(userinfo);
        return "redirect:list";
    }

    @RequestMapping("/delete") //删除数据
    public String save(int id) {
        userinfoMapper.deleteById(id);
        return "redirect:list";
    }

    @RequestMapping("/edit") //编辑数据
    public String edit(int id, Model model) {
        Userinfo userinfo = userinfoMapper.selectById(id);
        model.addAttribute("userinfo", userinfo);
        return "userinfo/userinfoUpdate";
    }

    @RequestMapping("/detail") //编辑数据
    public String detail(int id, Model model) {
        Userinfo userinfo = userinfoMapper.selectById(id);
        model.addAttribute("userinfo", userinfo);
        return "userinfo/userinfoDetail";
    }

    /**
     * @param keyword  搜索关键词
     * @param p        页面            默认第1页
     * @param pageSize 每页显示条数 默认每页10条
     * @param model
     * @return
     */
    @RequestMapping("/list") //分页查询数据
    public String list(String keyword, Integer p, Integer pageSize, Model model) {

        p = null == p ? 1 : p; //默认显示第一页
        pageSize = null == pageSize ? 10 : pageSize; //默认每页显示10条
        Page<Userinfo> sortPage = new Page<Userinfo>(p, pageSize);//参数一是当前页，参数二是每页个数
        List<Userinfo> userinfoList = userinfoMapper.selectPage(sortPage, null);
        long total = sortPage.getTotal(); //总页数
        int current = sortPage.getCurrent();
        long pages = sortPage.getPages();
        model.addAttribute("userinfoList", userinfoList);   //绑定接受参数
        model.addAttribute("cp", current);   //当前页
        model.addAttribute("tp", pages);   //总页数
        model.addAttribute("total", total);   //总条数
        model.addAttribute("pageListURL", "userinfo/list");   //总条数
        return "userinfo/userinfoList";
    }
}
