
##1.텍스트 데이터의 시각화 
## 우울 워드클라우드 2016. 08. 17(depression_Symptom_randomforest.sav: 다중반응분석)

install.packages("wordcloud")
library(wordcloud)
key=c('소화장애', '호흡기장애', '혼란', '경련', '불안', '공포', '초조', 
      '충동','집중력','무기력', '자존감저하', '소외감', '외로움', '무관심',
      '무가치', '분노','통증', '체중','피로', '수면', '식욕', '죄책감',
      '슬픔', '적대', '지체', '상실','중독','더러움','학업스트레스','퉁명','자살')
freq=c(561, 118, 665, 113, 2307, 420, 2377, 336, 184, 647, 11, 351, 669,
       1074, 46, 2655, 1181, 431, 1436, 1105, 477, 1075, 1407, 272, 150, 992, 
       139, 6, 3626, 35, 3323)
library(RColorBrewer)
palete=brewer.pal(9,"Set1")
wordcloud(key,freq,scale=c(4,1),rot.per=.12,min.freq=1,
          random.order=F,random.color=T,colors=palete)
savePlot("우울_2012년_워드클라우드",type="png")


key=c('소화장애', '호흡기장애', '혼란', '경련', '불안', '공포', '초조', 
      '충동','집중력','무기력', '자존감저하', '소외감', '외로움', '무관심',
      '무가치', '분노','통증', '체중','피로', '수면', '식욕', '죄책감',
      '슬픔', '적대', '지체', '상실','중독','더러움','학업스트레스','퉁명','자살')
freq=c(572, 121, 579, 82, 2882, 307, 2481, 351, 268, 703, 16, 292, 624, 
       1054, 81, 2752, 1107, 435, 1424, 1082,498, 979, 1149, 395, 157, 865, 96, 
       5, 3651, 38, 2778)
library(RColorBrewer)
palete=brewer.pal(9,"Set1")
wordcloud(key,freq,scale=c(4,1),rot.per=.12,min.freq=1,
          random.order=F,random.color=T,colors=palete)
savePlot("우울_2013년_워드클라우드",type="png")


library(wordcloud)
key=c('소화장애', '호흡기장애', '혼란', '경련', '불안', '공포', '초조', 
      '충동','집중력','무기력', '자존감저하', '소외감', '외로움', '무관심',
      '무가치', '분노','통증', '체중','피로', '수면', '식욕', '죄책감',
      '슬픔', '적대', '지체', '상실','중독','더러움','학업스트레스','퉁명','자살')
freq=c(488, 120, 474, 87, 2280, 295, 2328, 215, 231, 723, 13, 282, 699, 
       782, 57, 2512, 1207, 337, 1226, 955, 432, 1039, 2217, 435, 141, 743, 
       55, 5, 4088, 30, 3452)
library(RColorBrewer)
palete=brewer.pal(9,"Set1")
wordcloud(key,freq,scale=c(4,1),rot.per=.12,min.freq=1,
          random.order=F,random.color=T,colors=palete)
savePlot("우울_2014년_워드클라우드",type="png")


key=c('소화장애', '호흡기장애', '혼란', '경련', '불안', '공포', '초조', 
      '충동','집중력','무기력', '자존감저하', '소외감', '외로움', '무관심',
      '무가치', '분노','통증', '체중','피로', '수면', '식욕', '죄책감',
      '슬픔', '적대', '지체', '상실','중독','더러움','학업스트레스','퉁명','자살')
freq=c(1621, 359, 1718, 282, 7469, 1022, 7186, 902, 683, 2073, 40, 925, 
       1992, 2910, 184, 7919, 3495, 1203, 4086,3142, 1407, 3093, 4773, 1102,
       448, 2600, 290, 16, 11365, 103, 9553)
library(RColorBrewer)
palete=brewer.pal(9,"Set1")
wordcloud(key,freq,scale=c(4,1),rot.per=.12,min.freq=1,
          random.order=F,random.color=T,colors=palete)
