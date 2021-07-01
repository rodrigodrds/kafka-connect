# Kafka + Kafka Connect
 Estudo do Kafka como replicador de eventos de banco de dados postgres e sql server para ElasticSearch.

## Sumário:
 - [Iniciando Containers](#Iniciando-Containers)
    - [Outros métodos de inicialização](#Outros-métodos-de-inicialização)
    - [Verificando Status dos containers](#Verificando-Status-dos-containers)
 - [Visualizando](#Visualizando)
 - [Query ElasticSearch](#Query-ElasticSearch)
 - [Possiveis Erros](#Possiveis-Erros)

## Iniciando Containers
 Para iniciar todos container rodar `make start-all`

### Outros métodos de inicialização
 - Para iniciar apenas o Kafka rodar `make start-kafka`
 - Para iniciar apenas o ElasticSearch rodar `make start-es`
 - Para iniciar apenas o Postgres rodar `make start-postgres`
 - Para iniciar apenas o SqlServer rodar `make start-sqlserver`

### Verificando Status dos containers
 - Rodar comando `make watch`.


## Visualizando
 - Control Center (UI Kafka): http://localhost:9021/
 - Kibana UI (dados do ElasticSearch): http://localhost:5601/
    - como nada vai estar configurado para ver a indexação melhor acessar http://localhost:5601/app/management/data/index_management/indices (Kibana > Stack Management > Index Management)
    - Precisamos criar um padrão de indexes no Kibana, indo em http://localhost:5601/app/management/kibana/indexPatterns
    - Após criar os indixes como visualizar: http://localhost:5601/app/discover#
    - exemplo de visualizacao [link](http://localhost:5601/app/discover?#/?_g=(filters:!(),refreshInterval:(pause:!t,value:0),time:(from:now-15m,to:now))&_a=(columns:!(payload.after.id,payload.after.email,payload.after.first_name,payload.after.gender,payload.after.create_ts),filters:!(),index:'0ddc39d0-d454-11eb-a2cb-85a6b5a81faf',interval:auto,query:(language:kuery,query:''),sort:!(!(_score,desc),!(payload.after.create_ts,desc))))

### Verificando outros status
 - Status do ES - http://localhost:9200/_cat/health?h=status
 - Status do Cluster ES - http://localhost:9200/_cluster/health?pretty
 - Confluent Hub (mantenedora do Kafka, Hub de connectors) - https://www.confluent.io/hub/


## Possiveis Erros
 - Se o ES não estiver subindo, verificar erro do docker com `docker ps -a` sendo erro Exit 78, no linux tentar rodar no terminal `sudo sysctl -w vm.max_map_count=262144`, são limitações de vm.
 - Se o ES estiver caindo depois



## Query ElasticSearch
 - index: `transaction*`

```json
GET transaction_2021-05*/_search
{
  "query": {
    "match_all": {}
  },
  "size": 0, 
  "aggs": { 
    "byday": {
      "date_histogram": {
        "field": "timestamp",
        "calendar_interval": "day"
      },
      "aggs": {
        "price_stats": {
          "stats": {
            "field": "price"
          }
        }
      }
    }
  }
}
```

resultado
```json
{
  "took" : 6,
  "timed_out" : false,
  "_shards" : {
    "total" : 27,
    "successful" : 27,
    "skipped" : 0,
    "failed" : 0
  },
  "hits" : {
    "total" : {
      "value" : 1566,
      "relation" : "eq"
    },
    "max_score" : null,
    "hits" : [ ]
  },
  "aggregations" : {
    "byday" : {
      "buckets" : [
        {
          "key_as_string" : "2021-05-01T00:00:00.000Z",
          "key" : 1619827200000,
          "doc_count" : 58,
          "price_stats" : {
            "count" : 58,
            "min" : 10685.0,
            "max" : 49790.0,
            "avg" : 29397.793103448275,
            "sum" : 1705072.0
          }
        },
        {
          "key_as_string" : "2021-05-02T00:00:00.000Z",
          "key" : 1619913600000,
          "doc_count" : 58,
          "price_stats" : {
            "count" : 58,
            "min" : 10887.0,
            "max" : 49884.0,
            "avg" : 32552.5,
            "sum" : 1888045.0
          }
        },
        ...
        {
          "key_as_string" : "2021-05-26T00:00:00.000Z",
          "key" : 1621987200000,
          "doc_count" : 58,
          "price_stats" : {
            "count" : 58,
            "min" : 10727.0,
            "max" : 49777.0,
            "avg" : 32665.224137931036,
            "sum" : 1894583.0
          }
        },
        {
          "key_as_string" : "2021-05-27T00:00:00.000Z",
          "key" : 1622073600000,
          "doc_count" : 58,
          "price_stats" : {
            "count" : 58,
            "min" : 11118.0,
            "max" : 49736.0,
            "avg" : 30262.706896551725,
            "sum" : 1755237.0
          }
        }
      ]
    }
  }
}
```
