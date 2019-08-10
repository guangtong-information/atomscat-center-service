package com.atomscat.modules.dataManagement.entity;


import com.baomidou.mybatisplus.annotation.TableName;
import com.atomscat.base.AtomscatBaseEntity;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import java.math.BigDecimal;

@Data
@Entity
@Table(name = "t_kpi")
@TableName("t_kpi")
@ApiModel(value = "KPI指标库")
public class Kpi extends AtomscatBaseEntity {

  @ApiModelProperty(value = "备注")
  private String description;

  @ApiModelProperty(value = "指标名称")
  private String title;

  @ApiModelProperty(value = "指标类型")
  private String type;

  @ApiModelProperty(value = "排序值")
  @Column(precision = 10, scale = 2)
  private BigDecimal sortOrder;
}
