package com.atomscat.modules.dataManagement.serviceimpl;

import cn.hutool.core.util.StrUtil;
import com.atomscat.base.AtomscatBaseDao;
import com.atomscat.modules.dataManagement.dao.KpiAccountDao;
import com.atomscat.modules.dataManagement.entity.KpiAccount;
import com.atomscat.modules.dataManagement.service.KpiAccountService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.criteria.*;
import java.util.ArrayList;
import java.util.List;

@Slf4j
@Service
@Transactional
@CacheConfig(cacheNames = "kpidata")
public class KpiAccountServiceImpl implements KpiAccountService {

    @Autowired
    private KpiAccountDao kpiAccountDao;

    @Autowired
    private StringRedisTemplate redisTemplate;

    @Override
    public AtomscatBaseDao<KpiAccount, String> getRepository() {
        return this.kpiAccountDao;
    }

    public List<KpiAccount> delByIds(String id) {
        List<KpiAccount> list = kpiAccountDao.findAll(new Specification<KpiAccount>() {
            @Override
            public Predicate toPredicate(Root<KpiAccount> root, CriteriaQuery<?> cq, CriteriaBuilder cb) {
                List<Predicate> list = new ArrayList<Predicate>();
                Path<String> accountId = root.get("accountId");
                //所属字典
                if(StrUtil.isNotBlank(id)){
                    list.add(cb.equal(accountId, id));
                }
                Predicate[] arr = new Predicate[list.size()];
                cq.where(list.toArray(arr));
                return null;
            }
        });
        kpiAccountDao.deleteInBatch(list);
        //清空缓存
        redisTemplate.delete("kpidata::"+id);
        return list;
    }

    @Cacheable(key = "#accountId")
    public List<KpiAccount> findKpiAccount(String accountId) {
        List<KpiAccount> list = kpiAccountDao.findAll(new Specification<KpiAccount>() {
            @Override
            public Predicate toPredicate(Root<KpiAccount> root, CriteriaQuery<?> cq, CriteriaBuilder cb) {
                Path<String> accountId_ = root.get("accountId");
                //所属字典
                if(StrUtil.isNotBlank(accountId)){
                    Predicate predicate = cb.equal(accountId_, accountId);
                    cq.where(predicate);
                }
                return null;
            }
        });
        return list;
    }
}
