package com.atomscat.modules.dataManagement.serviceimpl;

import cn.hutool.core.util.StrUtil;
import com.atomscat.base.AtomscatBaseDao;
import com.atomscat.modules.dataManagement.dao.KpiDao;
import com.atomscat.modules.dataManagement.entity.Kpi;
import com.atomscat.modules.dataManagement.service.KpiService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.criteria.*;
import java.util.ArrayList;
import java.util.List;

@Slf4j
@Service
@Transactional
@CacheConfig(cacheNames = "kpidata")
public class KpiServiceImpl implements KpiService {

    @Autowired
    private KpiDao kpiDao;

    @Override
    public AtomscatBaseDao<Kpi, String> getRepository() {
        return kpiDao;
    }

    @Override
    public boolean isHave(Kpi kpi) {
       long count = kpiDao.count(new Specification<Kpi>() {
            @Override
            public Predicate toPredicate(Root<Kpi> root, CriteriaQuery<?> cq, CriteriaBuilder cb) {
                Path<String> title = root.get("title");
                List<Predicate> list = new ArrayList<Predicate>();
                //模糊搜素
                if(StrUtil.isNotBlank(kpi.getTitle())){
                    list.add(cb.equal(title, kpi.getTitle()));
                }
                Predicate[] arr = new Predicate[list.size()];
                cq.where(list.toArray(arr));
                return null;
            }
        });
        if (count > 0) {
            return true;
        } else {
            return false;
        }
    }

    @Override
    @Cacheable(key = "'kpilist'")
    public List<Kpi> getAllList() {
        return kpiDao.findAll();
    }
}
