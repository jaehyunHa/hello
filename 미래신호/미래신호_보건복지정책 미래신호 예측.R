## 5.보건복지정책 감정 변화 그래프(본 내용 사용)
#(col(1-6) 검정, 빨강, 초록, 파랑, 연파랑, 보라, 노랑, 회색)

rm(list=ls())
policy=read.csv("정책감정_그래프.csv",sep=",",stringsAsFactors=F)
a=policy$반대
b=policy$찬성
plot(a,xlab="",ylab="",ylim=c(0,120),type="o",axes=FALSE,ann=F,col=1)  #반대 그래프 
title(main="2016년 보건복지 정책 감정(1-9월)",col.main=1,font.main=2) 
#title(xlab="정책",col.lab=1)
title(ylab="버즈(%)",col.lab=1)
axis(1,at=1:18,lab=c(policy$정책),las=2)
axis(2,ylim=c(0,120),las=2)
lines(b,col=2,type="o", lty=2)    #찬성 그래프 
colors=c(1,2,4)
ITY=cbind(lty=1, lty=2,lty=3)
legend(13,120,c("반대","찬성","평균"),cex=0.9,col=colors,lty=ITY,lwd=2)
abline(h=12.7,lty=3, col=4, lwd=0.5)
abline(h=87.3,lty=3, col=4, lwd=0.5)
savePlot("정책감정그래프.png",type="png")

rm(list=ls())
policy=read.csv("정책감정_그래프_13.csv",sep=",",stringsAsFactors=F)
a=policy$반대
b=policy$찬성
plot(a,xlab="",ylab="",ylim=c(0,120),type="o",axes=FALSE,ann=F,col=1)
title(main="2016년 보건복지 정책 감정(1-3월)",col.main=1,font.main=2) 
#title(xlab="정책",col.lab=1)
title(ylab="버즈(%)",col.lab=1)
axis(1,at=1:18,lab=c(policy$정책),las=2)
axis(2,ylim=c(0,120),las=2)
lines(b,col=2,type="o")
colors=c(2,1)
legend(13,120,c("반대","찬성"),cex=0.9,col=colors,lty=1,lwd=2)
abline(h=12.8,lty=1, col=4, lwd=0.5)
abline(h=87.2,lty=1, col=4, lwd=0.5)
savePlot("정책감정그래프_13.png",type="png")

rm(list=ls())
policy=read.csv("정책감정_그래프_46.csv",sep=",",stringsAsFactors=F)
a=policy$반대
b=policy$찬성
plot(a,xlab="",ylab="",ylim=c(0,120),type="o",axes=FALSE,ann=F,col=1)
title(main="2016년 보건복지 정책 감정(4-6월)",col.main=1,font.main=2) 
#title(xlab="정책",col.lab=1)
title(ylab="버즈(%)",col.lab=1)
axis(1,at=1:18,lab=c(policy$정책),las=2)
axis(2,ylim=c(0,120),las=2)
lines(b,col=2,type="o")
colors=c(2,1)
legend(13,120,c("반대","찬성"),cex=0.9,col=colors,lty=1,lwd=2)
abline(h=13.5,lty=1, col=4, lwd=0.5)
abline(h=86.5,lty=1, col=4, lwd=0.5)
savePlot("정책감정그래프_46.png",type="png")

rm(list=ls())
policy=read.csv("정책감정_그래프_79.csv",sep=",",stringsAsFactors=F)
a=policy$반대
b=policy$찬성
plot(a,xlab="",ylab="",ylim=c(0,120),type="o",axes=FALSE,ann=F,col=1)
title(main="2016년 보건복지 정책 감정(7-9월)",col.main=1,font.main=2) 
#title(xlab="정책",col.lab=1)
title(ylab="버즈(%)",col.lab=1)
axis(1,at=1:18,lab=c(policy$정책),las=2)
axis(2,ylim=c(0,120),las=2)
lines(b,col=2,type="o")
colors=c(2,1)
legend(13,120,c("반대","찬성"),cex=0.9,col=colors,lty=1,lwd=2)
abline(h=12.0,lty=1, col=4, lwd=0.5)
abline(h=88.0,lty=1, col=4, lwd=0.5)
savePlot("정책감정그래프_79.png",type="png")


### 시각화
#6. 보건복지 정책, 이슈의 월별 키워드 변화 

#install.packages("wordcloud")
library(wordcloud)

#감성분석 결과 찬성요인(Attitude)  
key=c('관심','마련','최고','진행','참여','다양','운영','실현','행복','노력','소중','지원','가능',
      '계획','확대','시행','최우선','발표','증가','필요','도움','추진')
freq=c(12777,8471,6570,16180,10116,11445,14545,3757,9318,242,22696,18572,5632,12821,
        9798,726,6439,4443,21242,9930,10306)
