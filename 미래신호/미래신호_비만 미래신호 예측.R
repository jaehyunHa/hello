###[1].서론
#비만 문제의 급속한 증가로 초래되는 사회경제적 손실과 부담은 매우 크다
#비만관리 주제와 관련된 빅데이터 수집, 분석해 비만과 관련된 대중의 인식과 대처방법, 사회현상을 
#보다 실제적으로 파악해 의미 도출하고자 한다
#비만(다이어트)에 대한 미래신호 탐지해 예측모형 제시하고자 함

###[2].연구방법
##2-1. 분석 자료 및 대상
#인터넷을 통해 수집된 소셜 빅데이터를 대상으로 텍스트 기반의 웹문서(버즈)를 정의
#토픽 분류에는 주제분석(text mining) 기법 사용
#토픽-비만, 다이어트/불용어-배송비만, 관리비만

#1)연구대상 수집-비만 수집 키워드
#주제를 분류하고 온톨로지와 용어체계를 개발해야 함 
#온톨로지 개발은 비만 관리 주제를 설명하는 분류틀에 해당하는 용어를 대/중/소분류 수준으로 제시
#동의어 유사어 정의

#2)연구도구 만들기
#감성분석: 감섬어 사전 사용해 긍정감정은 성공으로 부정,보통 감정은 실패로 분석

#주제분석:독립변수인 식이요법은 요인분석과 요인분석의 주제분석 과정 거쳐 코드화(차원 감소)

###[3].결과
##3-1.비만 관련 온라인 문서 현황
#ex)성공의 감정은 24.8%
#3)비만 관련 온라인 문서 현황(빈도분석, 다중반응분석)
#4)비만 관련 운동/식이요법/질병/치료 감정 교차분석(다중반응 교차분석)

##3-2.비만 미래신호 탐색
#1)비만 관련 키워드의 단어 및 문서 빈도 분석 (TF/DF/TF-IDF)

rm(list=ls())
#install.packages("wordcloud")
library(wordcloud)
key=c('걷기','유산소','유연성','스포츠','댄스','근력운동','자전거','운동치료',
       '저열량식사','원푸드식사','저지방식사','다이어트식단','균형잡힌식사',
       '현미식사','해조류섭취','채소섭취','잎채소섭취','과일섭취','육류섭취',
       '생선섭취','계란','유제품','고단백식사','소금섭취','비만치료제','한약',
       '건강보조식품','수술','시술','당뇨병치료제','암','소화기계질환',
       '생식호르몬계질환','호흡기계질환','근골격계질환','심혈관질환',
       '내분기계질환','신경계질환','합병증','신체적증상','정신증상')
freq=c(5844,3128,4997,1075,598,2086,1943,309,2673,1986,899,1700,22651,
      3187,1609,24712,4292,9246,1019,209,372,6797,161,2868,962,1380,
      6837,3286,4330,1421,1509,1320,1320,438,1482,5585,3500,385,5431,
      1786,2368)
library(RColorBrewer)
palete=brewer.pal(9,"Set1")
windows(height=5.5, width=5)
wordcloud(key,freq,scale=c(3,0.5),rot.per=.12,min.freq=5,
 random.order=F,random.color=T,colors=palete)
savePlot("비만_2011년_워드클라우드.png",type="png")


key=c('걷기','유산소','유연성','스포츠','댄스','근력운동','자전거','운동치료',
       '저열량식사','원푸드식사','저지방식사','다이어트식단','균형잡힌식사',
       '현미식사','해조류섭취','채소섭취','잎채소섭취','과일섭취','육류섭취',
       '생선섭취','계란','유제품','고단백식사','소금섭취','비만치료제','한약',
       '건강보조식품','수술','시술','당뇨병치료제','암','소화기계질환',
       '생식호르몬계질환','호흡기계질환','근골격계질환','심혈관질환',
       '내분기계질환','신경계질환','합병증','신체적증상','정신증상')
freq=c(6761,3332,5895,1041,575,2340,2772,317,2929,2064,1045,1416,
       25007,3201,1826,26372,4569,10551,948,220,361,5981,110,3108,
       1237,1364,7856,2417,5410,1398,1469,1514,1514,445,1887,6160,
       4323,271,5416,1803,2495)
library(RColorBrewer)
palete=brewer.pal(9,"Set1")
windows(height=5.5, width=5)
wordcloud(key,freq,scale=c(3,0.5),rot.per=.12,min.freq=5,
 random.order=F,random.color=T,colors=palete)
savePlot("비만_2012년_워드클라우드.png",type="png")