savePlot("우울_전체_워드클라우드",type="png")


## 2.시계열 데이터 시각화 2016. 8. 11

## KEM, KIM Map plot : 미래탐지_우울_20160727_우울제거.xls

rm(list=ls())
data_spss=read.table(file="depression_DoV.txt",header=T)
windows(height=5.5, width=5)
plot(data_spss$tf,data_spss$df,xlim=c(0,4000), ylim=c(-0.4,0.5), pch=18 , 
     col=8,xlab='average_term_frequency', ylab='time_weighted_increasing_rate',
     main='Keyword Emergence Map')
text(data_spss$tf,data_spss$df,label=data_spss$증상,cex=0.8, col='red')
abline(h=0.025, v=616, lty=1, col=4, lwd=0.5)
savePlot('우울_미래신호_DoV',type='png')


rm(list=ls())
data_spss=read.table(file="depression_DoD.txt",header=T)
windows(height=5.5, width=5)
plot(data_spss$tf,data_spss$df,xlim=c(0,4000), ylim=c(-0.4,0.5), pch=18 , 
     col=8,xlab='average_document_frequency', ylab='time_weighted_increasing_rate',
     main='Keyword Issue Map')
text(data_spss$tf,data_spss$df,label=data_spss$증상,cex=0.8, col='red')
abline(h=0.03, v=540, lty=1, col=4, lwd=0.5)
savePlot('우울_미래신호_DoD',type='png')


## Line plot 


## 시계열 데이터의 시각화
## 우울 시간 그래프(본 내용 사용)(col(1-6) 검정, 빨강, 초록, 파랑, 연파랑, 보라, 노랑, 회색)

rm(list=ls())
sex=read.csv("depression_time.csv",sep=",",stringsAsFactors=F)
a=sex$X2012년
b=sex$X2013년
c=sex$X2014년
d=sex$total
plot(a,xlab="",ylab="",ylim=c(0,12),type="o",axes=FALSE,ann=F,col=1)
title(main="청소년 우울 감정 시간별 버즈 현황",col.main=1,font.main=2) 
title(xlab="시간",col.lab=1)
title(ylab="버즈",col.lab=1)
axis(1,at=1:24,lab=c(sex$시간),las=2)
axis(2,ylim=c(0,12),las=2)
lines(b,col=2,type="o")
lines(c,col=3,type="o")
lines(d,col=4,type="o")
colors=c(1,2,3,4)
legend(18,12,c("2012년","2013년","2014년","Total"),
       cex=0.9,col=colors,lty=1,lwd=2)
savePlot("depression_time.png",type="png")

## 우울 월 그래프 시각화
sex=read.csv("depression_month.csv",sep=",",stringsAsFactors=F)
a=sex$X2012년
b=sex$X2013년
c=sex$X2014년
d=sex$total
plot(a,xlab="",ylab="",ylim=c(0,20),type="l",axes=FALSE,ann=F,col=1)
title(main="우울 월별 버즈 현황(청소년)",col.main=1,font.main=2) 
title(ylab="버즈(%)",col.lab=1)
axis(1,at=1:12,lab=c(sex$월),las=1)
axis(2,ylim=c(0,20),las=2)
lines(b,col=2,type="l")
lines(c,col=3,type="l")
lines(d,col=4,type="l")
colors=c(1,2,3,4,5)
legend(8,20,c("2012년","2013년","2014년","Total"),
       cex=0.9,col=colors,lty=1,lwd=2)
savePlot("depression_month",type="png")

## 청소년 우울증상 시각화