library(RColorBrewer)
palete=brewer.pal(9,"Set1")
wordcloud(key,freq,scale=c(5,0.5),rot.per=.12,min.freq=5,
          random.order=F,random.color=T,colors=palete)
savePlot("2016정책찬성.png",type="png")

#반대 요인 
key=c('부족','무시','반대','지적','부담','억울','비판','논란','문제','어려움','규제')
freq=c(3011,2451,7633,4065,6055,236,3535,4180,14794,4078,1029)
library(RColorBrewer)
palete=brewer.pal(9,"Set1")
wordcloud(key,freq,scale=c(5,0.5),rot.per=.12,min.freq=5,
          random.order=F,random.color=T,colors=palete)
savePlot("2016정책반대.png",type="png")


# TF wordcolud 
#
#정책, 이슈 
key=c('행복한노후','국민연금','기초연금','보육','결혼출산','가족친화',
 '미래세대육성','의료민영화','무상정책','건강보험','원격의료','중증질환',
 '환자안전','보건산업','복지급여','건강증진','일자리','의료비','자살',
 '등록금','세금','개인정보','부동산','양극화','치료','담배','증세')
freq=c(964,2892,2433,5550,15720,1436,2095,1943,2869,5458,1808,696,
 891,4286,20006,14691,27845,2545,2003,1445,13050,1947,1893,1005,
 11114,1788,20736)
library(RColorBrewer)
palete=brewer.pal(9,"Set1")
wordcloud(key,freq,scale=c(3,0.5),rot.per=.12,min.freq=5,random.order=F,
 random.color=T,colors=palete)
savePlot("2016정책이슈_TF_전체.png",type="png")


freq=c(333,1100,1205,1919,4330,468,1214,680,1396,554,372,309,1266,6986,3976,10390,1122,
701,525,6543,894,724,314,3769,488,10049)
library(RColorBrewer)
palete=brewer.pal(9,"Set1")
wordcloud(key,freq,scale=c(3,0.5),rot.per=.12,min.freq=5,random.order=F,random.color=T,colors=palete)
savePlot("2016정책이슈_TF_13월.png",type="png")

freq=c(276,1214,599,2069,4399,512,395,978,814,1725,367,131,205,1503,5563,3973,8202,693,
639,378,3369,695,577,295,3734,528,4001)
library(RColorBrewer)
palete=brewer.pal(9,"Set1")
wordcloud(key,freq,scale=c(3,0.5),rot.per=.12,min.freq=5,random.order=F,random.color=T,colors=palete)
savePlot("2016정책이슈_TF_46월.png",type="png")

freq=c(355,578,629,1562,6991,456,486,285,659,1747,887,193,377,1517,7457,6742,9253,730,
663,542,3138,358,592,396,3611,772,6686)
library(RColorBrewer)
palete=brewer.pal(9,"Set1")
wordcloud(key,freq,scale=c(3,0.5),rot.per=.12,min.freq=5,random.order=F,random.color=T,colors=palete)
savePlot("2016정책이슈_TF_79월.png",type="png")



#7.보건복지 관련 키워드
## KEM(keyword emergency map)-tf


rm(list=ls())
data_spss=read.table(file="미래정책_DoV.txt",header=T)
windows(height=5.5, width=5)
plot(data_spss$tf,data_spss$df,xlim=c(0,10000), ylim=c(-0.3,1.0), pch=18 ,
 col=8,xlab='average_term_frequency', ylab='time_weighted_increasing_rate',
 main='Keyword Emergence Map')
text(data_spss$tf,data_spss$df,label=data_spss$정책,cex=0.8, col='red')
abline(h=0.093, v=811, lty=1, col=4, lwd=0.5)
savePlot('미래정책_DoV',type='png')

## KIM(keyword issue map)-df

rm(list=ls())
data_spss=read.table(file="미래정책_DoD.txt",header=T)
windows(height=5.5, width=5)
plot(data_spss$tf,data_spss$df,xlim=c(0,6000), ylim=c(-0.4,1.5), pch=18 , 
 col=8,xlab='average_document_frequency', ylab='time_weighted_increasing_rate',
 main='Keyword Issue Map')
text(data_spss$tf,data_spss$df,label=data_spss$정책,cex=0.8, col='red')
abline(h=0.037, v=517, lty=1, col=4, lwd=0.5)
savePlot('미래정책_DoD',type='png')



## KEM

rm(list=ls())
data_spss=read.table(file="미래정책_DoV.txt",header=T)
windows(height=5.5, width=5)
plot(data_spss$tf,data_spss$df,xlim=c(0,10000), ylim=c(-0.3,1.0), pch=18 , 
 col=8,xlab='평균단어빈도', ylab='평균증가율',
 main='Keyword Emergence Map')
