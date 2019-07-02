consul {
    address = "127.0.0.1:8500"
}

template {
    source = "/var/www/docker/docker-compose/consul-cluster/services/consul-template/tpl/user.service.jirry.com.ctmpl"
    destination = "/var/www/docker/docker-compose/environment-develop/services/openresty/etc/conf.d/user.service.jirry.com.php"
}

template {
    source = "/var/www/docker/docker-compose/consul-cluster/services/consul-template/tpl/user.service.jirry.com.ctmpl"
    destination = "/var/www/docker/docker-compose/environment-develop/services/openresty/etc/conf.d/user-1.service.jirry.com.php"
}