key=c('걷기','유산소','유연성','스포츠','댄스','근력운동','자전거','운동치료',
       '저열량식사','원푸드식사','저지방식사','다이어트식단','균형잡힌식사',
       '현미식사','해조류섭취','채소섭취','잎채소섭취','과일섭취','육류섭취',
       '생선섭취','계란','유제품','고단백식사','소금섭취','비만치료제','한약',
       '건강보조식품','수술','시술','당뇨병치료제','암','소화기계질환',
       '생식호르몬계질환','호흡기계질환','근골격계질환','심혈관질환',
       '내분기계질환','신경계질환','합병증','신체적증상','정신증상')
freq=c(5429,2816,4844,935,551,1882,1601,271,2620,1552,814,898,26206,
       2834,1432,22996,3741,9817,864,140,5071,145,2833,1108,2894,7245,
       3030,6403,1440,1647,1592,1592,306,1714,6073,3987,
       347,6402,1616,2962)
library(RColorBrewer)
palete=brewer.pal(9,"Set1")
windows(height=5.5, width=5)
wordcloud(key,freq,scale=c(3,0.5),rot.per=.12,min.freq=5,
 random.order=F,random.color=T,colors=palete)
savePlot("비만_2013년_워드클라우드.png",type="png")


key=c('걷기','유산소','유연성','스포츠','댄스','근력운동','자전거','운동치료',
       '저열량식사','원푸드식사','저지방식사','다이어트식단','균형잡힌식사',
       '현미식사','해조류섭취','채소섭취','잎채소섭취','과일섭취','육류섭취',
       '생선섭취','계란','유제품','고단백식사','소금섭취','비만치료제','한약',
       '건강보조식품','수술','시술','당뇨병치료제','암','소화기계질환',
       '생식호르몬계질환','호흡기계질환','근골격계질환','심혈관질환',
       '내분기계질환','신경계질환','합병증','신체적증상','정신증상')
freq=c(18034,9276,15736,3051,1724,6308,6316,897,8222,5602,2758,4014,
       73864,9222,4867,74080,12602,29614,2831,569,1007,17849,416,8809,
       3307,5638,21938,8733,16143,4259,4625,4426,4426,1189,
       5083,17818,11810,1003,17249,5205,7825)
library(RColorBrewer)
palete=brewer.pal(9,"Set1")
windows(height=5.5, width=5)
wordcloud(key,freq,scale=c(3,0.5),rot.per=.12,min.freq=5,
 random.order=F,random.color=T,colors=palete)
savePlot("비만_전체_워드클라우드.png",type="png")


#2)비만 관련 키워드의 미래신호 탐색-강신호/약신호/잠재신호/강하지 않지만 잘 알려진 신호 
## KEM(DOV)

rm(list=ls())
data_spss=read.table(file="비만_DoV.txt",header=T)
windows(height=5.5, width=5)
plot(data_spss$tf,data_spss$df,xlim=c(0,25000), ylim=c(-0.3,0.7), pch=18 , 
 col=8,xlab='average_term_frequency', ylab='time_weighted_increasing_rate',
 main='Keyword Emergence Map')
text(data_spss$tf,data_spss$df,label=data_spss$정책,cex=0.8, col='red')
abline(h=0.033, v=1879, lty=1, col=4, lwd=0.5)
savePlot('비만_DoV_1',type='png')


## KIM(DOD)

rm(list=ls())
data_spss=read.table(file="비만_DoD.txt",header=T)
windows(height=5.5, width=5)
plot(data_spss$tf,data_spss$df,xlim=c(0,18000), ylim=c(-0.3,0.7), pch=18 , 
 col=8,xlab='average_document_frequency', ylab='time_weighted_increasing_rate',
 main='Keyword Issue Map')
text(data_spss$tf,data_spss$df,label=data_spss$정책,cex=0.8, col='red')
abline(h=0.018, v=1879, lty=1, col=4, lwd=0.5)
savePlot('비만_DoD_1',type='png')

#약신호인 치료요인중 한약과 비만치료제는 높은 증가율을 보이므로 강신호로 발전할 수 있고
#강신호인 시술과 수술도 높은 증가율을 보이고 있으므로 대응방안을 마련해야 한다 


#3-4. 비만 미래신호 예측
##1) random forest
 
#install.packages("randomForest")
library(randomForest)
gc()
tdata = read.table('비만_randomforest.txt',header=T)
tdata.rf = randomForest(Attitude~., data=tdata,forest=FALSE,importance=TRUE)
varImpPlot(tdata.rf, main='Random forest importance plot')
savePlot("Random_비만_운동식이치료.png",type="png")
#저열량식사가 비만 감정에 가장 큰 영향을 미치는 요인 


##2) 연관분석

## 키워드간의 연관분석
#비만의 운동과 식이요법 간 연관규칙 

