clean: 
	@docker-compose stop && docker-compose rm -f

start-kafka:
	@docker-compose up -d zookeeper kafka control-center kafka-connect

start-es:
	@sudo sysctl -w vm.max_map_count=262144
	@docker-compose up -d elasticsearch kibana

start-postgres:
	@docker-compose up -d postgres

start-sqlserver:
	@docker-compose up -d sqlserver sqlserver-migration

start-all:clean start-kafka start-es start-postgres start-sqlserver watch

watch:
	@watch -n1 docker-compose ps

stop:
	@docker-compose stop

# export SERVICE=elasticsearch; docker-compose stop $SERVICE && docker-compose rm -f $SERVICE && docker-compose up -d $SERVICE; watch -n1 docker-compose ps;
	
