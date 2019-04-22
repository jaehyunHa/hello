## random forest korean(text file) positive / negative 분석(20161116)

rm(list=ls())
gc()
#install.packages("randomForest")
library(randomForest)
tdata = read.table('depression_Symptom_randomforest_korean.txt',header=T)
tdata.rf = randomForest(Attitude~., data=tdata,forest=FALSE,importance=TRUE)
importance(tdata.rf)
varImpPlot(tdata.rf, main='Random forest importance plot')
savePlot("Random_depression_1.png",type="png")


## random forest korean(text file) positive / negative 분석(DSM)(20161116)

rm(list=ls())
gc()
#install.packages("randomForest")
library(randomForest)
tdata = read.table('depression_DSM5_randomforest.txt',header=T)
tdata.rf = randomForest(Attitude~., data=tdata,forest=FALSE,importance=TRUE)
varImpPlot(tdata.rf, main='Random forest importance plot')
importance(tdata.rf)
savePlot("Random_depression_2.png.png",type="png")


##2. 의사결정나무분석 
## decision tree analysis (DSM5 positive_negative(total))
## (depression_DSM5_decisiontree.sav)


#install.packages('party')
library(party)
tdata=read.table('DSM5_decisiontree_positive_negative.txt',header=T)
ind=sample(2, nrow(tdata), replace=T,prob=c(0.5,0.5))
tr_data=tdata[ind==1,]
te_data=tdata[ind==2,]
i_ctree=ctree(Attitude~.,tr_data)
print(i_ctree)
plot(i_ctree)
savePlot("decision_tree_trdata.png",type="png")
i_ctree=ctree(Attitude~.,te_data)
print(i_ctree)
plot(i_ctree)
savePlot("decision_tree_tedata.png",type="png")
i_ctree=ctree(Attitude~.,tdata) # 전체 data
print(i_ctree)
plot(i_ctree)
savePlot("decision_tree_tdata.png",type="png")

# setwd("c:/미래신호_1부3장")
# tdata=read.table('DSM5_decisiontree_neutral_negative.txt',header=T)
# ind=sample(2, nrow(tdata), replace=T,prob=c(0.5,0.5))
# tr_data=tdata[ind==1,]
# te_data=tdata[ind==2,]
# i_ctree=ctree(Attitude~.,tr_data)
# print(i_ctree)
# plot(i_ctree)
# savePlot("decision_tree_neutral_negative.png",type="png")

## 의사결정나무 모형평가

#install.packages('party')
library(party)
tdata=read.table('DSM5_decisiontree_positive_negative.txt',header=T)
ind=sample(2, nrow(tdata), replace=T,prob=c(0.5,0.5))
tr_data=tdata[ind==1,]
te_data=tdata[ind==2,]
i_ctree=ctree(Attitude~.,tr_data)
ipredict=predict(i_ctree,tr_data)
table(tr_data$Attitude,ipredict)
i_ctree=ctree(Attitude~.,te_data)
ipredict=predict(i_ctree,te_data)
table(te_data$Attitude,ipredict)


##3.분류모형의 평가 
## 분류모형의 평가: 실제집단과 분류집단의 오분류표로 검정 

#install.packages('MASS') 
library(MASS)
rm(list=ls())
bayes_data = read.table('DSM5_decisiontree_86958.txt',header=T)
attach(bayes_data)
train_data=bayes_data[1:28986,]
test_data=bayes_data[28987:57972,]
group_data=Attitude[57973:86958]
train_data.lda=lda(Attitude~.,data=train_data)   #베이즈분류모형-사후확률은 사전확률로 예측가능 
# train_data.lda
ldapred=predict(train_data.lda, test_data)$class
classification=table(group_data, ldapred)
classification


##  평가지표 산출

perm_a=function(p1, p2, p3, p4) {pr_a=(p1+p4)/sum(p1, p2, p3, p4)
return(pr_a)} # 정확도
perm_a(24806, 513, 3528, 139)
perm_e=function(p1, p2, p3, p4) {pr_e=(p2+p3)/sum(p1, p2, p3, p4)
return(pr_e)} # 오류율
perm_e(24806, 513, 3528, 139)
perm_s=function(p1, p2, p3, p4) {pr_s=p1/(p1+p2)
return(pr_s)} # 민감도:0을 0으로 예측  
perm_s(24806, 513, 3528, 139)
perm_sp=function(p1, p2, p3, p4) {pr_sp=p4/(p3+p4)
return(pr_sp)} # 특이도:1을 1로 예측
perm_sp(24806, 513, 3528, 139)
perm_p=function(p1, p2, p3, p4) {pr_p=p1/(p1+p3)
return(pr_p)} # 정밀도: 0으로 예측(분류)한 것중에 실제 0인 비율 
perm_p(24806, 513, 3528, 139)


##4.연관분석 

##  depression DSM5 association rule(keyword-keyword)

install.packages("arules")
library(arules)
rm(list=ls())
asso=read.table(file='association_rule_DSM5_onlykey.txt',header=T)
trans=as.matrix(asso,"Transaction")
rules1=apriori(trans,parameter=list(supp=0.01,conf=0.01,target="rules"))
summary(rules1)
rules.sorted=sort(rules1, by="confidence")
inspect(rules.sorted)
rules.sorted=sort(rules1, by="lift")
inspect(rules.sorted)


