%%Plot 

%get the results from the no stoplist, no porter stemmer, TF*IDF trec_eval file
[nn_tfidf_map_all, nn_tfidf_map_topics, nn_tfidf_rprec_all, nn_tfidf_rprec_topics, nn_tfidf_p10_all, nn_tfidf_p10_topics]=parser('./Results/nostoplist_noporter_TFIDF/trec_eval_results/nostoplist_noporter_TFIDF_trec_eval.txt');

%get the results from the no stoplist, porter stemmer, BM25 trec_eval file
[np_bm25_map_all, np_bm25_map_topics, np_bm25_rprec_all, np_bm25_rprec_topics, np_bm25_p10_all, np_bm25_p10_topics]=parser('./Results/nostoplist_porter_BM25/trec_eval_results/nostoplist_porter_BM25_trec_eval.txt');

%get the results from the stoplist, porter stemmer, BM25 trec_eval file
[sp_bm25_map_all, sp_bm25_map_topics, sp_bm25_rprec_all, sp_bm25_rprec_topics, sp_bm25_p10_all, sp_bm25_p10_topics]=parser('./Results/stoplist_porter_BM25/trec_eval_results/stoplist_porter_BM25_trec_eval.txt');

%get the results from the stoplist, porter stemmer, TF*IDF trec_eval file
[sp_tfidf_map_all, sp_tfidf_map_topics, sp_tfidf_rprec_all, sp_tfidf_rprec_topics, sp_tfidf_p10_all, sp_tfidf_p10_topics]=parser('./Results/stoplist_porter_TFIDF/trec_eval_results/stoplist_porter_TFIDF_trec_eval.txt');

%legend
legend_value=["stoplist - porter stemmer - BM25","no stoplist - porter stemmer - BM25", "stoplist - porter stemmer - TF*IDF", "no stoplist - no porter stemmer - TF*IDF"];
legend_measure=["map","Rprec","P@10"];

%%MAP TOPIC COMPARISON PLOT
figure(1)
bar([sp_bm25_map_topics, np_bm25_map_topics, sp_tfidf_map_topics, nn_tfidf_map_topics]);
xlabel("Topic")
ylabel("Map Precision")
legend(legend_value)

%%RPREC TOPIC COMPARISON PLOT
figure(2)
bar([sp_bm25_rprec_topics, np_bm25_rprec_topics, sp_tfidf_rprec_topics, nn_tfidf_rprec_topics]);
xlabel("Topic")
ylabel("Rank Precision")
legend(legend_value)

%%P10 TOPIC COMPARISON PLOT
figure(3)
bar([sp_bm25_p10_topics, np_bm25_p10_topics, sp_tfidf_p10_topics, nn_tfidf_p10_topics]);
xlabel("Topic")
ylabel("Precision at 10")
legend(legend_value)

%%MAP ALL COMPARISON PLOT
figure(4)
bar([sp_bm25_map_all, np_bm25_map_all, sp_tfidf_map_all, nn_tfidf_map_all]);
xlabel("Run")
ylabel("Map Precision")
set(gca,'xticklabel',legend_value.')

%%RPREC ALL COMPARISON PLOT
figure(5)
bar([sp_bm25_rprec_all, np_bm25_rprec_all, sp_tfidf_rprec_all, nn_tfidf_rprec_all]);
xlabel("Run")
ylabel("Rank Precision")
set(gca,'xticklabel',legend_value.')

%%P10 ALL COMPARISON PLOT
figure(6)
bar([sp_bm25_p10_all, np_bm25_p10_all, sp_tfidf_p10_all, nn_tfidf_p10_all]);
xlabel("Run")
ylabel("Precision at 10")
set(gca,'xticklabel',legend_value.')

%%BM25 with stoplist and stemmer COMPARISON PLOT
figure(7)
bar([sp_bm25_map_all, sp_bm25_rprec_all, sp_bm25_p10_all]);
xlabel("Measure")
ylabel("Precision")
set(gca,'xticklabel',legend_measure.')
title("stoplist - porter stemmer - BM25")

%%BM25 without stoplist but with stemmer COMPARISON PLOT
figure(8)
bar([np_bm25_map_all, np_bm25_rprec_all, np_bm25_p10_all]);
xlabel("Measure")
ylabel("Precision")
set(gca,'xticklabel',legend_measure.')
title("no stoplist - porter stemmer - BM25")


%%TF*IDF with stoplist and stemmer COMPARISON PLOT
figure(9)
bar([sp_tfidf_map_all, sp_tfidf_rprec_all, sp_tfidf_p10_all]);
xlabel("Measure")
ylabel("Precision")
set(gca,'xticklabel',legend_measure.')
title("stoplist - porter stemmer - TF*IDF")

%%TF*IDF without both stoplist and stemmer COMPARISON PLOT
figure(10)
bar([nn_tfidf_map_all, nn_tfidf_rprec_all, nn_tfidf_p10_all]);
xlabel("Measure")
ylabel("Precision")
set(gca,'xticklabel',legend_measure.')
title("no stoplist - no porter stemmer - TF*IDF")


