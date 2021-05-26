package com.code.entity;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;

import java.lang.Integer;

/**
 * ClassName:Msginfo
 * Description: 翻译信息实体类
 */
@TableName("Msginfo")
public class Msginfo {

    /**
     * 翻译编号
     */
    @TableId(type = IdType.AUTO) //主键自增
    private Integer msgid;
    /**
     * 翻译用户
     */
    private String msguser;
    /**
     * 翻译内容
     */
    private String msgcontent;
    /**
     * 翻译时间
     */
    private String msgaddtime;
    /**
     * 翻译内容
     */
    private String tid;


    public Integer getMsgid() {
        return msgid;
    }

    public void setMsgid(Integer msgid) {
        this.msgid = msgid;
    }

    public String getMsguser() {
        return msguser;
    }

    public void setMsguser(String msguser) {
        this.msguser = msguser;
    }

    public String getMsgcontent() {
        return msgcontent;
    }

    public void setMsgcontent(String msgcontent) {
        this.msgcontent = msgcontent;
    }

    public String getMsgaddtime() {
        return msgaddtime;
    }

    public void setMsgaddtime(String msgaddtime) {
        this.msgaddtime = msgaddtime;
    }

    public String getTid() {
        return tid;
    }

    public void setTid(String tid) {
        this.tid = tid;
    }
}