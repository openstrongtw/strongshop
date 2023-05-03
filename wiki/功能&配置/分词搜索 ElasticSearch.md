
# Elastic
- 安裝 ElasticSearch
1. Linux (CentOS7)
```
yum install docker
docker pull elasticsearch:6.8.8
docker run -d --name elasticsearch -p 9200:9200 -p 9300:9300 -e "discovery.type=single-node" elasticsearch:6.8.8
```
安裝並啟動成功后訪問：http://IP:9200 
輸出：
```
{
  "name" : "JP6sXAT",
  "cluster_name" : "docker-cluster",
  "cluster_uuid" : "Tyhv_tPaQwiee4ega698NQ",
  "version" : {
    "number" : "6.8.8",
    "build_flavor" : "default",
    "build_type" : "docker",
    "build_hash" : "2f4c224",
    "build_date" : "2020-03-18T23:22:18.622755Z",
    "build_snapshot" : false,
    "lucene_version" : "7.7.2",
    "minimum_wire_compatibility_version" : "5.6.0",
    "minimum_index_compatibility_version" : "5.0.0"
  },
  "tagline" : "You Know, for Search"
}
```

2. Windows
請自行百度

- 修改配置
在 .env 檔案新增：
```
ELASTICSEARCH_HOST=http://IP:9200
```


- 修改模型 model
修改 app\Models\Product\Product.php
```
//use \Laravel\Scout\Searchable;
```
為：
```
use \Laravel\Scout\Searchable;
```

- 修改檢視檔案
修改 resources\views\themes\default\layouts\app.blade.php
```
<form id="ST-SEARCH" method="get" action="{{route('product.list')}}">
```
為：
```
<form id="ST-SEARCH" method="get" action="{{route('product.search')}}">
```