rm(list=ls())
f=read.csv("depression_Symptom_year.csv",sep=",",stringsAsFactors=F)
a=f$X2012년
b=f$X2013년
c=f$X2014년
d=f$Total
plot(a,xlab="",ylab="",ylim=c(0,12000),type="o",axes=FALSE,ann=F,col="red")
title(main="우울 증상 버즈 현황(청소년)",col.main=1,font.main=2) 
# title(ylab="버즈",col.lab=1)
axis(1,at=1:31,lab=c(f$우울증상),las=2)
axis(2,ylim=c(0,12000),las=2)
lines(b,col="black",type="o")
lines(c,col="blue",type="o")
lines(d,col="green",type="o")
colors=c("red","black","blue","green")
legend(19,11000,c("2012년","2013년","2014년","Total"),cex=0.9,col=colors,lty=1,lwd=2)
savePlot("depression_Symptom_year",type="png")

## 우울 시간_그래프.csv 작성 


#install.packages('catspec')
library(catspec)
#install.packages('foreign')
library(foreign)


## 이원분할표 작성: 교차분석(시간*년도)

data_spss=read.spss(file='depression_time.sav', use.value.labels=T,
                    use.missings=T,to.data.frame=T)
t1=ftable(data_spss[c('Hour','Year')])
ctab(t1,type='c')
tot=ftable(data_spss[c('Hour')])
ctab(tot,type='r')


##3.
## 우울 요일별 barplot 작성

rm(list=ls())
depression=read.table("depression_week.txt",header=T)
barplot(t(depression),main='우울 요일별 버즈 현황',ylab='버즈비율',
        ylim=c(0,100),col=rainbow(7),space=0.1,cex.axis=0.8,las=1, 
        names.arg=c('2012년','2013년','2014년','전체','범례'),cex=0.7)
       #t(객체의 table 읽음)/space:막대 간격/cex.axis:글자 크기/las=1:x축의 라벨을 수평으로 
legend(4.7,100,names(depression),cex=0.65,fill=rainbow(7))
      #범례 위치/범례의 항목 
savePlot("depression_week",type="png")

## heat colors 이용

barplot(t(depression),main='우울 요일별 버즈 현황',ylab='버즈비율',
        ylim=c(0,100),col=heat.colors(7),space=0.1,cex.axis=0.8,las=1, 
        names.arg=c('2012년','2013년','2014년','전체','범례'),cex=0.7)
legend(4.7,100,names(depression),cex=0.65,fill=heat.colors(7))

## gray colors 이용

barplot(t(depression),main='우울 요일별 버즈 현황',ylab='버즈비율',
        ylim=c(0,100),col=gray.colors(7),space=0.1,cex.axis=0.8,las=1, 
        names.arg=c('2012년','2013년','2014년','전체','범례'),cex=0.7)
legend(4.7,100,names(depression),cex=0.65,fill=gray.colors(7))


## 우울 연도별 barplot 작성

rm(list=ls())
depression=read.table("depression_year.txt",header=T)
barplot(t(depression),main='Depression(DSM5) Yearly buzz tracking',ylab='Buzz',
        ylim=c(0,100),col=rainbow(9),space=0.1,cex.axis=0.8,las=1,
        names.arg=c('2012Year','2013Year','2014Year','Total','Legend'),cex=0.7)
legend(4.7,100,names(depression),cex=0.65,fill=rainbow(9))
savePlot("depression_year",type="png")


## 우울 barPlot 그래프(막대그래프 작성: 옆으로 누운바)

rm(list=ls())
f=read.csv("depression_Symptom_freq.csv",sep=",",stringsAsFactors=F)
bp=barplot(f$Freqency, names.arg=f$Depression,main="Depression Symptom 
           buzz tracking",col=rainbow(31),xlim=c(0,12000),cex.names=0.7,
           col.main=1,font.main=2,las=1,horiz=T)
          #x축 변수 지정/x축 변수명 지정/col.main:제목 색상/horiz=T:수평 막대 그래프 
text(y=bp,x=f$Freqency*1,labels=paste(f$Freqency,'case'),
     col='black',cex=0.8)
    #y축의 변수 빈도를 수평바 위에 출력 