#install.packages("arules")
library(arules)
asso=read.table('비만_연관규칙_키워드.txt',header=T)
trans=as.matrix(asso,"Transaction")
rules1=apriori(trans,parameter=list(supp=0.001,conf=0.968,target="rules"))
inspect(sort(rules1))
summary(rules1)
rules.sorted=sort(rules1, by="confidence")
inspect(rules.sorted)
rules.sorted=sort(rules1, by="lift")
inspect(rules.sorted)
#ex){걷기, 유연성, 근력운동, 과일섭취} => {성공} 
#지지도:0.001/ 신뢰도: 0.9891/ 향상도: 3.596
#=>온라인 문서에 {걷기, 유연성, 근력운동, 과일섭취} 요인 언급되면 성공할 확률 98.91% 이며
#{걷기, 유연성, 근력운동, 과일섭취}요인이 언급되지 않을 때보다 성공할 확률 3.6배 증가한다 


##  연관규칙 SNA 그래프 
#비만의 운동과 식이요법 간 연관규칙의 SNA 

#install.packages("dplyr")
library(dplyr)
#install.packages("igraph")
library(igraph)
#install.packages("arules")
library(arules)
asso=read.table('비만_연관규칙_키워드.txt',header=T)
trans=as.matrix(asso,"Transaction")
rules1=apriori(trans,parameter=list(supp=0.001,conf=0.974,target="rules"))
inspect(sort(rules1))
rules = labels(rules1, ruleSep="/", setStart="", setEnd="")
rules = sapply(rules, strsplit, "/",  USE.NAMES=F)
rules = Filter(function(x){!any(x == "")},rules)
rulemat = do.call("rbind", rules)
rulequality = quality(rules1)
ruleg = graph.edgelist(rulemat,directed=F)
ruleg = graph.edgelist(rulemat[-c(1:16),],directed=F)
plot.igraph(ruleg, vertex.label=V(ruleg)$name, vertex.label.cex=1, 
 vertex.size=20, layout=layout.fruchterman.reingold.grid) 
savePlot("비만연관_키워드.png", type="png")
#=>{유산소, 걷기, 유연성, 근력운동, 과일섭취, 균형잡힌식사는 성공에 상호 연결되어 있음}


## 키워드와 종속변수 간의 연관분석
## 비만 운동 종속변수(비만의 감정)와 독립변수(운동, 식이요법)간의 연관분석 

asso=read.table('비만_연관규칙_키워드종속변수.txt',header=T)
library(arules)
trans=as.matrix(asso,"Transaction")
rules1=apriori(trans,parameter=list(supp=0.001,conf=0.82), 
 appearance=list(rhs=c("실패", "성공"), 
 default="lhs"),control=list(verbose=F))
inspect(sort(rules1))
summary(rules1)
rules.sorted=sort(rules1, by="confidence")
inspect(rules.sorted)
rules.sorted=sort(rules1, by="lift")
inspect(rules.sorted)


## 키워드와 종속변수간 SNA 그래프

#install.packages("dplyr")
library(dplyr)
#install.packages("igraph")
library(igraph)
#install.packages("arules")
library(arules)
asso=read.table('비만_연관규칙_키워드종속변수.txt',header=T)
trans=as.matrix(asso,"Transaction")
rules1=apriori(trans,parameter=list(supp=0.001,conf=0.82), 
 appearance=list(rhs=c("실패", "성공"), 
 default="lhs"),control=list(verbose=F))
inspect(sort(rules1))
summary(rules1)
rules.sorted=sort(rules1, by="confidence")
inspect(rules.sorted)
rules.sorted=sort(rules1, by="lift")
inspect(rules.sorted)
rules = labels(rules1, ruleSep="/", setStart="", setEnd="")
rules = sapply(rules, strsplit, "/",  USE.NAMES=F)
rules = Filter(function(x){!any(x == "")},rules)
rulemat = do.call("rbind", rules)
rulequality = quality(rules1)
ruleg = graph.edgelist(rulemat,directed=F)
ruleg = graph.edgelist(rulemat[-c(1:16),],directed=F)
plot.igraph(ruleg, vertex.label=V(ruleg)$name, vertex.label.cex=1, 
 vertex.size=20, layout=layout.fruchterman.reingold.grid) 
savePlot("비만연관_키종속.png", type="png")


#비만에 대한 미래신호 예측 결과
#1. 성공 감정은 24.8%
#2. DOV증가율과 평균단어빈도를 분석한 결과 걷기, 채소섭취, 시술, 합병증이 많이 확산되고 있음
#3. 걷기는 문서빈도 높으나 증가율이 중앙값보다 낮아 걷기에 대한 국민의 관심 높이는 방안 마련!
#4. 시술은 문서 빈도 높고 증가율 높아 무분별한 시술 방지 위한 대책 마련!
#5. 약신호 중 한약과 비만치료제가 높은 증가율 보이므로 과학적 근거 마련!
#   강신호 중 시술과 수술이 높은 증가율을 보이므로 대응방안 마련!
#6. 유연성, 자전거, 근력운동이 동시에 언급되면 성공 확율 높게 나타남
#   {걷기, 유연성, 근력운동, 과일섭취}->{성공} 확률 높게 나타남 
