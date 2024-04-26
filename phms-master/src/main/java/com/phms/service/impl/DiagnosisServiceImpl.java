package com.phms.service.impl;

import com.phms.mapper.DiagnosisMapper;
import com.phms.model.MMGridPageVoBean;
import com.phms.pojo.Diagnosis;
import com.phms.pojo.Pet;
import com.phms.pojo.User;
import com.phms.service.DiagnosisService;
import com.phms.service.PetService;
import com.phms.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

@Service
public class DiagnosisServiceImpl implements DiagnosisService {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());
    @Resource
    DiagnosisMapper diagnosisMapper;
    @Resource
    UserService userService;
    @Resource
    PetService petService;


    @Override
    public Object getAllByLimit(Diagnosis diagnosis) {
        int size = 0;
        // 计算分页
        Integer begin = (diagnosis.getPage() - 1) * diagnosis.getLimit();
        diagnosis.setPage(begin);

        List<Diagnosis> rows = new ArrayList<>();
        List<Diagnosis> resule = new ArrayList<>();//存储最后要在宠物健康史界面展示的就诊记录
        try {
            rows = diagnosisMapper.getAllByLimit(diagnosis);//此用户的宠物预约就诊的内容
            size = diagnosisMapper.countAllByLimit(diagnosis);//此用户的宠物预约就诊数量
            for (Diagnosis d: rows){
                if (d.getPetId()!=null){//根据宠物id在pet表中获取宠物名称
                    Pet my = petService.selectByPrimaryKey(d.getPetId());
                    if (my !=null){
                        d.setName(my.getName());
                    }

                }
                if (d.getUserId()!=null){//根据宠物id在user表中获取用户名称
                    User my = userService.selectByPrimaryKey(d.getUserId());
                    if (my != null) {
                        d.setUserName(my.getName());
                    }
                }

                if (d.getDoctorId()!=null){//根据宠物id在user表中获取医生名称
                    User dt = userService.selectByPrimaryKey(d.getDoctorId());
                    if (dt != null) {
                        d.setDoctorName(dt.getName());
                    }
                }
                resule.add(d);
            }
            if (diagnosis.getName()!=null && ""!=diagnosis.getName()){
                Iterator<Diagnosis> iterator = resule.iterator();//迭代器，可以遍历集合的对象
                while (iterator.hasNext()){//如果仍有元素可以迭代，则返回true
                    Diagnosis p = iterator.next();//返回迭代的下一个元素
                    if (!p.getName().contains(diagnosis.getName())){
                        iterator.remove();
                    }
                }
                size = rows.size();
            }
        } catch (Exception e) {
            logger.error("根据条件查询异常", e);
        }
        MMGridPageVoBean<Diagnosis> vo = new MMGridPageVoBean<>();
        vo.setTotal(size);
        vo.setRows(resule);

        return vo;
    }

    @Override
    public void deleteById(Long id) {
        diagnosisMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void add(Diagnosis diagnosis) {
        diagnosisMapper.insert(diagnosis);
    }

    @Override
    public void update(Diagnosis diagnosis) {
        diagnosisMapper.updateByPrimaryKeySelective(diagnosis);
    }
}
