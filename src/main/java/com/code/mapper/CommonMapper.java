package com.code.mapper;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.code.entity.Admininfo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

@Component
public interface CommonMapper extends BaseMapper<Admininfo> {

    public List<Map> selectAction(@Param("sql") String sql);

    public int updateAction(@Param("sql") String sql);



}
