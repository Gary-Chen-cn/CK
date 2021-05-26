package com.code.admin;

import com.baomidou.mybatisplus.plugins.Page;
import com.code.entity.Admininfo;
import com.code.mapper.AdmininfoMapper;
import com.code.util.CommonUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/admininfo")
public class AdmininfoController {
    @Autowired   //注入对象
    private AdmininfoMapper admininfoMapper;


    @RequestMapping("/login") //插入数据
    public String login(String username, String password, String type, HttpSession session, Model model) {

        List<Admininfo> admininfoList = admininfoMapper.selectByMap(null);
        Admininfo admin = new Admininfo();
        boolean is = false;
        for (Admininfo admininfo : admininfoList) {
            if (admininfo.getAdminname().equals(username) && admininfo.getAdminpwd().equals(password)) {
                admin = admininfo;
                is = true;
                break;
            }
        }
        if (is) {
            if (!admin.getIslock().equals("사용 가능")) {
                model.addAttribute("msg", "사용자가 비활성화되었습니다");
                return "admin/login";
            }
            session.setAttribute("loginUser", admin);
            session.setAttribute("loginType", "관리자");
            return "redirect:tomain";
        } else {
            model.addAttribute("msg", "아이디 또는 비밀번호가 틀렸습니다");
            return "admin/login";
        }
    }


    @RequestMapping("/tologin")
    public String tologin(HttpSession session) {
        return "admin/login";
    }

    @RequestMapping("/tomain")
    public String tomain(HttpSession session) {
        return "admin/main";
    }


    @RequestMapping("/loginOut")
    public String loginOut(HttpSession session) {
        session.invalidate();
        return "admin/login";
    }

    @RequestMapping("/register")
    public String register(Admininfo admininfo, Model model) {
        admininfo.setAdmincreatetime(CommonUtils.getNowDateStr());
        admininfoMapper.insert(admininfo);
        model.addAttribute("msg", "회원가이 성공,로그인하세요");
        return "admin/login";
    }

    @RequestMapping("/add")
    public String toAdd() {
        return "admininfo/admininfoAdd";
    }

    @RequestMapping("/insert") //插入数据
    public String save(Admininfo admininfo) {
        admininfoMapper.insert(admininfo);
        return "redirect:list";
    }


    @RequestMapping("/update") //修改数据
    public String update(Admininfo admininfo) {
        admininfoMapper.updateById(admininfo);
        return "redirect:list";
    }

    @RequestMapping("/delete") //删除数据
    public String save(int id) {
        admininfoMapper.deleteById(id);
        return "redirect:list";
    }

    @RequestMapping("/edit") //编辑数据
    public String edit(int id, Model model) {
        Admininfo admininfo = admininfoMapper.selectById(id);
        model.addAttribute("admininfo", admininfo);
        return "admininfo/admininfoUpdate";
    }

    @RequestMapping("/detail") //编辑数据
    public String detail(int id, Model model) {
        Admininfo admininfo = admininfoMapper.selectById(id);
        model.addAttribute("admininfo", admininfo);
        return "admininfo/admininfoDetail";
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
        Page<Admininfo> sortPage = new Page<Admininfo>(p, pageSize);//参数一是当前页，参数二是每页个数
        List<Admininfo> admininfoList = admininfoMapper.selectPage(sortPage, null);
        long total = sortPage.getTotal(); //总页数
        int current = sortPage.getCurrent();
        long pages = sortPage.getPages();
        model.addAttribute("admininfoList", admininfoList);   //绑定接受参数
        model.addAttribute("cp", current);   //当前页
        model.addAttribute("tp", pages);   //总页数
        model.addAttribute("total", total);   //总条数
        model.addAttribute("pageListURL", "admininfo/list");   //总条数
        return "admininfo/admininfoList";
    }

}
