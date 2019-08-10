package com.atomscat.modules.dataManagement.entity;


import com.baomidou.mybatisplus.annotation.TableName;
import com.atomscat.base.AtomscatBaseEntity;
import io.swagger.annotations.ApiModel;
import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Table;

@Data
@Entity
@Table(name = "t_kpi_account")
@TableName("t_kpi_account")
@ApiModel(value = "客户KPI中间表")
public class KpiAccount extends AtomscatBaseEntity {

  private String kpiId;
  private String accountId;
  private String title;
}
