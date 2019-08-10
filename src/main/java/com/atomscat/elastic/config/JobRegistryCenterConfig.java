package com.atomscat.elastic.config;

import com.dangdang.ddframe.job.reg.zookeeper.ZookeeperConfiguration;
import com.dangdang.ddframe.job.reg.zookeeper.ZookeeperRegistryCenter;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.condition.ConditionalOnExpression;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
@ConditionalOnExpression("'${atomscat.elasticJob.serverList}'.length() > 0")
public class JobRegistryCenterConfig {

    @Bean(initMethod = "init")
    public ZookeeperRegistryCenter regCenter(@Value("${atomscat.elasticJob.serverList}") final String serverList,
                                             @Value("${atomscat.elasticJob.namespace}") final String namespace) {
        return new ZookeeperRegistryCenter(new ZookeeperConfiguration(serverList, namespace));
    }

}