package com.atomscat.modules.dataManagement.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.atomscat.base.AtomscatBaseEntity;
import io.swagger.annotations.ApiModel;
import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Table;

@Data
@Entity
@Table(name = "t_account_channel_mapping")
@TableName("t_account_channel_mapping")
@ApiModel(value = "账户渠道号映射")
public class AccountChannelMapping extends AtomscatBaseEntity {
  private String tDeliveryPlatformAuthorizationId;
  private String customerShortName;
  private String customerName;
  private String deliveryPlatform;
  private String accountId;
  private String accountName;
  private String channelCustomer;
  private String channelDelivery;
  private String channelNumberDescription;
  private String advertiserId;
  private String pid;
  private String kpiIds;
}
