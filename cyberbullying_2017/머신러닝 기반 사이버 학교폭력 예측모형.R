##1.
#머신러닝(기계학습): 인공지능의 한 분야로 컴퓨터가 학습할 수 있도록 하는 알고리즘과 기술 개발하는 
#분야, 컴퓨터가 인간의 지능적 행동을 모방할 수 있도록 함
#기존의 데이터를 학습해 그 속성을 기반으로 새로운 데이터에 대한 예측값 찾는 것이 목적(확률&데이터)

#데이터 마이닝: 대량의 데이터 집합에서 유용한 정보를 추출하는 것(분류, 군집화, 연관성, 연속성, 예측)
#기존의 데이터에서 속성을 발견하여 통계적 규칙이나 패턴 찾는 것이 목적

#딥러닝: 머신러닝 알고리즘 중 은닉층이 많은 다층신경망 

#학습방법: 지도학습/비지도학습(자율학습)/강화학습(시행착오 통해 보상을 받아 행동 패턴 학습)
#예측모형 개발 위해선 1)입력변수/출력변수가 범주형/연속형 데이터인지 결정
#2)입력변수의 수 결정- 변수 너무 많아지면 특정 변수에 대한 자료 수 적은 경우 예측 성능 떨어짐 


##2. 학습 데이터
#종속변수-사이버 학교폭력에 대한 감정(긍/부정), 유형(가해자, 피해자, 방관자, 복합형)
#독립변수-agnew의 일반긴장이론(GST):긴장/신체적 원인/피해심리/자아통제/애착/열정/가해심리/비행


##3.머신러닝 기반 사이버 학교폭력 예측모형 개발

#1. Naive bayes 분류모형
#사후확률은 사전확률을 통해 예측할 수 있다는 베이즈 정리를 기반으로 한 분류기로
#속성이 많은 데이터의 경우 단순화시켜 실시간 예측과 같이 빠르게 판단할 때 사용
#장점:훈련데이터가 적어도 사용 가능/ multi-class에서 쉽고 빠르게 예측 가능
#단점: train data에는 없고 test data에 있는 범주에서는 확률이 0으로 나타나므로 분자에 +1 해주는
#laplace smoothing 방법 사용/서로 확률적으로 독립이라는 가정 위반되는 경우 오류 발생
#EX)스팸메일, 질병의 예측 

#1)사이버 학교폭력 위험(부정, 긍정) 예측모형
#변수 초기화 
rm(list=ls())
setwd("c:/cyberbullying_2017")
#writing 함수 사용 위해 
#install.packages('MASS') 
#나이브 베이지안 사용 위해 
library(MASS)
#install.packages('e1071') 
library(e1071)
#훈련데이터
tdata = read.table('cyberbullying_attitude_N.txt',header=T)
#모델링을 위해서 변수들을 파일로 가져오는 것 
#함수식을 고정시키면 유동성이 없기 때문 
input=read.table('input_GST.txt',header=T,sep=",")
output=read.table('output_attitude.txt',header=T,sep=",")
#긍정과 부정 변수를 받기 위한 변수 
p_output=read.table('p_output_bayes.txt',header=T,sep=",")

#콤마 없애고 변수를 vector로 받기 위한 코드 
input_vars = c(colnames(input))
output_vars = c(colnames(output))
p_output_vars = c(colnames(p_output))

#함수식 (종속변수~독립변수) 
#긴장요인(gst) 변수만 요약해서 만듦(8가지)
form = as.formula(paste(paste(output_vars, collapse = '+'),'~', 
                        paste(input_vars, collapse = '+'))) 
form

#user define name(변수)= 함수/인수/변수 
train_data.lda=naiveBayes(form,data=tdata)
#훈련데이터에 0이 있을 경우 방지 위해 분모에 +1 해줌(laplace=1)  
#train_data.lda=naiveBayes(form,data=tdata, laplace=1)

#예측         ai       / 훈련데이터 / 확률값 산출(cf)class는 분류)
#독립변수만으로 예측된 종속변수 
p=predict(train_data.lda, tdata, type='raw')
#예측된 종속변수의 확률값을 긍정/부정 변수에 할당 
dimnames(p)=list(NULL,c(p_output_vars))
#예측확률값의 기술통계 
summary(p)