## 우울증상 DSM5 제한규칙 출력

rule_sub=subset(rules1,subset=rhs%pin% 'DSM1' & confidence>=0.99)
inspect(sort(rule_sub,by="lift"))

## 우울증상 DSM5 제한규칙 출력

rule_sub=subset(rules1,subset=rhs%pin% 'DSM9' & confidence>=0.8)
inspect(sort(rule_sub,by="lift"))

## 우울증상 DSM5 제한규칙 출력

rule_sub=subset(rules1,subset=rhs%pin% 'DSM8' & confidence>=0.15)
inspect(sort(rule_sub,by="lift"))



## 증상 키워드간의 연관분석

#install.packages("arules")
library(arules)
asso=read.table('depression_Symptom_association_rule.txt',header=T)
trans=as.matrix(asso,"Transaction")
rules1=apriori(trans,parameter=list(supp=0.01,conf=0.666,target="rules"))
rules.sorted=sort(rules1, by="confidence")
inspect(rules.sorted)
rules.sorted=sort(rules1, by="lift")
inspect(rules.sorted)


##  SNA 

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
plot.igraph(ruleg, vertex.label=V(ruleg)$name, vertex.label.cex=1, 
            vertex.size=20,layout=layout.fruchterman.reingold.grid)
savePlot("depression_association_key.png", type="png")


## 연관규칙 산점도 작성(연관규칙의 산점도(scatter plot)는 이차원 좌표에 
#지지도(support),신뢰도(confidence), 향상도(lift)를 출력한다. 
#(x축은 지지도, y축은 신뢰도 출력되는 점들의 색상은 향상도로 짙을 수록 향상도가 높다.
  
  #install.packages("arulesViz")
  library(arulesViz)
  plot(rules1, measure=c('support','confidence'), shading='lift')
  
  
  
  ##  graph rule
  
  #install.packages("arulesViz")
  library(arulesViz)
  rules1=apriori(trans,parameter=list(supp=0.01,conf=0.6,target="rules"))
  
  
  ## 그래프기반 시각화(graphed-based visualization)
  
  plot(rules1, method='graph',control=list(type='items'))
  #원 크기 클수록 지지도 크고 짙을수록 향상도 큼
  
  ## 병렬좌표플롯(parallel coordinates plots) : 
  
  plot(rules1, method='paracoord',control=list(reorder=T))
  #굵을수록 지지도 크고 짙을수록 향상도 큼 
  
  ## 그룹화 행렬 기반시각화(grouped matrix-based visualizations)
  
  plot(rules1, method='grouped')
  #크기 클수록 지지도 크고 짙을수록 향상도 큼 
  
  ##  depression DSM5 association rule(keyword-dependent variable)
  
  #install.packages("arules")
  library(arules)
  rm(list=ls())
  asso=read.table(file='association_rule_DSM5.txt',header=T)
  trans=as.matrix(asso,"Transaction")
  rules1=apriori(trans,parameter=list(supp=0.001,conf=0.67), 
                 appearance=list(rhs= c("Positive","Neutral", "Negative"), 
                                 default="lhs"),
                 control=list(verbose=F))
  rules.sorted=sort(rules1, by="confidence")
  inspect(rules.sorted)
  rules.sorted=sort(rules1, by="lift")
  inspect(rules.sorted)
  
  ## 연관규칙 산점도 
  
  #install.packages("arulesViz")
  library(arulesViz)
  
  plot(rules1, measure=c('support','confidence'), shading='lift')
  
  ## 우울증상 DSM5 제한규칙 출력
  
  rules1=apriori(trans,parameter=list(supp=0.001,conf=0.01), appearance=list(rhs=
                                                                               c("Positive","Neutral", "Negative"), default="lhs"),control=list(verbose=F))
  rule_sub=subset(rules1,subset=rhs%pin% 'Positive' & confidence>=0.38)
  inspect(sort(rule_sub,by="lift"))
  
  ## 우울증상 DSM5 제한규칙 출력
  
  rule_sub=subset(rules1,subset=rhs%pin% 'Negative' & confidence>=0.67)
  inspect(sort(rule_sub,by="lift"))
  
  ## 우울증상 DSM5 제한규칙 출력
  
  rule_sub=subset(rules1,subset=rhs%pin% 'Neutral' & confidence>=0.15)
  inspect(sort(rule_sub,by="lift"))
  
  ##  우울증상 연관규칙(키워드와 종속변수 간 연관규칙)
  
  rm(list=ls())
  asso=read.table(file='depression_Symptom_dependentV.txt',header=T)
  #install.packages("arules")
  library(arules)
  trans=as.matrix(asso,"Transaction")
  rules1=apriori(trans,parameter=list(supp=0.001,conf=0.73), 
                 appearance=list(rhs= c("긍정", "보통", "부정"), default="lhs"),
                 control=list(verbose=F))
  rules.sorted=sort(rules1, by="confidence")
  inspect(rules.sorted)
  rules.sorted=sort(rules1, by="lift")
  inspect(rules.sorted)
  