savePlot("depression_Symptom_freq",type="png")

## 이원분할표 작성(분할표, 카이제곱 검정)

#install.packages('catspec')
library(catspec)
#install.packages('foreign')
library(foreign)

data_spss=read.spss(file='depression_week.sav', 
                    use.value.labels=T,use.missings=T,to.data.frame=T)
t1=ftable(data_spss[c('year','week')])
ctab(t1,type='r')

##  week의 total % 분석
tot=ftable(data_spss[c('week')])
ctab(tot,type='r')


##4.
## 상자모양 시각화

## 우울 Boxplot

rm(list=ls())
data_spss=read.table("depression_boxplot.txt",header=T)

# col 인수: 박스내부 색갈 지정
# horizontal=T 는 수평 지정

boxplot(data_spss$DSM_S,col='red',main=NULL)
title('Boxplot of Depression')

boxplot(data_spss$DSM_S,col='red', horizontal=T, main=NULL)
title('Boxplot of Depression')

boxplot(DSM_S~Channel,col='red',data=data_spss)
title('Boxplot of Channel~Depresion')

boxplot(DSM_S~Attitude,col='red',data=data_spss)
title('Boxplot of Attitude~Depresion')



##4. 지리적  데이터
##지리적 데이터의 시각화

## 음란물 지도 시각화

## 지도 시각화전에 R 에서 사용하는 세계 행정지도 폴리곤 데이터를 다운로드 한다.
## 세계각국의 행정지도는 GADM(Global Administrative Area)에서 제공

#install.packages('sp')
library(sp)
windows(height=5.5, width=5)
gadm=readRDS("KOR_adm0.rds") 
plot(gadm)
gadm=readRDS("KOR_adm1.rds") 
plot(gadm)

## 시도별 행정지도 데이터 read

## 2012년 우울지도 

pop = read.table('depression_gadm.txt',header=T)
# gadm
pop_s = pop[order(pop$Code),]   #코드 순으로 정렬 
inter=c(200,220,250,300,350,400,430,450)  #버즈량ㅇ 7개 구간으로 설정 
pop_c=cut(pop_s$일차,breaks=inter)
gadm$pop=as.factor(pop_c)  
# heat.colors, topo.colors, cm,colors, terrain.colors, rainbow, diverge.colors, gray.colors
col=rainbow(length(levels(gadm$pop)))
col=rev(heat.colors(length(levels(gadm$pop))))
col=gray.colors(length(levels(gadm$pop)))
spplot(gadm, 'pop', col.regions=col, main='2012년 지역별 청소년 우울 위험')

## 2013년 우울지도 
pop = read.table('depression_gadm.txt',header=T)
pop_s = pop[order(pop$Code),]
inter=c(200,240,260,310,360,510,530,550)
pop_c=cut(pop_s$이차,breaks=inter)
gadm$pop=as.factor(pop_c)
col=rev(heat.colors(length(levels(gadm$pop))))
spplot(gadm, 'pop', col.regions=col, main='2013년 지역별 청소년 우울 위험')

## 2014년 우울지도 
pop = read.table('depression_gadm.txt',header=T)
pop_s = pop[order(pop$Code),]
inter=c(200,230,340,380,410,450,480,520)
pop_c=cut(pop_s$삼차,breaks=inter)
gadm$pop=as.factor(pop_c)
col=rev(heat.colors(length(levels(gadm$pop))))
spplot(gadm, 'pop', col.regions=col, main='2014년 지역별 청소년 우울 위험')

## 우울 연도별 비교

pop = read.table('depression_gadm.txt',header=T)

## 2012년
pop_s = pop[order(pop$Code),]
inter=c(200,220,250,300,350,400,430,450)
pop_c=cut(pop_s$일차,breaks=inter)
gadm$pop=as.factor(pop_c)
col=rev(heat.colors(length(levels(gadm$pop))))
p1=spplot(gadm, 'pop', col.regions=col, main='2012년 지역별 청소년 우울 위험')