#메모리는 속도 빠름
#머신러닝은 in-memory 방식 사용해야함(c드라이브는 느림)
#pred_obs = cbind(tdata,p)
#write.matrix(pred_obs, 'cyberbullying_attitude_naive.txt') => MASS 패키지
#긍정(0) 평균예측확률:50.65% / 부정: 49.35%

#-2) 사이버 학교폭력 유형 예측모형(가해자, 피해자, 방관자, 복합형)
rm(list=ls())
tdata = read.table('cyberbullying_type_N.txt',header=T)
input=read.table('input_GST.txt',header=T,sep=",")
output=read.table('output_type.txt',header=T,sep=",")
p_output=read.table('p_output_type.txt',header=T,sep=",")

input_vars = c(colnames(input))
output_vars = c(colnames(output))
p_output_vars = c(colnames(p_output))

form = as.formula(paste(paste(output_vars, collapse = '+'),'~', 
                        paste(input_vars, collapse = '+'))) 
form

train_data.lda=naiveBayes(form,data=tdata)

#예측         ai       / 훈련데이터 / 확률값 산출(cf)class는 분류)
p=predict(train_data.lda, tdata, type='raw')
dimnames(p)=list(NULL,c(p_output_vars))
#예측확률값의 기술통계 
summary(p)
#가해자 평균 예측확률: 12.17%, 피해자: 69.44%, 방관자: 9.12%, 복합형: 9.26%


#2 logistic regression modeling(attitude)
#독립변수는 양적 변수, 종속변수는 다변량 변수를 가지는 비선형 회귀모형
#회귀모형의 적합도 검정은 사건발생 가능성을 크게하는 확률인 우도비를 최대화하는 최대우도추정법을 사요
#독립변수가 종속변수에 미치는 영향을 승산의 확률인 오즈비로 검정(p(1)/p(0))
#회귀계수는 승산율의 변화를 추정하는 것으로 결괏값의 엔티로그 취해 해석 

rm(list=ls())
#setwd("c:/cyberbullying_2017")
tdata = read.table('cyberbullying_attitude_N.txt',header=T)
input=read.table('input_GST.txt',header=T,sep=",")
output=read.table('output_attitude.txt',header=T,sep=",")
p_output=read.table('p_output_bayes.txt',header=T,sep=",")

input_vars = c(colnames(input))
output_vars = c(colnames(output))

form = as.formula(paste(paste(output_vars, collapse = '+'),'~', 
                        paste(input_vars, collapse = '+')))
form

#이분형 로지스틱 회귀 cf)다항 로지스틱 회귀-multinom
i_logistic=glm(form, family=binomial,data=tdata)
summary(i_logistic)

#                                 확률값 
p=predict(i_logistic,tdata,type='response')
#긍정의 예측 확률가
mean(p)값
#긍정 평균: 54.68%/ 부정: 45.32%

pred_obs = cbind(tdata, p)
write.matrix(pred_obs,'cyberbullying_attitude_logistic.txt')

m_data <- read.table('cyberbullying_attitude_logistic.txt', header = T)
mean(p)


#3 random forests modeling(attitude)
#여러 개의 예측모형을 만든 후, 그것을 결합해 하나의 최종 예측모형을 만드는 앙상블 기법
#분류 정확도가 우수, 이상치에 둔감, 계산 빠르다는 장점
#배깅은 의사결정나무의 단점인 첫 번째 분리변수가 바뀌면 최종 의사결정나무가 완전히 달라져 예측력
#저하를 가져오고 예측모형의 해석을 어렵게 만드는 불안정한 학습방법을 제거해 예측력 향상시키기 위한 방법 
#변수에 대한 중요도 지수를 제공하며 특정 변수를 포함할 때 예측오차가 줄어드는 정도를 보여줌
#incMSE-정확도 / IncNodePurity-중요

rm(list=ls())
#setwd("c:/cyberbullying_2017")
#install.packages("randomForest")
library(randomForest)

