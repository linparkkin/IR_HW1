%
% Copyright 2018-2019 University of Padua, Italy
%
% Licensed under the Apache License, Version 2.0 (the "License");
% you may not use this file except in compliance with the License.
% You may obtain a copy of the License at
%
%     http://www.apache.org/licenses/LICENSE-2.0
%
% Unless required by applicable law or agreed to in writing, software
% distributed under the License is distributed on an "AS IS" BASIS,
% WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
% See the License for the specific language governing permissions and
% limitations under the License.
%
% Author: Nicola Ferro (ferro@dei.unipd.it)



%get the results from the no stoplist, no porter stemmer, TF*IDF trec_eval file
[~, nn_tfidf_map_topics, ~, nn_tfidf_rprec_topics, ~, nn_tfidf_p10_topics]=parser('./Results/nostoplist_noporter_TFIDF/trec_eval_results/nostoplist_noporter_TFIDF_trec_eval.txt');

%get the results from the no stoplist, porter stemmer, BM25 trec_eval file
[~, np_bm25_map_topics, ~, np_bm25_rprec_topics, ~, np_bm25_p10_topics]=parser('./Results/nostoplist_porter_BM25/trec_eval_results/nostoplist_porter_BM25_trec_eval.txt');

%get the results from the stoplist, porter stemmer, BM25 trec_eval file
[~, sp_bm25_map_topics, ~, sp_bm25_rprec_topics, ~, sp_bm25_p10_topics]=parser('./Results/stoplist_porter_BM25/trec_eval_results/stoplist_porter_BM25_trec_eval.txt');

%get the results from the stoplist, porter stemmer, TF*IDF trec_eval file
[~, sp_tfidf_map_topics, ~, sp_tfidf_rprec_topics, ~, sp_tfidf_p10_topics]=parser('./Results/stoplist_porter_TFIDF/trec_eval_results/stoplist_porter_TFIDF_trec_eval.txt');



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% MAP 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
measure=[sp_bm25_map_topics,np_bm25_map_topics,sp_tfidf_map_topics,nn_tfidf_map_topics];
runID=["stoplist - porter stemmer - BM25","no stoplist - porter stemmer - BM25", "stoplist - porter stemmer - TF*IDF", "no stoplist - no porter stemmer - TF*IDF"];
m = mean(measure);

% sort in descending order of mean score
[~, idx] = sort(m, 'descend');

% re-order runs by ascending mean of the measure
% needed to have a more nice looking box plot
measure = measure(:, idx);
runID = runID(idx);

% perform the ANOVA
[~, tbl, sts] = anova1(measure, runID, 'off');

% display the ANOVA table
tbl

% perform
c_map = multcompare(sts, 'Alpha', 0.05, 'Ctype', 'hsd'); 

% display the multiple comparisons
c_map

%% plots of the data

% get the Tukey HSD test figure
currentFigure = gcf;

ax = gca;
ax.FontSize = 20;
ax.XLabel.String = 'Average Precision (AP)';
ax.YLabel.String = 'Run';
ax.Title.String= "Map Measure";

currentFigure.PaperPositionMode = 'auto';
currentFigure.PaperUnits = 'centimeters';
currentFigure.PaperSize = [42 22];
currentFigure.PaperPosition = [1 1 40 20];

print(currentFigure, '-djpeg', './Plots/mean-tukey.jpeg');

% box plot
currentFigure = figure;
% need to reverse the order of the columns to have bloxplot displayed
% as the Tukey HSD plot
boxplot(measure(:, end:-1:1), 'Labels', runID(end:-1:1), ...
    'Orientation', 'horizontal', 'Notch','off', 'Symbol', 'ro')

ax = gca;
ax.FontSize = 20;
ax.XLabel.String = 'Average Precision (AP)';
ax.YLabel.String = 'Run';
ax.Title.String = "Map Measure";

currentFigure.PaperPositionMode = 'auto';
currentFigure.PaperUnits = 'centimeters';
currentFigure.PaperSize = [42 22];
currentFigure.PaperPosition = [1 1 40 20];

print(currentFigure, '-djpeg', './Plots/mean-boxplot.jpeg');

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Rprec 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
measure=[sp_bm25_rprec_topics,np_bm25_rprec_topics,sp_tfidf_rprec_topics,nn_tfidf_rprec_topics];
runID=["stoplist - porter stemmer - BM25","no stoplist - porter stemmer - BM25", "stoplist - porter stemmer - TF*IDF", "no stoplist - no porter stemmer - TF*IDF"];
m = mean(measure);