##  2013년

inter=c(200,240,260,310,360,510,530,550)
pop_c=cut(pop_s$이차,breaks=inter)
gadm$pop=as.factor(pop_c)
col=rev(heat.colors(length(levels(gadm$pop))))
p2=spplot(gadm, 'pop', col.regions=col, main='2013년 지역별 청소년 우울 위험')

##  2014년

inter=c(200,230,340,380,410,450,480,520)
pop_c=cut(pop_s$삼차,breaks=inter)
gadm$pop=as.factor(pop_c)
col=rev(heat.colors(length(levels(gadm$pop))))
p3=spplot(gadm, 'pop', col.regions=col, main='2014년 지역별 청소년 우울 위험')

##  여러 객체 인쇄

print(p1,pos=c(0, 0.5, 0.5, 1), more=T)
print(p2,pos=c(0.5, 0.5, 1, 1), more=T)
print(p3,pos=c(0, 0, 0.5, 0.5), more=T)

## 시군구지역의 시각화

gadm=readRDS("KOR_adm2.rds") 
plot(gadm)
gadm


##6.소셜 네트워크 분석 
## 우울 증상 SNA(키워드간의 연관분석) : 시각화 패키지(igraph, arulesViz)

#install.packages("arules")
library(arules)
#install.packages("dplyr")
library(dplyr)
#install.packages("igraph")
library(igraph)


asso=read.table('depression_Symptom_association_rule.txt',header=T)
trans=as.matrix(asso,"Transaction")
rules1=apriori(trans,parameter=list(supp=0.01,conf=0.63,target="rules"))

## inspect()함수는 lhs, rhs, support, confidence, lift 값을 출력한다.
## lhs(left-hand-side)로 선행(antecedent)을 의미하며, rhs(right-hand-side)의 약자로 후항(consequent)을 의미한다.

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


#plot for important pairs 

ruleg = graph.edgelist(rulemat[-c(1:16),],directed=F)
plot.igraph(ruleg, vertex.label=V(ruleg)$name, vertex.label.cex=0.8, 
            vertex.size=17, layout=layout.fruchterman.reingold.grid)

savePlot("depression_Symptom_SNA", type="png")

## 제한규칙 시각화(학업스트레스)


asso=read.table('depression_Symptom_association_rule.txt',header=T)
trans=as.matrix(asso,"Transaction")
rules1=apriori(trans,parameter=list(supp=0.01,conf=0.01,target="rules"))
rule_sub=subset(rules1,subset=rhs%pin% '학업스트레스' & lift>=4.5)
rules1=rule_sub
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
ruleg = graph.edgelist(rulemat[-c(1:16),],directed=F)
plot.igraph(ruleg, vertex.label=V(ruleg)$name, vertex.label.cex=1, 
            vertex.size=20,layout=layout.fruchterman.reingold.grid)

## 제한규칙 시각화(자살)


asso=read.table('depression_Symptom_association_rule.txt',header=T)
trans=as.matrix(asso,"Transaction")
rules1=apriori(trans,parameter=list(supp=0.01,conf=0.01,target="rules"))
rule_sub=subset(rules1,subset=rhs%pin% '자살' & lift>=3)
rules1=rule_sub
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
ruleg = graph.edgelist(rulemat[-c(1:16),],directed=F)
plot.igraph(ruleg, vertex.label=V(ruleg)$name, vertex.label.cex=1, 
            vertex.size=20,layout=layout.fruchterman.reingold.grid)

##  graph rule

rules1=apriori(trans,parameter=list(supp=0.01,conf=0.6,target="rules"))
#install.packages("arulesViz")
library(arulesViz)

## 그래프기반 시각화(graphed-based visualization)

plot(rules1, method='graph',control=list(type='items'))