tdata = read.table('cyberbullying_attitude_N.txt',header=T)
input=read.table('input_GST.txt',header=T,sep=",")
output=read.table('output_attitude.txt',header=T,sep=",")

# random forests modeling
input_vars = c(colnames(input))
output_vars = c(colnames(output))

form = as.formula(paste(paste(output_vars, collapse = '+'),'~', 
                        paste(input_vars, collapse = '+')))
form

#정확도와 중요도에 대한 값 도출해줌
#분류에 가장 중요한 변수가 무엇인지 알기 위한 것 
tdata.rf = randomForest(form, data=tdata ,forest=FALSE,importance=TRUE)
p=predict(tdata.rf, tdata)
mean(p)
#긍정의 평균 54.68%

#애착(attachment)이 attitude에 가장 영향 미치는 요인 - 중요도 그림 
varImpPlot(tdata.rf, main='Random forest importance plot')



#4 decision trees modeling(attitude)
#결정규칙에 따라 나무구조로 도표화하여 분류/예측하는 방법으로 판별분석과 회귀분석을 조합한 
#데이터 마이닝 기법
#어떤 예측변수가 목표변수를 설명하는 데 더 중요한지, 여러 변수가 결합해 목표변수에 어떤 영향주는지
#쉽게 알 수 있는 것이 장점 
#알고리즘- CHAID, CRT, QUEST

rm(list=ls())
#setwd("c:/cyberbullying_2017")
#install.packages('party')
library(party)

tdata = read.table('cyberbullying_attitude_N.txt',header=T)
input=read.table('input_GST.txt',header=T,sep=",")
output=read.table('output_attitude.txt',header=T,sep=",")
p_output=read.table('p_output_decision.txt',header=T,sep=",")

# decision trees modeling

input_vars = c(colnames(input))
output_vars = c(colnames(output))
p_output_vars = c(colnames(p_output))

form = as.formula(paste(paste(output_vars, collapse = '+'),'~', 
                        paste(input_vars, collapse = '+')))
form

#crt 알고리즘 사용 
i_ctree=ctree(form,tdata)
p=predict(i_ctree,tdata)
dimnames(p)=list(NULL,c(p_output_vars))
mean(p)
#긍정 54.68%
pred_obs = cbind(tdata, p)
write.matrix(pred_obs,'cyberbullying_attitude_decision.txt')
mydata1=read.table('cyberbullying_attitude_decision.txt',header=T)
attach(mydata1)
mean(mydata1$p_Attitude)

#중요한 요인 5개에 대해 의사결정분석 
rm(list=ls())
#install.packages('partykit')
library(partykit)

tdata = read.table('cyberbullying_attitude_N.txt',header=T)
input=read.table('input_GST_DT.txt',header=T,sep=",")
output=read.table('output_attitude.txt',header=T,sep=",")

# decision trees modeling

input_vars = c(colnames(input))
output_vars = c(colnames(output))

form = as.formula(paste(paste(output_vars, collapse = '+'),'~', 
                        paste(input_vars, collapse = '+')))
form

#crt 알고리즘 사용 
i_ctree=ctree(form,tdata)
print(i_ctree)
plot(i_ctree, gp=gpar(fontsize=6))
#애착이 사이버폭력 위험 감정에 가장 영향력이 큼 



#5 neural networks modeling nnet(attitude)
#신경망 모형은 학습데이터로부터 신호를 받아 입력값이 특정 분계점에 도달하면 출력 발생함
#퍼셉트론: 단층신경망, 선형문제만 풀 수 있음
#딥러닝: 입력층과 출력층 사이에 은닉층을 도입한 것
#즉 신경망은 입력값을 받아 합성함수를 마들고 활성함수를 이용해 출력값을 발생시킴
#활성함수 중 시그모이드 함수는 입력값으 0~1 사이의 값으로 변환시켜 입력변수 값이 아주 크거나
# 작아도 출력변수에 영향을 거의 주지 않아 많이 사용됨
#고려할 점: 1)입력변수 값의 범위 결정(범주형-일정 빈도 필요/연속형-범주형 or 0~1 사이로 변환)
#           2)은닉과 은닉노드 너무 많으면 overfitting, 은닉층은 하나로, 은닉노드 수는 충분히 하여
#           하나씩 줄여가며 분류 정확도 높으며 은닉노드 수 적은 모형 선택 