% sort in descending order of mean score
[~, idx] = sort(m, 'descend');

% re-order runs by ascending mean of the measure
% needed to have a more nice looking box plot
measure = measure(:, idx);
runID = runID(idx);

% perform the ANOVA
[~, tbl, sts] = anova1(measure, runID, 'off');

% display the ANOVA table
tbl

% perform
c_rprec = multcompare(sts, 'Alpha', 0.05, 'Ctype', 'hsd'); 

% display the multiple comparisons
c_rprec

%% plots of the data

% get the Tukey HSD test figure
currentFigure = gcf;

ax = gca;
ax.FontSize = 20;
ax.XLabel.String = 'Average Precision (AP)';
ax.YLabel.String = 'Run';
ax.Title.String= "Rprec Measure";

currentFigure.PaperPositionMode = 'auto';
currentFigure.PaperUnits = 'centimeters';
currentFigure.PaperSize = [42 22];
currentFigure.PaperPosition = [1 1 40 20];

print(currentFigure, '-djpeg', './Plots/rprec-tukey.jpeg');

% box plot
currentFigure = figure;
% need to reverse the order of the columns to have bloxplot displayed
% as the Tukey HSD plot
boxplot(measure(:, end:-1:1), 'Labels', runID(end:-1:1), ...
    'Orientation', 'horizontal', 'Notch','off', 'Symbol', 'ro')
ax = gca;
ax.FontSize = 20;
ax.XLabel.String = 'Average Precision (AP)';
ax.YLabel.String = 'Run';
ax.Title.String= "Rprec Measure";
   
currentFigure.PaperPositionMode = 'auto';
currentFigure.PaperUnits = 'centimeters';
currentFigure.PaperSize = [42 22];
currentFigure.PaperPosition = [1 1 40 20];

print(currentFigure, '-djpeg', './Plots/rprec-boxplot.jpeg');
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Precision at 10
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
measure=[sp_bm25_p10_topics,np_bm25_p10_topics,sp_tfidf_p10_topics,nn_tfidf_p10_topics];
runID=["stoplist - porter stemmer - BM25","no stoplist - porter stemmer - BM25", "stoplist - porter stemmer - TF*IDF", "no stoplist - no porter stemmer - TF*IDF"];
m = mean(measure);

% sort in descending order of mean score
[~, idx] = sort(m, 'descend');

% re-order runs by ascending mean of the measure
% needed to have a more nice looking box plot
measure = measure(:, idx);
runID = runID(idx);

% perform the ANOVA
[~, tbl, sts] = anova1(measure, runID, 'off');

% display the ANOVA table
tbl

% perform
c_p10 = multcompare(sts, 'Alpha', 0.05, 'Ctype', 'hsd'); 

% display the multiple comparisons
c_p10

%% plots of the data

% get the Tukey HSD test figure
currentFigure = gcf;

ax = gca;
ax.FontSize = 20;
ax.XLabel.String = 'Average Precision (AP)';
ax.YLabel.String = 'Run';
ax.Title.String="Precision at 10 Measure";

currentFigure.PaperPositionMode = 'auto';
currentFigure.PaperUnits = 'centimeters';
currentFigure.PaperSize = [42 22];
currentFigure.PaperPosition = [1 1 40 20];

print(currentFigure, '-djpeg', './Plots/p10-tukey.jpeg');

% box plot
currentFigure = figure;
% need to reverse the order of the columns to have bloxplot displayed
% as the Tukey HSD plot
boxplot(measure(:, end:-1:1), 'Labels', runID(end:-1:1), ...
    'Orientation', 'horizontal', 'Notch','off', 'Symbol', 'ro')

ax = gca;
ax.FontSize = 20;
ax.XLabel.String = 'Average Precision (AP)';
ax.YLabel.String = 'Run';
ax.Title.String="Precision at 10 Measure";


currentFigure.PaperPositionMode = 'auto';
currentFigure.PaperUnits = 'centimeters';
currentFigure.PaperSize = [42 22];
currentFigure.PaperPosition = [1 1 40 20];

print(currentFigure, '-djpeg', './Plots/p10-boxplot.jpeg');