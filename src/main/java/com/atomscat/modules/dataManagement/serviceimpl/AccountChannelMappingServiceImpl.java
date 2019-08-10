package com.atomscat.modules.dataManagement.serviceimpl;

import cn.hutool.core.util.StrUtil;
import com.atomscat.common.utils.PageUtil;
import com.atomscat.common.vo.PageVo;
import com.atomscat.modules.dataManagement.dao.AccountChannelMappingDao;
import com.atomscat.modules.dataManagement.entity.AccountChannelMapping;
import com.atomscat.modules.dataManagement.service.AccountChannelMappingService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.criteria.*;
import java.util.ArrayList;
import java.util.List;


@Slf4j
@Service
@Transactional
public class AccountChannelMappingServiceImpl implements AccountChannelMappingService {

    @Autowired
    AccountChannelMappingDao accountChannelMappingDao;

    @Override
    public AccountChannelMappingDao getRepository() {
        return accountChannelMappingDao;
    }

    public Page<AccountChannelMapping> findAllByPage(AccountChannelMapping accountChannelMapping, PageVo pageVo) {
        return accountChannelMappingDao.findAll(new Specification<AccountChannelMapping>() {
            @Override
            public Predicate toPredicate(Root<AccountChannelMapping> root, CriteriaQuery<?> cq, CriteriaBuilder cb) {
                List<Predicate> list = new ArrayList<Predicate>();
                Path<String> pid = root.get("pid");
                Path<Integer> delFlag = root.get("delFlag");
                Path<String> customerShortName = root.get("customerShortName");


                if(StrUtil.isNotBlank(accountChannelMapping.getPid())){
                    list.add(cb.equal(pid,accountChannelMapping.getPid()));
                }
                //模糊搜素
                if(StrUtil.isNotBlank(accountChannelMapping.getCustomerShortName())){
                    list.add(cb.like(customerShortName, '%'+accountChannelMapping.getCustomerShortName()+"%"));
                }

                list.add(cb.equal(delFlag,0));
                Predicate[] arr = new Predicate[list.size()];
                cq.where(list.toArray(arr));
                return null;
            }
        }, PageUtil.initPage(pageVo));
    }

    @Override
    public List<AccountChannelMapping> getAll(AccountChannelMapping accountChannelMapping) {
        List<AccountChannelMapping> list = accountChannelMappingDao.findAll(new Specification<AccountChannelMapping>() {
            @Override
            public Predicate toPredicate(Root<AccountChannelMapping> root, CriteriaQuery<?> cq, CriteriaBuilder cb) {
                List<Predicate> list = new ArrayList<Predicate>();
                Path<String> pid = root.get("pid");
                Path<Integer> delFlag = root.get("delFlag");

                if(StrUtil.isNotBlank(accountChannelMapping.getPid())){
                    list.add(cb.equal(pid,accountChannelMapping.getPid()));
                }
                list.add(cb.equal(delFlag,0));
                Predicate[] arr = new Predicate[list.size()];
                cq.where(list.toArray(arr));
                return null;
            }
        });
        return list;
    }

    @Override
    public AccountChannelMapping update(AccountChannelMapping entity) {
        return accountChannelMappingDao.save(entity);
    }
}