gc()
rm(list=ls())
#setwd("c:/cyberbullying_2017")
#install.packages("nnet")
library(nnet)
#install.packages('MASS') 
library(MASS)

tdata = read.table('cyberbullying_attitude_N.txt',header=T)
input=read.table('input_GST.txt',header=T,sep=",")
output=read.table('output_attitude.txt',header=T,sep=",")

input_vars = c(colnames(input))
output_vars = c(colnames(output))

form = as.formula(paste(paste(output_vars, collapse = '+'),'~', 
                        paste(input_vars, collapse = '+')))
form

#뉴런 수 결정 => 평가를 통해 결정(3부터 5, 7 등으로 사용)
#평가를 통해 정확도를 비교 가장 좋은 것 사용 
tr.nnet = nnet(form, data=tdata, size=5) #은닉층 5개 
p=predict(tr.nnet, tdata, type='raw')
mean(p)
#긍정 54.77%
mydata=cbind(tdata, p)
write.matrix(mydata,'cyberbullying_attitude_neural.txt')

mydata1=read.table('cyberbullying_attitude_neural.txt',header=T)
attach(mydata1)
mean(p)

#install.packages('NeuralNetTools')
library(NeuralNetTools)
plotnet(tr.nnet)



#6 support vector machines modeling(attutude)
#지도학습 머신러닝의 일종으로 분류와 회귀에 모두 사용
#로지스틱 회귀는 입력값이 주어졌을 때 출력값에 대한 조건부 확률을 추정하지만
#svm은 확률 추정하지 않고 분류 결과에 대한 예측만 하여 분류 효율에 있어예측력이 전반적으로 높음
#두 초평면에서 두 집단 경계에 있는 데이터의 거리의 차가 최대(오분류 최소)로 하는 모형 결정 

rm(list=ls())
#setwd("c:/cyberbullying_2017")
library(e1071)
library(caret)
library(kernlab)

tdata = read.table('cyberbullying_attitude_N.txt',header=T)
input=read.table('input_GST.txt',header=T,sep=",")
output=read.table('output_attitude.txt',header=T,sep=",")

# SVM modeling

input_vars = c(colnames(input))
output_vars = c(colnames(output))
form = as.formula(paste(paste(output_vars, collapse = '+'),'~', 
                        paste(input_vars, collapse = '+')))
form

# If you run it, you'11 have to spend about 'time: 2.75 hours'
#svm.model=svm(form,data=tdata,kernel='radial')
summary(svm.model)

# If you run it, you'11 have to spend about 'time: 15 minutes'
p=predict(svm.model,tdata)
#overfitting 됨 
mean(p) 
#긍정 57.3%
mydata=cbind(tdata, p)
write.matrix(mydata,'cyberbullying_attitude_SVM.txt')



#7 association analysis
#비지도학습, 변수들 간의 의미 있는 관계를 탐색하기 위한 방법으로 통계적 과정없이 연관규칙 찾음 
#지지도: 전체 문서에서 해당 연관규칙에 해당하는 데이터 비율, 자주 발생하지 않는 규칙 제거
#신뢰도: 단어 X 포함하는 문서 중 단어 Y도 포함하는 비율, 단어들의 연관성 정도 파악
#향상도: 단어 X가 없을 때 대비 있을 때 단어 Y의 확률의 증가율, 발생비율 
#apriori principle 알고리즘 사용 

# keyword to keyword association analysis
#지지도, 신뢰도로 규칙을 제한
#향상도로 평가함(lift)

rm(list=ls())
#setwd("c:/cyberbullying_2017")
#install.packages("arules")
library(arules)

cyber_bullying=read.table(file='cyberbullying_type_association.txt',header=T)
attach(cyber_bullying)
cyber_bullying_asso=cbind(Access_entertainment_facilities,Smoking,Drinking,
                          Drug,Run_away,Gambling,Crime,Pregnant,Sexual_violence,Sex,
                          Absence_without_leave,Student_violence)
