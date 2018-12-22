function [map_value_all, map_value_topics, rprec_all, rprec_value_topics, p10_value_all, p10_value_topics] = parser(path)
%import the file with the results obtained from trec_eval
nostop_noporter_tfidf_file=fopen(path,'r');
nostop_noporter_tfidf_matrix=textscan(nostop_noporter_tfidf_file, '%s %s %f', 'HeaderLines',1);
fclose(nostop_noporter_tfidf_file);
%define three different arrays, one for each column of the .txt file
measures=nostop_noporter_tfidf_matrix{1};
values=nostop_noporter_tfidf_matrix{3};
%extract map values
value_indexes = find(strcmp(measures,{'map'}));
%the last value is the overall result
map_value_all = values(value_indexes(end,:));
map_value_topics = values(value_indexes(1:end-1,:));
%extract Rprec values
value_indexes = find(strcmp(measures,{'Rprec'}));
%the last value is the overall result
rprec_all = values(value_indexes(end,:));
rprec_value_topics = values(value_indexes(1:end-1,:));
%extract p_10 values
value_indexes = find(strcmp(measures,{'P_10'}));
%the last value is the overall result
p10_value_all = values(value_indexes(end,:));
p10_value_topics = values(value_indexes(1:end-1,:));



