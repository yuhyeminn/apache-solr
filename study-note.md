> [Solr 빠른 완성](https://jetalog.net/51?category=650060) 참고
>
> - *$SOLR_HOME* : Solr 설치 경로
>
> - *Solr Admin* : http://localhost:8983/solr



### 1. Solr 설치

1. Solr 다운로드

```
- 다운로드 사이트
http://lucene.apache.org/solr/mirrors-solr-latest-redir.html
- 다운로드 링크
https://downloads.apache.org/lucene/solr/8.8.1/solr-8.8.1.zip
```

2. 압축 해제 후 cmd로 해당 폴더로 이동

```
cd 압축 해제 경로
cd C:\dev\solr-8.8.1
```

3. Solr 실행

```
bin\start
```

4. 정상적으로 실행됐는지 확인

``` 
http://localhost:8983/solr -> 이하 Solr Admin
```

5. 색인된 문서를 담는 Collection 생성 

``` 
bin\solr create -c 컬렉션이름 -d server\solr\configsets\_default
```

6. Solr Admin에서 Core Selector 목록을 확인하여 해당 컬렉션이 생성되었는지 확인



### 2. Schema 생성

#### managed-schema 설정

1. *$SOLR_HOME*\server\solr\board\conf 에 있는 **managed-schema** 파일 열기

2. 124행에 아래 코드를 삽입한 후 저장

​		** 색인에 필요한 **Field** 설정하는 코드 [[Apache Solr Reference Guide - Defining Fields]](https://solr.apache.org/guide/8_8/defining-fields.html)

```
<field name="title" type="text_general" indexed="true" stored="true" multiValued="false" />
<field name="writer" type="string" indexed="true" stored="true" multiValued="false" />
<field name="board" type="text_general" indexed="true" stored="true" multiValued="false" />
<field name="date" type="pdate" indexed="true" stored="true" multiValued="false" />

<field name="text" type="text_general" indexed="true" stored="true" multiValued="true" />
<copyField source="title" dest="text" />
<copyField source="writer" dest="text" />
<copyField source="board" dest="text" />
```

3. Solr 실행 또는 재실행

~~~ 
bin\solr start
bin\solr restart -p 8983
~~~

4. *Solr Admin* 접속하여 확인
   - Core Selector에서 board 선택
   - 왼쪽메뉴에서 schema 선택
   - Field 목록 확인 - board, date, text, title, writer



#### 주요 개념

- Schema 란?
  - Lucene에 저장되는 문서의 구조를 미리 정의 해 놓은 것
  - RDBMS의 Schema와 유사한 개념
- managed-schema.xml
  - Solor에서 Schema를 정의하는 XML 파일
- Field 란?
  - RDBMS의 Column과 유사한 개념
  - 문서의 내용이 저장될 형태를 나타냄
  - managed-schema.xml 에선 <field />태그로 정의함
- <field /> 태그의 속성
  - name : Field의 이름
  - type : Field의 자료 형태
  - indexed : 색인을 할 자료 형태
  - stored : 전체 내용을 저장할 지 여부
  - multiValued : 한 문서에 이 Field가 여러 개 존재할 수 있는지 여부
- <copyFiled /> 태그
  - Field의 값을 다른 Field로 복사함
  - 검색 성능 향상 효과를 얻을 수 있음



### 3. Solr 적용하기

1. 프로젝트에 solr dependency 추가

   - https://mvnrepository.com/artifact/org.apache.solr/solr-solrj/8.8.1

   - build.gradle

     `implementation group: 'org.apache.solr', name: 'solr-solrj', version: '8.8.1'`

2. Solr에 접속할 **SolrClient** 생성

   - https://solr.apache.org/docs/7_2_0/solr-solrj/org/apache/solr/client/solrj/impl/HttpSolrClient.Builder.html
   - common 패키지에 SolrJDriver.java 생성 후 아래 코드 입력

   ~~~java
   import org.apache.solr.client.solrj.SolrClient;
   import org.apache.solr.client.solrj.impl.HttpSolrClient;
   
   public class SolrDriver {
       // board Collection만 사용할 것이기 때문에 미리 지정함
       public static String url = "https://localhost:8983/solr/board";
       public static SolrClient solr = new HttpSolrClient.Builder(url).build();
   }
   ~~~

3. SolrJ 이용하여 Solr에 접속할 준비 완료