#0,1로 이뤄진 행렬로 만들기 위해 
cyber_bullying_trans=as.matrix(cyber_bullying_asso,"Transaction")
#apriori
rules1=apriori(cyber_bullying_trans,parameter=list(supp=0.01,conf=0.01,
                                                   target="rules"))
summary(rules1)
#sorting 
rules.sorted=sort(rules1, by="confidence")
inspect(rules.sorted)
rules.sorted=sort(rules1, by="lift")
inspect(rules.sorted)
#학교폭력이 있을 때 무단결석할 확률이 학교폭력이 없을 때 보다 무단결석할 확률이 높다 



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

# plot for important pairs 

ruleg = graph.edgelist(rulemat[-c(1:16),],directed=F)
plot.igraph(ruleg, vertex.label=V(ruleg)$name, vertex.label.cex=0.9, 
            vertex.size=12, layout=layout.fruchterman.reingold.grid)

# visualization (parallel coordinates plots) 

#install.packages("arulesViz")
library(arulesViz)
plot(rules1, method='paracoord',control=list(reorder=T))
#선 굵기는 지지도에 비례, 색상의 농담은 향상도 크기에 비례 


# keyword to dependent association analysis
#(키워드(비행요인)와 종속변수(학교폭력 유형)) 간 연관분석 

rm(list=ls())
#setwd("c:/cyberbullying_2017")
#install.packages("arules")
library(arules)

cyber_bullying=read.table(file='cyberbullying_type_association.txt',header=T)
attach(cyber_bullying)
cyber_bullying_asso=cbind(Perpetrator,Victim,Bystander,Complex,
                          Access_entertainment_facilities,Smoking,Drinking,
                          Drug,Run_away,Gambling,Crime,Pregnant,Sexual_violence,Sex,
                          Absence_without_leave,Student_violence)
trans=as.matrix(cyber_bullying_asso,"Transaction")  ##
rules1=apriori(trans,parameter=list(supp=0.002,conf=0.01), appearance=list
               (rhs=c("Perpetrator"), default="lhs"),control=list(verbose=F))

rules.sorted=sort(rules1, by="confidence")
inspect(rules.sorted)
rules.sorted=sort(rules1, by="lift")
inspect(rules.sorted)




#군집 분석 
#동일 집단에 속해 있는 개체들의 유사성에 기초해 집단을 몇 개의 동질적인 군집으로 분류
#모형 생성하지 않고 유사한 데이터 모으는 과정만 실시하는 인스턴스 기반 학습기, 비지도학습 
#연구자가 군집수 지정하는 비계층적 군집분석(k-means)/가까운 대상 순차적으로 묶어가는 계층적 군집분석 
#k-means 군집 수 결정: 1)스크리 도표 이용해 급격한 경사 보이는 곳
#  2)여러 군집 수 비교하여 가장 적절한 군집수 결정 

#ex)백화점 매출에 기여한 집합군이 무엇인지 궁금 
#ex)통신사(통신사 탈락률 낮추기 위해) /탈락률 높은 사람만 분석해서 탈락하지 않도록 
#군집의 수 결정이 중요(여러번 학습하며 반복적으로 보이는 것으로 선택) 

#8 cluster analysis(file: cyber_bullying_cluster.sav)

rm(list=ls())
#setwd("c:/cyberbullying_2017")
cyberbullying=read.table(file="cyberbullying_cluster_type.txt",header=T)
attach(cyberbullying)

clust_data=cbind(Strain,Physical,Victim_psychology,Self_control,Attachment,
                 Passion,Offender_psychology,Delinquency)

#군집 내 편차 계산 
noc=(nrow(clust_data)-1)*sum(apply(clust_data, 2, var))
for (i in 2:8)
  noc[i]=sum(kmeans(clust_data, center=i)$withinss)

#스크리도표 =>군집 수 5개 
plot(noc, type='b', pch=19, xlab='Number of Clusters',
     ylab='Within groups sum of squares')