text(data_spss$tf,data_spss$df,label=data_spss$정책,cex=0.8, col='red')
abline(h=0.093, v=811, lty=1, col=4, lwd=0.5)
savePlot('미래정책국문_DoV',type='png')

## KIM

rm(list=ls())
data_spss=read.table(file="미래정책_DoD.txt",header=T)
windows(height=5.5, width=5)
plot(data_spss$tf,data_spss$df,xlim=c(0,6000), ylim=c(-0.4,1.5), pch=18 , 
 col=8,xlab='평균문서빈도', ylab='평균증가율',
 main='Keyword Issue Map')
text(data_spss$tf,data_spss$df,label=data_spss$정책,cex=0.8, col='red')
abline(h=0.037, v=517, lty=1, col=4, lwd=0.5)
savePlot('미래정책국문_DoD',type='png')



#4-4. 보건복지정책 미래신호 예측
#1)랜덤포레스트 
##8.랜덤포레스트 모델의 보건복지 주요 정책의 중요도
## random forest

#install.packages("randomForest")
library(randomForest)
tdata = read.table('보건복지_random_정책.txt',header=T)
tdata.rf = randomForest(Attitude~., data=tdata,forest=FALSE,importance=TRUE)
varImpPlot(tdata.rf, main='Random forest importance plot')


tdata = read.table('보건복지_random_이슈.txt',header=T)
tdata.rf = randomForest(Attitude~., data=tdata,forest=FALSE,importance=TRUE)
varImpPlot(tdata.rf, main='Random forest importance plot')


#2)연관규칙 
## association rule

#11. 보건복지 주요 정책의 연관규칙 
asso=read.table('보건복지_association_정책.txt',header=T)
library(arules)
trans=as.matrix(asso,"Transaction")
rules1=apriori(trans,parameter=list(supp=0.01,conf=0.5), appearance=list(rhs=c("찬성", "반대"), 
 default="lhs"),control=list(verbose=F))
inspect(sort(rules1))
summary(rules1)
rules.sorted=sort(rules1, by="confidence")
inspect(rules.sorted)
rules.sorted=sort(rules1, by="lift")
inspect(rules.sorted)


asso=read.table('보건복지_association_이슈.txt',header=T)
trans=as.matrix(asso,"Transaction")
rules1=apriori(trans,parameter=list(supp=0.01,conf=0.5), appearance=list(rhs=c("찬성", "반대"),
 default="lhs"),control=list(verbose=F))
inspect(sort(rules1))
summary(rules1)
rules.sorted=sort(rules1, by="confidence")
inspect(rules.sorted)
rules.sorted=sort(rules1, by="lift")
inspect(rules.sorted)


## 제한 규칙만 추출

rule_sub=subset(rules1,subset=confidence>=0.6)
inspect(sort(rule_sub,by="lift"))

## 제한 규칙만 추출

rule_sub=subset(rules1,subset=rhs%pin% 'Failure' & confidence>=0.31)
inspect(sort(rule_sub,by="lift"))



# 12.보건복지정책_키워드간 연관규칙
asso=read.table('보건복지_association_정책이슈.txt',header=T)
library(arules)
trans=as.matrix(asso,"Transaction")
rules1=apriori(trans,parameter=list(supp=0.002,conf=0.45,target="rules"))
inspect(sort(rules1))
summary(rules1)
rules.sorted=sort(rules1, by="confidence")
inspect(rules.sorted)
rules.sorted=sort(rules1, by="lift")
inspect(rules.sorted)

#install.packages("dplyr")
library(dplyr)
#install.packages("igraph")
library(igraph)

rules = labels(rules1, ruleSep="/", setStart="", setEnd="")
rules = sapply(rules, strsplit, "/",  USE.NAMES=F)
rules = Filter(function(x){!any(x == "")},rules)
rulemat = do.call("rbind", rules)
rulequality = quality(rules1)
ruleg = graph.edgelist(rulemat,directed=F)

 
#plot for important pairs 

ruleg = graph.edgelist(rulemat[-c(1:16),],directed=F)
plot.igraph(ruleg, vertex.label=V(ruleg)$name, vertex.label.cex=1, vertex.size=20, 
 layout=layout.fruchterman.reingold.grid)
 
savePlot("보건복지정책_키워드연관.png", type="png")


##  graph rule

#install.packages('MASS') 
library(MASS)
#install.packages("arulesViz")
library(arulesViz)

## 그래프기반 시각화(graphed-based visualization)

plot(rules1, method='graph',control=list(type='items'))

## 병렬좌표플롯(parallel coordinates plots) : 
  
plot(rules1, method='paracoord',control=list(reorder=T))

## 그룹화 행렬 기반시각화(grouped matrix-based visualizations)
  
plot(rules1, method='grouped')



