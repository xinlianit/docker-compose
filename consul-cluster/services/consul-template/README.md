# 使用
consul-template \
-config=/var/www/docker/docker-compose/consul-cluster/services/consul-template/etc/consul-template.hcl \
2>&1 > /tmp/consul-template.log