# K-Means Cluster Analysis
fit = kmeans(clust_data, 5) # 5 cluster solution
fit
#cluster means가 0.3 이상인 요인 군집에 포함 

# get cluster means 
# aggregate(kmean_data,by=list(fit$cluster),FUN=mean)
# append cluster assignment
kmean_data=data.frame(cyberbullying, fit$cluster) 
library(MASS)
write.matrix(kmean_data, "cyber_bullying_kmean_cluster.txt")


##4. 머신러닝 모형 평가
#각각의 데이터마다 알고리즘의 특성이 다르므로 가장 잘 맞추는 것 평가(특이도/민감도/정확도)
#ex)암 검진-민감도가 중요
#prediction() 함수 사용 

#1)실제 분류와 예측 분류의 오분류표 측정 
#정확도: 전체 중 올바르게 분류된 비율 
#민감도: 0(부정)을 0이라고 한 비율
#특이도: 1(긍정)을 1이라고 한 비율 
#정밀도: 0이라고 한 것 중 실제 0인 비율 

#1)나이브 베이즈 분류모형 평가
rm(list=ls())
library(e1071)
tdata = read.table('cyberbullying_attitude_S.txt',header=T)
input=read.table('input_GST.txt',header=T,sep=",")
output=read.table('output_attitude.txt',header=T,sep=",")

input_vars = c(colnames(input))
output_vars = c(colnames(output))

form = as.formula(paste(paste(output_vars, collapse = '+'),'~', 
                        paste(input_vars, collapse = '+'))) 
form

ind = sample(2, nrow(tdata), replace = T, prob = c(0.5,0.5))
tr_data = tdata[ind==1,]
te_data = tdata[ind==2,]

#모형함수(분류기) 만들기
train_data.lda = naiveBayes(form, data=tr_data)
#모형 예측 
ldapred=predict(train_data.lda, te_data, type = 'class')

table(te_data$Attitude, ldapred, dnn=c("Actual","Prediction"))

perm_a=function(p1, p2, p3, p4){pr_a=(p1+p4)/sum(p1, p2, p3, p4)
                                      return (pr_a)}
perm_a(24494, 9903, 12412, 29232)   #정확도

perm_e=function(p1, p2, p3, p4){pr_a=(p2+p3)/sum(p1, p2, p3, p4)
return (pr_a)}

perm_e(24494, 9903, 12412, 29232)   #오류율 

perm_s=function(p1, p2, p3, p4){pr_a=(p1)/sum(p1, p2)
return (pr_a)}
perm_s(24494, 9903, 12412, 29232)   #민감도 

perm_sp=function(p1, p2, p3, p4){pr_a=(p4)/sum(p3, p4)
return (pr_a)}
perm_sp(24494, 9903, 12412, 29232)   #특이도

perm_p=function(p1, p2, p3, p4){pr_a=(p1)/sum(p1, p3)
return (pr_a)}
perm_p(24494, 9903, 12412, 29232)   #정밀도 


#2)ROC 곡선을 이용한 모형 평가 
#ROC 커브/AUC 통계량 클수록 예측력이 우수한 분류기라고 할 수 있음 

#-1)나이브 베이지안 ROC
rm(list=ls())
library(MASS)
library(e1071)
library(ROCR)

tdata = read.table('cyberbullying_attitude_N.txt',header=T)
#모델링을 위해서 변수들을 파일로 가져오는 것 
#함수식을 고정시키면 유동성이 없기 때문 
input=read.table('input_GST.txt',header=T,sep=",")
output=read.table('output_attitude.txt',header=T,sep=",")
#예측확률 긍정과 부정 변수를 받기 위한 변수 
p_output=read.table('p_output_bayes.txt',header=T,sep=",")

input_vars = c(colnames(input))
output_vars = c(colnames(output))
p_output_vars = c(colnames(p_output))

form = as.formula(paste(paste(output_vars, collapse = '+'),'~', 
                        paste(input_vars, collapse = '+'))) 
form

ind = sample(2, nrow(tdata), replace = T, prob = c(0.5,0.5))
tr_data = tdata[ind==1,]
te_data = tdata[ind==2,]

