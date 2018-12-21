%%Plot 

%get the results from the no stoplist, no porter stemmer, TF*IDF trec_eval file
[nn_tfidf_map_all, nn_tfidf_map_topics, nn_tfidf_rprec_all, nn_tfidf_rprec_topics, nn_tfidf_p10_all, nn_tfidf_p10_topics]=parser('./nostoplist_noporter_TFIDF/trec_eval_results/nostoplist_noporter_TFIDF_trec_eval.txt');

%get the results from the no stoplist, porter stemmer, BM25 trec_eval file
[np_bm25_map_all, np_bm25_map_topics, np_bm25_rprec_all, np_bm25_rprec_topics, np_bm25_p10_all, np_bm25_p10_topics]=parser('./nostoplist_porter_BM25/trec_eval_results/nostoplist_porter_BM25_trec_eval.txt');

%get the results from the stoplist, porter stemmer, BM25 trec_eval file
[sp_bm25_map_all, sp_bm25_map_topics, sp_bm25_rprec_all, sp_bm25_rprec_topics, sp_bm25_p10_all, sp_bm25_p10_topics]=parser('./stoplist_porter_BM25/trec_eval_results/stoplist_porter_BM25_trec_eval.txt');

%get the results from the stoplist, porter stemmer, TF*IDF trec_eval file
[sp_tfidf_map_all, sp_tfidf_map_topics, sp_tfidf_rprec_all, sp_tfidf_rprec_topics, sp_tfidf_p10_all, sp_tfidf_p10_topics]=parser('./stoplist_porter_TFIDF/trec_eval_results/stoplist_porter_TFIDF_trec_eval.txt');
