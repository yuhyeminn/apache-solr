# Apache Solr

> - Apache Solr
>
> - Apache Solr 특징
>
> - Apache Solr  vs  ElasticSearch

<br>

### 📕 Apache Solr

Solr는 Apache Lucene 프로젝트에서 파생되었으며, 자바 언어로 작성된 오픈소스 엔터프라이즈 검색 플랫폼이다.기본적인 텍스트 검색, 다면적 검색, 실시간 인덱싱, 클러스터링, 데이터베이스 통합, 다양한 문서처리 및 검색, 솔라 분산 인덱싱 등 다양한 기능을 지원한다.

<br>

### 📕 Apache Solr 특징

- 루씬(Lucene) 기반
  - 루씬 검색 라이브러리 기반의 파일을 인덱스하는 검색엔진
- 색인 / 검색
  - HTTP 프로토콜 상에서 XML을 통해서 색인하며, 검색은 HTTP GET으로 쿼리를 보내어 XML의 형태로 값을 얻음
- 분산 처리
  - Solr는 인덱스 복제(Index Replication)라는 기술을 활용함. 
    - 마스터 인덱스의 전체 복사본을 하나 이상의 슬레이브 서버로 배포 및 업데이트 함
    - 복제 및 분산처리를 통해 Solr는 대규모 검색 볼륨에 대한 쿼리에 적절한 대응력을 제공할 수 있음
- 접근성
  - Solr 검색 서버 URL을 사용하기에 인터넷을 통해 파일을 질의, 인덱스하는 어느 곳에서나 접근 가능

<br>

### 📕 Apache Solr  vs  ElasticSearch

*Solr* : 사이즈가 큰 데이터 검색에 용이해 문서 검색에 적합하나, 색인 주기가 느림 (문서 검색용)

*ElasticSearch* : 사이즈가 작은 데이터에 대한 속성검색/연관검색/실시간 검색에 용이함 (커머스 검색용)

|                     | Apache Solr                                                  | ElasticSearch                                                |
| :-----------------: | ------------------------------------------------------------ | ------------------------------------------------------------ |
|       개발사        | Apache Software Foundation                                   | ElasticSearch                                                |
|  노드 컨트롤 주체   | Apache ZooKeeper (별도 프로그램)<br />**→ 구동 시 리소스 부하** **/** **운영 중 스키마 변경 불가** | 자체 Node (마스터 노드)<br />**→ 구동 시 부하 적음** **/** **운영 중 스키마 변경 가능** |
|   샤드 변경 방식    | 별도의 노드 분할 처리 필요 (서버 재구동)                     | 자동 노드 분할 (서버 구동 불필요)                            |
| 색인 업데이트 방식  | 전체 데이터를 캐시로 추가 저장                               | 변경 데이터만 캐시로 추가 저장                               |
|   주요 활요 영역    | 문서 원문 검색                                               | 상품 검색 / 이상 징후 감지 & 모니터링                        |
| 검색/색인/분석 속도 | **느림** / 수 십분 / 준실시간                                | **빠름** / 초 단위 / 실시간                                  |
|        장점         | 안정화 단계의 검색 , 장문 데이터 검색에 용이                 | 실시간 색인 가능, 계층 구조의 다양한 속성 검색/연관검색 가능 |
|        단점         | 색인 주기 느림, 계층 구조의 속성 검색이 어려움               | 크기가 큰 장문 데이터 검색 시 속도 저하                      |

- 노드(Node)
  - 분산 처리 구조 상 서버와 유사한 개념의 구분 단위
- 샤드(Shard)
  - 분산 처리 구조 상 인덱스 단위로서 단일 노드엔 여러 개의 샤드가 존재함

<br>

### 📕  [Apache Solr 설치 및 SolrJ 실습](https://github.com/yuhyeminn/solr/blob/master/study-note.md) 

<br>

<br>

<br>

<br>

<br>

<br>

<br>

> 참고
>
> https://woongsin94.tistory.com/344
>
> https://en.wikipedia.org/wiki/Apache_Solr
>
> https://solr.apache.org/guide/8_8/getting-started.html
>
> http://hochul.net/blog/%EC%98%A4%ED%94%88%EC%86%8C%EC%8A%A4-%EA%B2%80%EC%83%89%EC%97%94%EC%A7%84-%EB%B9%84%EA%B5%90-solr-vs-elasticsearch/