train_data.lda = naiveBayes(form, data=tr_data)
 
p=predict(train_data.lda, te_data, type='raw')
#예측된 종속변수의 확률값을 긍정/부정 변수에 할당 
dimnames(p)=list(NULL,c(p_output_vars))
#예측확률값의 기술통계 
summary(p)
mydata=cbind(te_data,p)
library(MASS)
write.matrix(mydata, 'naive_bayes_cyberbullying_ROC.txt')

mydata1=read.table('naive_bayes_cyberbullying_ROC.txt', header = T)
#attach(mydata1)
attach(mydata)
#실제집단과 예측집단을 이용해 tdata의 Attitude의 추정치 예측
pr=prediction(posterior.1, te_data$Attitude)
bayes_prf=performance(pr, measure = 'tpr', x.measure = 'fpr')
#auc 곡선의 성능 평가 
auc = performance(pr, measure = 'auc')
auc_bayes=auc@y.values[[1]]
#auc 통계량 
auc_bayes
plot(bayes_prf, col=1, lty=1, lwd=1.5, main="ROC Curver for ML Models")
#ROC 곡선 기준
abline(0,1, lty=3)


#-2)뉴럴 네트워크
library(nnet)
attach(tdata)
tr.nnet=nnet(form, data=tr_data,size=5)
p=predict(tr.nnet, te_data, type='raw')
pr = prediction(p, te_data$Attitude)
neural_prf=performance(pr, measure = 'tpr', x.measure = 'fpr')
#x축 값(fpr)을 neural_x에 할당 
neural_x=unlist(attr(neural_prf, 'x.values'))
neural_y=unlist(attr(neural_prf, 'y.values'))

auc=performance(pr, measure = 'auc')
auc_neural=auc@y.values[[1]]
auc_neural
lines(neural_x, neural_y, col=2, lty=2)

#-3)로지스틱 회귀
i_logistic=glm(form, family = binomial, data=tr_data)
p=predict(i_logistic, te_data, type='response')
pr = prediction(p, te_data$Attitude)
lo_prf=performance(pr, measure = 'tpr', x.measure = 'fpr')
lo_x=unlist(attr(lo_prf, 'x.values'))
lo_y=unlist(attr(lo_prf, 'y.values'))

auc=performance(pr, measure = 'auc')
auc_lo=auc@y.values[[1]]
auc_lo
lines(lo_x, lo_y, col=3, lty=3)

#-4)svm  ##실행하지 말 ㄱ
library(e1071)
library(caret)
library(kernlab)
svm.model = svm(form, data=tr_data, kernel='radial')
p=predict(svm.model, te_data)
pr = prediction(p, te_data$Attitude)
svm_prf=performance(pr, measure = 'tpr', x.measure = 'fpr')
svm_x=unlist(attr(svm_prf, 'x.values'))
svm_y=unlist(attr(svm_prf, 'y.values'))

auc=performance(pr, measure = 'auc')
auc_svm=auc@y.values[[1]]
auc_svm
lines(svm_x, svm_y, col=4, lty=4)

#-5)랜덤 포레스트
library(randomForest)
tdata.rf = randomForest(form, data=tr_data, forest=False, importance=TRUE)
p=predict(tdata.rf, te_data)
pr = prediction(p, te_data$Attitude)
ran_prf=performance(pr, measure = 'tpr', x.measure = 'fpr')
ran_x=unlist(attr(ran_prf, 'x.values'))
ran_y=unlist(attr(ran_prf, 'y.values'))

auc=performance(pr, measure = 'auc')
auc_ran=auc@y.values[[1]]
auc_ran
lines(ran_x, ran_y, col=5, lty=5)

#-6)의사결정나무
library(party)
i_ctree=ctree(form, tr_data)
p=predict(i_ctree, te_data)
pr=prediction(p, te_data$Attitude)
tree_prf = performance(pr, measure='tpr', x.measure='fpr')
tree_x=unlist(attr(tree_prf, 'x.values'))
tree_y=unlist(attr(tree_prf, 'y.values'))
auc=performance(pr, measure='auc')
auc_tree = auc@y.values[[1]]
auc_tree
lines(tree_x, tree_y, col=6, lty=6)

