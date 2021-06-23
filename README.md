# Kafka + Kafka Connect
 Estudo do Kafka como replicador de eventos de banco de dados postgres e sql server para ElasticSearch.

## Verificando Status dos containers
 - Rodar comando `docker-compose ps`, na pasta do repo.


## Visualizando
 - Control Center (UI Kafka): http://localhost:9021/
 - Kibana UI (dados do ElasticSearch): http://localhost:5601/
    - como nada vai estar configurado para ver a indexação melhor acessar http://localhost:5601/app/management/data/index_management/indices (Kibana > Stack Management > Index Management)
    - Precisamos criar um padrão de indexes no Kibana, indo em http://localhost:5601/app/management/kibana/indexPatterns
    - Após criar os indixes como visualizar: http://localhost:5601/app/discover#
    - exemplo de visualizacao [link](http://localhost:5601/app/discover?#/?_g=(filters:!(),refreshInterval:(pause:!t,value:0),time:(from:now-15m,to:now))&_a=(columns:!(payload.after.id,payload.after.email,payload.after.first_name,payload.after.gender,payload.after.create_ts),filters:!(),index:'0ddc39d0-d454-11eb-a2cb-85a6b5a81faf',interval:auto,query:(language:kuery,query:''),sort:!(!(_score,desc),!(payload.after.create_ts,desc))))

## Outros
 - Status do ES - http://localhost:9200/_cat/health?h=status
 - Status do Cluster ES - http://localhost:9200/_cluster/health?pretty


## Possiveis Erros
 - Se o ES não estiver subindo, verificar erro do docker com `docker ps -a`. Se erro Exit 78, no linux tentar rodar no terminal `sudo sysctl -w vm.max_map_count=262144`, são limitações de vm
