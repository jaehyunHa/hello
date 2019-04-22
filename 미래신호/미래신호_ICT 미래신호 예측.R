## ICT 분야 워드클라우드 작성


#install.packages("wordcloud")
library(wordcloud)
key=c('객관성','경쟁력강화','경제성장','경제혁신','경제협력','극대화','급등','급증',
 '데이터화','맞춤형서비스','맞춤형제약기술','무인화','부각','상호연결성','상호연동',
 '속보성','신산업창조','신성장','인프라구축','일자리창출','자동접속','자동화','절감',
 '정보보호','정확성','증가','증대','차별화','초감각적지각','확산')
freq=c(226,4156,4172,1892,2066,4288,3418,5306,122,941,7,175,3978,33,113,12,235,3529,
 4063,8275,9,2529,5607,3497,777,18474,4628,4656,5,14990)
library(RColorBrewer)
palete=brewer.pal(9,"Set1")
windows(height=5.5, width=5)
wordcloud(key,freq,scale=c(3,0.5),rot.per=.10,min.freq=5,random.order=F,
 random.color=T,colors=palete)
savePlot("순기능_T.png",type="png")


library(wordcloud)
key=c('Ddos','개인정보유출','경제적부담','경제제재','데이터변조','데이터손실','도용',
 '디지털치매','명예훼손','문화적역기능','바이러스','보이스피싱','불법복제','사이버명예훼손',
 '사이버범죄','사이버성폭력','사이버폭력','사회적병리현상','사회적역기능','산업경쟁력약화',
 '인터넷중독','스팸메일','시스템오류','언어파괴','여론조작','위치정보유출','음란물',
 '전자파','정보격차','정보홍수','프라이버시침해')
freq=c(182,1634,178,535,6,26,290,16,175,4,857,196,1647,26,991,13,83,4,8,8,937,136,
       929,3,54,2,242,511,1399,15,583)
library(RColorBrewer)
palete=brewer.pal(9,"Set1")
windows(height=5.5, width=5)
wordcloud(key,freq,scale=c(3,0.5),rot.per=.10,min.freq=5,random.order=F,
 random.color=T,colors=palete)
savePlot("역기능_T.png",type="png")

#3-2.미래신호 탐색-강신호/약신호/잠재신호/강하지 않지만 잘 알려진 신호 
## 미래신호 ICT DoV

rm(list=ls())
data_spss=read.table(file="미래ICT_DoV_T.txt",header=T)
windows(height=5.5, width=5)
plot(data_spss$tf,data_spss$df,xlim=c(0,18000), ylim=c(-0.5,3), pch=18 , 
 col=8,xlab='average_term_frequency', ylab='time_weighted_increasing_rate',
 main='Keyword Emergence Map')
text(data_spss$tf,data_spss$df,label=data_spss$ICT,cex=0.8, col='red')
abline(h=-0.039, v=671, lty=1, col=4, lwd=0.5)
savePlot('미래ICT_DoV_T',type='png')


## 미래신호 ICT DoD

rm(list=ls())
data_spss=read.table(file="미래ICT_DoD_T.txt",header=T)
windows(height=5.5, width=5)
plot(data_spss$tf,data_spss$df,xlim=c(0,6500), ylim=c(-0.4,2), pch=18 ,
 col=8,xlab='average_document_frequency', ylab='time_weighted_increasing_rate',
 main='Keyword Issue Map')
text(data_spss$tf,data_spss$df,label=data_spss$ICT,cex=0.8, col='red')
abline(h=-0.074, v=407, lty=1, col=4, lwd=0.5)
savePlot('미래ICT_DoD_T',type='png')

#약신호인 2사분면에서는 하둡, 알고리즘, 패턴인식이 높은 증가율을 보였는데,
#시간이 지나면 강신호로 발전할 수 있으므로 서비스 모형의 개발이 필요할 것으로 보임 

#강신호이면서 높은증가율을 보이는 머신러닝, 증강현실, 사물인터넷은 
#ICT와 융합된 기술 개발 지속적으로 이뤄야져야할 것 



#3-3 ICT 미래신호 예측 
## 1)random forest 수요/공급

rm(list=ls())
#install.packages("randomForest")
library(randomForest)
tdata = read.table('ICT_ransomforest.txt',header=T)
tdata.rf = randomForest(Attitude~., data=tdata,
 forest=FALSE,importance=TRUE)
varImpPlot(tdata.rf,main='Random forest importance plot')
savePlot('ICT_randomforest_T',type='png')
#ICT 태도(수요자/공급자)에 가장 큰영향을 미치는 기술은  communication 기술 


#2)연관분석: 한 문서에 포함된 둘 이상의 단어에 대한 상호 관련성을 발견하는 것 
##  미래ICT 기술

rm(list=ls())
asso=read.table(file='ICT_association.txt',header=T)
#install.packages("arules")
library(arules)
trans=as.matrix(asso,"Transaction")
rules1=apriori(trans,parameter=list(supp=0.001,conf=0.1), 
 appearance=list(rhs=c("Consumer", "Provider"), default="lhs")
 ,control=list(verbose=F))
#신뢰도:0.1/향상도:4.556이면 그 단어가 언급되면 공급자(0)일 확률이 10%이며
#단어가 언급되지 않을 때보다 공급자일 확률이 4.556배 높아진다는 뜻 
inspect(sort(rules1))
summary(rules1)
rules.sorted=sort(rules1, by="confidence")
inspect(rules.sorted)
rules.sorted=sort(rules1, by="lift")
inspect(rules.sorted)


## 제한규칙 출력

rule_sub=subset(rules1,subset=rhs%pin% 'Provider' 
 & confidence>=0.59)
inspect(sort(rule_sub,by="lift"))

## 제한규칙 출력

rule_sub=subset(rules1,subset=rhs%pin% 'Consumer' 
 & confidence>=0.27)
inspect(sort(rule_sub,by="lift"))

##  그래픽 SNA 

#install.packages("dplyr")
library(dplyr)
#install.packages("igraph")
library(igraph)
rules = labels(rule_sub, ruleSep="/", setStart="", setEnd="")
rules = sapply(rules, strsplit, "/",  USE.NAMES=F)
rules = Filter(function(x){!any(x == "")},rules)
rulemat = do.call("rbind", rules)
rulequality = quality(rules1)
ruleg = graph.edgelist(rulemat,directed=F)
ruleg = graph.edgelist(rulemat[-c(1:16),],directed=F)
plot.igraph(ruleg, vertex.label=V(ruleg)$name, vertex.label.cex=1, 
 vertex.size=20, layout=layout.fruchterman.reingold.grid)