legend('bottomright', legend=c('naive=',auc_bayes, 'neural=',auc_neural, 'logistics=', auc_lo,
                               'random=', auc_ran),
       cex=0.7)


##5. 시각화
#1)텍스트 데이터 -워드 클라우드
#2)시계열 데이터- 선그래프(plot), 막대그래프(barplot)

#사이버 학교폭력 비행과 긴장요인의 미래신호 탐색 시각화
rm(list=ls())
cyberbullying=read.table(file='긴장비행_DOV_학교폭력.txt', header=T)
windows(height = 8.5, width=8)
plot(cyberbullying$tf, cyberbullying$df, xlim=c(0,11500), ylim=c(-1, 1.5), pch=18,
     col=8, xlab='average_term_frequency', ylab='time_weigted_increasing_rate',
     main='keyword emergency map')

text(cyberbullying$tf, cyberbullying$df, labels = cyber_bullying$학교폭력, cex=0.8, col='red')

abline(h=0.206, v=712, lty=1, col=4, lwd=0.5)
#강신호, 강하지만 증가율 낮은 신호, 잠재신호, 약신호 


#사이버 학교폭력 시간별 문서현황 시각화
rm(list=ls())
cyber=read.csv('cyberbullying_time.csv', sep=",", stringsAsFactors = F)
a=cyber$X2013
b=cyber$X2014
c=cyber$X2015
d=cyber$X2016
e=cyber$total
#axes : x, y축 표시 안함/ann=F: x, y축 제목 표시 안함
plot(a, xlab="", ylab="", ylim=c(0,12), type="o", axes=FASLE, ann=F, col=1)
title(main = '사이버 학교폭력 시간별 문서 현황', col.main=1, font.main=2)
title(xlab = '시간', col.lab=1)
title(ylab = '버즈', col.lab=1)
#축지정위(1:x, 2:y)/ x축 범위/   /1:수평, 2:수직 
axis(1, at=1:24, lab=c(cyber$시간), las=2)
axis(2, ylim=0:12, las=2)

lines(b,col=2, type="o")
lines(c,col=3, type="o")
lines(d,col=4, type="o")
lines(e,col=5, type="o")
colors=c(1,2,3,4,5)
legend(18, 1, c("2013", "2014", "2015", "2016", "total"), cex=0.9, col=colors, lty=1, lwd=2)


#막대그래프
rm(list=ls())
f=read.csv('cyberbullying_delequency.csv', sep=",", stringsAsFactors = F)
bp=barplot(f$Freqency, names.arg = f$delequency, main='delequency buzz tracking', 
           col=gray.colors(12), xlim=c(0,35000), cex.names = 0.5, col.main=1, font.main=2,
           las=1, horiz = T)

#x축 변수(빈도), y축 변수, 제목, 흑백 12색, x축 범위, y축 글자크기, , ,축 라벨:수평,그래프 수평 
text(y=bp, x=f$Freqency*1, pos=4, labels = paste(f$Freqency,'case'), col='black', cex=0.4)
#pos:1-아래/2-왼쪽/3-위, default/4-오른쪽 



#3)지리적 데이터 
rm(list=ls())
library(sp)
gadm=readRDS("KOR_adm0.rds")
plot(gadm)
gadm=readRDS("KOR_adm1.rds")
pop=read.table('gdam_cyberbullying.txt', header = T)
                 #시, 도에 대한 코드 
pop_s=pop[order(pop$Code),]
#버즈량을 17개 구간으로 설정 
inter=c(0,22,35, 80,92, 123,131, 205, 261, 320, 411, 440, 510, 770, 1700)
#2013년 항목을 17단계로 구분 
pop_c=cut(pop_s$Y2013, breaks = inter)
gadm$pop=as.factor(pop_c)
col=rev(heat.colors(length(levels(gadm$pop))))
spplot(gadm, 'pop', col.regions=col, main="2013 school cyberbullying risks by region")
