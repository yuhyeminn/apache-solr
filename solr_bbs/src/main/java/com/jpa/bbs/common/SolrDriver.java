package com.jpa.bbs.common;

import org.apache.solr.client.solrj.SolrClient;
import org.apache.solr.client.solrj.impl.HttpSolrClient;

public class SolrDriver {
    public static String url = "https://localhost:8983/solr/board";
    public static SolrClient solr = new HttpSolrClient.Builder(url).build();
}
