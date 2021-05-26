package com.code.admin;

import com.code.entity.*;
import com.code.mapper.*;
import com.code.util.AliyunFont;
import com.code.util.CommonUtils;
import com.code.util.GlobalResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.*;

@Controller
public class IndexController {

    @Autowired   //注入对象
    private CommonMapper commonMapper;


    @Autowired   //注入对象
    private NoticeinfoMapper noticeinfoMapper;
    @Autowired   //注入对象
    private UserinfoMapper userinfoMapper;
    @Autowired   //注入对象
    private MsginfoMapper msginfoMapper;

    @RequestMapping("/index")
    public String index(String keyword, Model model, HttpSession session) {
        return "index";
    }

    @RequestMapping("/myList")
    public String myList(String keyword, Model model, HttpSession session) {
        List<Msginfo> msginfoList = msginfoMapper.selectByMap(null);
        model.addAttribute("msginfoList", msginfoList);
        return "myList";
    }

    @ResponseBody
    @RequestMapping("/getFont")
    public GlobalResult getFont(String imgPath, Model model, HttpServletRequest request) {
        imgPath = imgPath.split("/")[3];
        imgPath = request.getSession().getServletContext().getRealPath("/uploads/") + imgPath;
        System.out.println("imgPath = " + imgPath);
        String result = AliyunFont.getImgFont(imgPath);
        System.out.println("result = " + result);
        return GlobalResult.ok(result);
    }

    @RequestMapping("/msginfo_delete") //删除数据
    public String msginfo_delete(int id) {
        msginfoMapper.deleteById(id);
        return "redirect:myList";
    }

    @ResponseBody
    @RequestMapping("/msginfo_submit")
    public GlobalResult msginfo_submit(Msginfo msginfo, Model model) {
        msginfoMapper.insert(msginfo);
        return GlobalResult.ok();
    }

    @RequestMapping("/userinfoCenter")
    public String userinfoCenter(HttpSession session, Model model) {
        Userinfo userinfo = (Userinfo) session.getAttribute("loginUserinfo");
        model.addAttribute("userinfo", userinfo);
        return "userinfoCenter";
    }

    @RequestMapping("/loginOut")
    public String loginOut(HttpSession session, Model model) {
        session.invalidate();
        return "redirect:index";
    }

    @RequestMapping("/infoList")
    public String infoList(Model model) {
        List<Noticeinfo> noticeinfoList = noticeinfoMapper.selectByMap(null);
        model.addAttribute("noticeinfoList", noticeinfoList);
        return "infoList";
    }


    @ResponseBody
    @RequestMapping("/registerSubmit")
    public GlobalResult infoList(Userinfo userinfo) {
        Integer insert = userinfoMapper.insert(userinfo);
        return GlobalResult.ok("회원가이 성공");
    }

    @ResponseBody
    @RequestMapping("/loginSubmit") //插入数据
    public GlobalResult login(String username, String password, String vercode, HttpSession session, Model model) {
        String randCode = session.getAttribute("randCode").toString();
        if (!randCode.equals(vercode)) {
            return GlobalResult.errorMsg("인증번호가 잘못되었습니다");
        }
        List<Userinfo> userinfoList = userinfoMapper.selectByMap(null);
        Userinfo admin = new Userinfo();
        boolean is = false;
        for (Userinfo admininfo : userinfoList) {
            if (admininfo.getName().equals(username) && admininfo.getPassword().equals(password)) {
                admin = admininfo;
                is = true;
                break;
            }
        }
        if (is) {
            session.setAttribute("loginUserinfo", admin);
            return GlobalResult.ok("회원가이 성공");
        } else {
            model.addAttribute("msg", "아이디 또는 비밀번호가 틀렸습니다");
            return GlobalResult.errorMsg("아이디 또는 비밀번호가 틀렸습니다");
        }
    }


}
