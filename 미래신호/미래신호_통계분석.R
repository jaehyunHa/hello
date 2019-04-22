#install.packages("foreign")
library(foreign)
#install.packages("Rcmdr")
library(Rcmdr)
#install.packages("catspec")
library(catspec)

##7평균의 검정(대응표본 T검정) 

data <- read.table(file="paired_test.txt", header = T)
#정규성 검정
#p<.05이면 정규분포 
with(data, shapiro.test(diet_b-diet_a))
View(data)
with(data, t.test(diet_b-diet_a))
#정규분포 아닌 경우 
#with(data, wilcox.test(diet_b-diet_a))

##8.평균의 검정(일원배치 분산분석)
#3개 이상의 집단에 대한 평균 비교는 분산분석(ANOVA) 

#1)일원배치 분산분석 
rm(list = ls())
data <- read.spss(file="Adolescents_depression_20161105.sav",
                  use.value.labels = T, use.missings = T, to.data.frame = T)
View(data)
attach(data)
tapply(Onespread, Channel, mean)
tapply(Onespread, Channel, sd)
#분산분석표 
sel <- aov(Onespread~Channel, data=data)
sel
summary(sel)
#등분산 검정 
bartlett.test(Onespread~Channel, data = data)
#채널간 분산이 다르다(귀무가설 기각) 

#2)다중비교(사후분석)
#분산분석에서 귀무가설 기각될 경우(집단간 분산 다를 경우), 요인수준들이 차이 보이는지 사후분석
install.packages("multcomp")
library(multcomp)
sel <- aov(Onespread~Channel, data=data)
dunnet <- glht(sel, linfct=mcp(Channel="Dunnett"))
summary(dunnet)
plot(dunnet)

tukey=glht(sel, linfct=mcp(Channel="Tukey"))
summary(tukey)
plot(tukey)

#3)평균도표 그리기
library(gplots)
rm(list=ls())
data <- read.spss(file="Adolescents_depression_20161105.sav", use.value.labels = T,
                  use.missings = T, to.data.frame = T)
plotmeans(Onespread~Channel,data=data, xlab = "channel", ylab = "Mean of Onespread",
          main="Mean Plot")
#등분산 가정이 기각 되었으므로 동일 집단군에 대한 확이는 평균도표로 분석
#1주 확산수는 4개의 집단으로 확인할 수 있음(트윗, 뉴스, 카페, (게시판, 블로그))

##9.평균의 검정(이원배치 분산분석)
#독립변수가 2개인 경우 집단 간 평균 비교 위한 분석방법
#두 독립변수에 대한 상호작용이 존재하는지를 우선적으로 점검
#등분산 검정도 필요

#1)이원배치 분산분석
rm(list=ls())
data <- read.spss(file="Adolescents_depression_20161105.sav", use.value.labels = T,
                  use.missings = T, to.data.frame = T)
attach(data)
tapply(Onespread, Channel, mean)
tapply(Onespread, Channel, sd)
tapply(Onespread, Account, mean)
tapply(Onespread, Account, sd)
tapply(Onespread, list(Channel, Account), mean)
tapply(Onespread, list(Channel, Account), sd)
sel=lm(Onespread~Account+Channel+Account*Channel, data=data)
anova(sel)

interaction.plot(Account, Channel, Onespread, bty='l', main="interaction plot")

##10.산점도
#두 연속형 변수 간의 선형적 관계 알아보고자 할 때 가장 먼저 실시/단순 회귀분석
rm(list=ls())
data <- read.spss(file="Depression_Regression_20160724_2012year.sav", use.value.labels = T,
                  use.missings = T, to.data.frame = T)
attach(data)
z1 <- lm(Depression~DSM1, data=data)
z2 <- lm(Depression~DSM5, data=data)
plot(Depression, DSM1, xlim=c(0,150), ylim=c(0,100), col="blue", xlab="DSM1",
     ylab = "Depression", main="scatter diagram of DSM1 and depression")
abline(z1$coef, lty=2, col="red")
plot(Depression, DSM5, xlim=c(0,50), ylim=c(0,40), col="blue", xlab="DSM5",
     ylab = "Depression", main="scatter diagram of DSM5 and depression")
abline(z2$coef, lty=2, col="red")
#1과 5는 depression과 양의 선형관계를 보인다 

##11.상관분석
#두 변수 간에 선형관계가 존재하는지 파악/ 상관관계의 정도를 측정하는 분석방법
#두 변수 간의 관계가 어느정도 밀접한지(절대값 클수록 밀접)
#상관계수 -1~1/양/음
#표본이 30보다 크면 모수적(Pearson)/비모수적 방법(Spearman, Kendall의 타우)

#1)상관분석
rm(list=ls())
data <- read.spss(file="Depression_Regression_20160724_2012year.sav", use.value.labels = T,
                  use.missings = T, to.data.frame = T)
attach(data)
with(data, cor.test(DSM1, DSM5))
with(data, cor.test(DSM9, DSM5))
with(data, cor.test(Depression, DSM5))

#2)상관관계 plot
data_spss=cbind(Depression,DSM1,DSM2,DSM3,DSM4,DSM5,DSM6,DSM7,DSM8,DSM9)
Depression_corr=cor(data_spss, use='pairwise.complete.obs')
#install.packages('corrplot')
library(corrplot)
corrplot(Depression_corr, 
         method="shade", # 색 입힌 사각형(circle, square, number(상관계수),
         # shade(격자를 그림자 효과색상으로 채우기),color(색상, pie)
         addshade="all", # 상관관계 방향선 제시
         tl.col="red",   # 라벨 색 지정, tl.cex=1: 문자열의 크기(기본값은 1), 
         # tl.col="red"(문자열의 컬러, 기본값은 red)
         tl.srt=30,      # 라벨문자열의 회전 각도
         diag=FALSE,     # 대각선 값 미제시
         addCoef.col="black", # 상관계수 숫자 색
         order="FPC"     # "FPC": First Principle Component
)


#12.편상관분석
## 편상관분석
#install.packages('foreign')
library(foreign)
rm(list=ls())
data_spss=read.spss(file='Depression_Regression_20160724_2012year.sav', 
                    use.value.labels=T,use.missings=T,to.data.frame=T)
attach(data_spss)
cor.test(Depression,DSM1)

## pcor.tset funtion 

pcor.test <- function(x,y,z,use="mat",method="p",na.rm=T){
  # The partial correlation coefficient between x and y given z
  #
  # pcor.test is free and comes with ABSOLUTELY NO WARRANTY.
  #
  # x and y should be vectors
  #
  # z can be either a vector or a matrix
  #
  # use: There are two methods to calculate the partial correlation coefficient.
  #	 One is by using variance-covariance matrix ("mat") and the other is by using recursive formula ("rec").
  #	 Default is "mat".
  #
  # method: There are three ways to calculate the correlation coefficient, 
  #	    which are Pearson's ("p"), Spearman's ("s"), and Kendall's ("k") methods.
  # 	    The last two methods which are Spearman's and Kendall's coefficient are based on the non-parametric analysis.
  #	    Default is "p".
  #
  # na.rm: If na.rm is T, then all the missing samples are deleted from the whole dataset, which is (x,y,z).
  #        If not, the missing samples will be removed just when the correlation coefficient is calculated.
  #	   However, the number of samples for the p-value is the number of samples after removing 
  #	   all the missing samples from the whole dataset.
  #	   Default is "T".
  
  x <- c(x)
  y <- c(y)
  z <- as.data.frame(z)
  
  if(use == "mat"){
    p.use <- "Var-Cov matrix"
    pcor = pcor.mat(x,y,z,method=method,na.rm=na.rm)
  }else if(use == "rec"){
    p.use <- "Recursive formula"
    pcor = pcor.rec(x,y,z,method=method,na.rm=na.rm)
  }else{
    stop("\'use\' should be either \"rec\" or \"mat\"!\n")
  }
  
  # print the method
  if(gregexpr("p",method)[[1]][1] == 1){
    p.method <- "Pearson"
  }else if(gregexpr("s",method)[[1]][1] == 1){
    p.method <- "Spearman"
  }else if(gregexpr("k",method)[[1]][1] == 1){
    p.method <- "Kendall"
  }else{
    stop("\'method\' should be \"pearson\" or \"spearman\" or \"kendall\"!\n")
  }
  
  # sample number
  n <- dim(na.omit(data.frame(x,y,z)))[1]
  
  # given variables' number
  gn <- dim(z)[2]
  
  # p-value
  if(p.method == "Kendall"){
    statistic <- pcor/sqrt(2*(2*(n-gn)+5)/(9*(n-gn)*(n-1-gn)))
    p.value <- 2*pnorm(-abs(statistic))
    
  }else{
    statistic <- pcor*sqrt((n-2-gn)/(1-pcor^2))
    p.value <- 2*pnorm(-abs(statistic))
  }
  
  data.frame(estimate=pcor,p.value=p.value,statistic=statistic,n=n,gn=gn,Method=p.method,Use=p.use)
}			

# By using var-cov matrix
pcor.mat <- function(x,y,z,method="p",na.rm=T){
  
  x <- c(x)
  y <- c(y)
  z <- as.data.frame(z)
  
  if(dim(z)[2] == 0){
    stop("There should be given data\n")
  }
  
  data <- data.frame(x,y,z)
  
  if(na.rm == T){
    data = na.omit(data)
  }
  
  xdata <- na.omit(data.frame(data[,c(1,2)]))
  Sxx <- cov(xdata,xdata,m=method)
  
  xzdata <- na.omit(data)
  xdata <- data.frame(xzdata[,c(1,2)])
  zdata <- data.frame(xzdata[,-c(1,2)])
  Sxz <- cov(xdata,zdata,m=method)
  
  zdata <- na.omit(data.frame(data[,-c(1,2)]))
  Szz <- cov(zdata,zdata,m=method)
  
  # is Szz positive definite?
  zz.ev <- eigen(Szz)$values
  if(min(zz.ev)[1]<0){
    stop("\'Szz\' is not positive definite!\n")
  }
  
  # partial correlation
  Sxx.z <- Sxx - Sxz %*% solve(Szz) %*% t(Sxz)
  
  rxx.z <- cov2cor(Sxx.z)[1,2]
  
  rxx.z
}

pcor.test(Depression,DSM1,DSM2)

##13.단순회귀분석
#install.packages('foreign')
library(foreign)
#install.packages('Rcmdr')
library(Rcmdr)

rm(list=ls())
data_spss=read.spss(file='Depression_Regression_20160724_2012year.sav', 
                    use.value.labels=T,use.missings=T,to.data.frame=T)
attach(data_spss)
summary(lm(Depression~DSM1,data=data_spss))


# 표준화 회귀계수 산출

install.packages('lm.beta') 
library(lm.beta)
lm1=lm(Depression~DSM1,data=data_spss)
lm.beta(lm1)

# 분산분석표 산출

anova(lm(Depression~DSM1,data=data_spss))

## 산점도, 잔차 그림 그리기

sel=lm(Depression~DSM1,data=data_spss)
plot(data_spss$DSM1,data_spss$Depression)
par(mfrow=c(2,2))
plot(sel)

# DSM1에 대한 추정값 얻기

dsm1_data=seq(100, 700, 100)
sp_data=predict(sel, newdata=data.frame(DSM1=dsm1_data))
sp_data


##14.## 다중회귀분석

#1)입력방법(동시 투입)
#install.packages('foreign')
library(foreign)
#install.packages('Rcmdr')
library(Rcmdr)

rm(list=ls())
data_spss=read.spss(file='Depression_Regression_20160724_2012year.sav',
                    use.value.labels=T,use.missings=T,to.data.frame=T)
attach(data_spss)
summary(lm(Depression~DSM1+DSM2+DSM3+DSM4+DSM5+DSM6+DSM7+
             DSM8+DSM9,data=data_spss))


## 유의한 변수만 다중회귀분석

summary(lm(Depression~DSM1+DSM5+DSM6+DSM9,data=data_spss))

## 유의한 변수만 표준화 회귀계수 산출

#install.packages('lm.beta') 
library(lm.beta)
lm1=lm(Depression~DSM1+DSM5+DSM6+DSM9,data=data_spss)
lm.beta(lm1)
#회귀계수의 크기 비교위한 것 => 클수록 회귀식에 대한 영향력이 큼 

# 회귀계수의 검정

rm(list=ls())
data_spss=read.spss(file='Depression_Regression_20160724_2012year.sav', 
                    use.value.labels=T,use.missings=T,to.data.frame=T)
sel=lm(Depression~DSM1+DSM5+DSM6+DSM9,data=data_spss)
anova(sel)


## 다중공선성(multicollinearity) 검정(분산팽창계수(variance inflation factor) : VIF) 적용
require(car)
vif(sel)

## tolerance function(공차한계): 작을수록 다중공선성 높은 변수 

tol=c(1.247944, 1.639080, 1.519474, 1.312320) 
tolerance = 1/tol
tolerance

# 정규성 검정: 잔차의 정규성 검정 
shapiro.test(residuals(sel))
#잔차를 정규성이다라는 귀무가설 기각하여 정규성을 만족 못함 

# Durbin-Watson 검정
library(lmtest)
dwtest(sel)
#회귀모형의 잔차는 상호독립이다(잔차 간에 자기상관이 없다) 
#dw>1.83d이면 자기상관없는 것으로 봄 


# 회귀계수의 신뢰영역

confint(sel)#대립가설 지지 


## 잔차 그림 그리기(par() 함수는 그래픽 인수를조회 하거나 설정하는데 사용
## mflow=c(2,2)= 한 화면에 4개의(2*2) 플롯을 그리는 그래픽 환경을 설정한다. 

sel=lm(Depression~DSM1+DSM5+DSM6+DSM9,data=data_spss)
par(mfrow=c(2,2))
plot(sel)
#잔차가 0을 중심으로 일정하지 않게 분포하므로 등분산의 가정을 채택 


## 모형의 비교(Tip)

rm(list=ls())
data_spss=read.spss(file='Depression_Regression_20160724_2012year.sav', 
                    use.value.labels=T,use.missings=T,to.data.frame=T)
fit_s=lm(Depression~DSM1, data=data_spss)
fit_t=lm(Depression~DSM1+DSM5+DSM6+DSM9,data=data_spss)
anova(fit_s, fit_t)
#fit_t를 최종회귀모형으로 결정(귀무가설 기각)


# 2)단계별 변수 선택(stepwise regression) 
library(MASS)
sel=lm(Depression~DSM1+DSM2+DSM3+DSM4+DSM5+DSM6+DSM7+
         DSM8+ DSM9,data=data_spss)
setp_sel=stepAIC(sel, direction='both')

#모델평가 => 모델6이 가장 적합 
setp_sel$anova
summary(setp_sel)



#15.## 요인분석 depression_Symptom_factor_20161018.sav
rm(list=ls())
data_spss=read.table(file="depression_Symptom_factor_txt.txt",header=T)
attach(data_spss)
fact1=cbind(Digestive, Respiratory, Confusing, Eclampsia,Anxious, Fear, Anxiousness, Impulse, 
            Concentration, Lethargy, Lowered, Neglected, Loneliness,Indifference,Worthless, 
            Anger, Pain, Weight,Fatigue, Sleep, Appetite, Guilty, Sadness,Hostility, Retardation, 
            Deprivation, Addicted, Taint,Academic, Blunt, Suicide)
cor(fact1) # 상관계수 출력
eigen(cor(fact1))$val #고유값 산출(요인 수 결정 위해/1이상이면 1개 이상의 변수 설명가능하다)

## KMO와 Bartlett 구형성 검정

#install.packages("psych")
library(psych)
KMO(fact1) #표본이 적절한가 측정 위함/overall 1에 가깝고 

bartlett.test(list(Digestive, Respiratory, Confusing, Eclampsia,Anxious, Fear, Anxiousness, Impulse, 
                   Concentration, Lethargy, Lowered, Neglected, Loneliness,Indifference,Worthless, 
                   Anger, Pain, Weight,Fatigue, Sleep, Appetite, Guilty, Sadness,Hostility, Retardation, 
                   Deprivation, Addicted, Taint,Academic, Blunt, Suicide))
#bartlett test가 유의하면 =>>요인분석 하기에 적합하다 

## screeplot 작성

library(graphics)
scr=princomp(fact1)
screeplot(scr,npcs=31,type='lines',main='Scree Plot')
#요인 7부터 크게 작아지는 것을 보아 요인분석에 적합하다 

FA1=factanal(fact1, factors=7, rotation='none')
#고유값 1이 이상인 요인이 7개 
FA1
#proportion Var: 요인의 설명력%
VA1=factanal(fact1, factors=7, rotation='varimax')  #요인회전-직각회전 
VA1

## 비직교회전 방법은 varimax 회전으로 부터 목표로 하는 행렬을 정해놓고 사각회전을 구한다.
VA3=factanal(fact1, factors=7, rotation='promax')
VA3

##2단계:2차 요인분석 
## 변수제거 후, 요인분석 실시(상기 직각회전에서 factor loading 0.3 미만변수 제거)

# 1차 제거된 우울증상(Respiratory, Eclampsia,Impulse, Lethargy, Lowered, Neglected, Hostility, Addicted, TaintBlunt)

fact1=cbind(Digestive, Confusing, Anxious, Fear, Anxiousness, Concentration, Loneliness,
            Indifference, Worthless, Anger, Pain, Weight, Fatigue, Sleep, Appetite, Guilty, 
            Sadness, Retardation, Deprivation, Academic, Suicide)
eigen(cor(fact1))$val


VA1=factanal(fact1, factors=4, rotation='varimax')
VA1


##3단계:3차 요인분석 
# 2차 제거된 우울증상(Fear, Loneliness,Worthless)

fact1=cbind(Digestive, Confusing, Anxious, Anxiousness, Concentration, Indifference, 
            Anger, Pain, Weight, Fatigue, Sleep, Appetite, Guilty, Sadness, 
            Retardation, Deprivation, Academic, Suicide)
eigen(cor(fact1))$val


VA1=factanal(fact1, factors=3, rotation='varimax')
VA1

## 3개의 요인으로 추출
## 스트레스요인(불안Anxious, 초조Anxiousness, 분노Anger, 피로, 죄책감, 슬픔, 학업스트레스, 자살)
## 집중력저하요인(집중력, 무관심, 체중, 수면, 식욕,지체, 상실)
## 신체적장애요인(소화장애, 혼란, 통증) 

#4단계: 요인점수 저장 
## factor socre의 출력(저장하기)

VA2=factanal(fact1, factors=3, rotation='varimax',scores='regression')$scores
library(MASS)
write.matrix(VA2, "c:/미래신호/factor_score.txt")
getwd()

## 불러오기
VA4= read.table('c:/미래신호/factor_score.txt',header=T)
# cor(VA4,use='pairwise.complete.obs')

## factor score file save(2016. 10. 16 success)

attach(VA4)
data_spss=cbind(data_spss,Factor1,Factor2,Factor3)
write.matrix(data_spss, "c:/미래신호/regression_factor_score.txt")


##5단계: 이분형 로지스틱 회귀분석 
## logistic regression : regression_factor_score.txt

data_spss=read.table(file="c:/미래신호/regression_factor_score.txt",header=T)
summary(glm(Attitude~Factor1+Factor2+Factor3, family=binomial,data=data_spss))
exp(coef(glm(Attitude~Factor1+Factor2+Factor3, family=binomial,data=data_spss)))
exp(confint(glm(Attitude~Factor1+Factor2+Factor3, family=binomial,data=data_spss)))

## 표준화계수(회귀계수의 상대적 크기)

#install.packages('lm.beta') 
library(lm.beta)
lm1=glm(Attitude~Factor1+Factor2+Factor3, family=binomial,data=data_spss)
lm.beta(lm1)


##16.신뢰성 분석
#install.packages('psych')
library(psych)
rm(list=ls())
data_spss=read.table(file="depression_Symptom_factor_txt.txt",header=T)
attach(data_spss)

## 3개의 요인에 대한 신뢰성 분석

factor1=cbind(Anxious, Anxiousness, Anger, Fatigue, Guilty, Sadness, Academic, Suicide)
alpha(factor1)
# factor2=cbind(Concentration, Indifference, Weight, Sleep, Appetite, Retardation, Deprivation)
# alpha(factor2)
# factor3=cbind(Digestive, Confusing, Pain)
# alpha(factor3)

## drop(Loneliness)

# factor3=cbind(Anxious, Anxiousness, Anger, Fatigue, Guilty, Sadness, Academic)
# alpha(factor3)


##17.다변량분석
#2개 이상의 종속변수와 2개 이상의 독립변수의 집단 간의 종속변수들의 평균 차이 검정 
#install.packages('foreign')
library(foreign)

rm(list=ls())
data_spss=read.spss(file='Adolescents_depression_20161105.sav',
                    use.value.labels=T,use.missings=T,to.data.frame=T)
attach(data_spss)

tapply(Onespread, Channel, mean)
tapply(Onespread, Channel, sd)
tapply(Onespread, Account, mean)
tapply(Onespread, Account, sd)
tapply(Onespread, list(Channel,Account), mean)
tapply(Onespread, list(Channel,Account), sd)

tapply(Twospread, Channel, mean)
tapply(Twospread, Channel, sd)
tapply(Twospread, Account, mean)
tapply(Twospread, Account, sd)
tapply(Twospread, list(Channel,Account), mean)
tapply(Twospread, list(Channel,Account), sd)

y=cbind(Onespread, Twospread)
Mfit=manova(y~Account+Channel+Account:Channel)  #이원다분량분석 
Mfit
#최초문서보다 확산문서가 트위터의 1/2주 확산수의 평균이 높다 
summary(Mfit,test='Wilks')
summary(Mfit,test='Pillai')
summary(Mfit,test='Roy')
summary(Mfit,test='Hotelling')
#다변량분석검정에서 account와 channel 집단 간 1/2주 확산수는 유의한 차이가 있다
#상호작용 효과검정(account:channel)에서 유의한 차이가 나타나 상호작용이 없다는 귀무가설 기각되어
#channel중 트위터에서 확산문서(spread)의 1/2주 확산수 평균이 가장 큰 것으로 나타남 

## 개체-간 효과 검정 
summary.aov(Mfit)
#account, channel, account:channel에 따른 1주 확산수와 2주 확산수의 평균은 유의한 차이가 있다 


##18.이분형 로지스틱 회귀분석
#긍정(1)/부정(0) 이분형 로지스틱(종속변수가 2개의 범주를 가지는 회귀모형)
#일반적으로 회귀분석의 적합도 검정은 잔차의 제곱합을 최소화하는 (최소자승법) 사용 
#로지스틱 회귀분석은 사건 발생 가능성을 크게 하는 확률인 최대우도추정법 사용 
#독립변수가 종속변수에 미치는 영향을 승산의 확률인 odds ratio로 검정(긍정(1)일확률/부정일 확률)


#install.packages('foreign')
library(foreign)

rm(list=ls())
data_spss=read.spss(file='Adolescents_depression_logistic.sav',
                    use.value.labels=T,use.missings=T,to.data.frame=T)
attach(data_spss)
summary(glm(Attitude~., family=binomial,data=data_spss)) #이분형 로지스틱 회귀
#DMS3제외한 모든 독립변수가 종속변수에 유의한 영향 미침 
exp(coef(glm(Attitude~., family=binomial,data=data_spss))) #오즈비 산출
#3,7,9는 우울감정에 긍정보다 부정 영향/나머지는 부정보다는 긍정 영향 줌 
exp(confint(glm(Attitude~., family=binomial,data=data_spss))) #신뢰구간 산출 



## 로지스틱회귀모형의 분류모형 평가
#1)실제집단과 분류집단의 오분류표에 의한 분류평가
#2)민감도와 특이도의 관계를 보여주는 ROC(AUC 클수록 예측력 우수한 분류기)

#install.packages('foreign')
library(foreign)
#install.packages('party')
library(party)

rm(list=ls())
data_spss=read.spss(file='Adolescents_depression_logistic.sav',
                    use.value.labels=T,use.missings=T,to.data.frame=T)
# attach(data_spss)
i_logistic=ctree(Attitude~., data=data_spss)   #조건부 추론 트리 모델 
ipredict=predict(i_logistic,data_spss)  #모형 예측 
table(data_spss$Attitude,ipredict)  #오분류표 
perm_a=function(p1, p2, p3, p4) {pr_a=(p1+p4)/sum(p1, p2, p3, p4)  #정확도 산출 함수 
return(pr_a)}
perm_a(73135, 371, 12947, 504) # 정확도

## logistic 모델의 평가(ROC curve) 

#install.packages('ROCR')
library(ROCR)
model_tr=glm(Attitude~., family=binomial,data=data_spss)
p=predict(model_tr, newdata=data_spss, type="response")  #모형 예측
pr=prediction(p, data_spss$Attitude) #실제집단과 분류집단 이용해 data_spss의 추정치 예측 
prf=performance(pr, measure='tpr', x.measure='fpr')
plot(prf, col='red', lty=1, lwd=1.5, main='ROC curve - Depression logistic regression')

# 그림 그림, 기준선, 범주
abline(0,1,lty=3)

## auc method1

auc=performance(pr, measure='auc')  #AUC 곡선 성능 평가
auc=auc@y.values[[1]]  #auc 통계량 산출 
auc  #=>클수록 우수 (poor)


##19.다항 로지스틱 회귀분석
#3개 이상의 범주를 가지는 회귀모형 

#install.packages('foreign')
library(foreign)

## 다항로지스틱회귀분석은 nnet 패키지의 multinom()함수를 사용한다. 
## spss 실행은 2012_2014_청소년우울_logistic_r_spss실행.sav 파일을 활용할 것
#install.packages('nnet')
library(nnet)
rm(list=ls())
data_spss=read.spss(file='Adolescents_depression_logistic_r.sav',
                    use.value.labels=T,use.missings=T,to.data.frame=T)
attach(data_spss)
#우울감정(attitude(positive,neutral, negative)에 영향주는 우울증상(DSM1~9)은 무엇인가) 
model=multinom(formula= Attitude~.,data=data_spss)   #디힝로지스틱 회귀분석 
summary(model)

## multinom 함수는 p-value를 산출할 수 없으므로, 다음과 같이 z-tests(Wald tests)를 사용하여 
#p-value를 산출할 수 있다.
## (http://www.ats.ucla.edu/stat/r/dae/mlogit.htm)
## The multinom package does not include p-value calculation for the regression coefficients, 
#so we calculate p-values using Wald tests (here z-tests).

z=summary(model)$coefficients/summary(model)$standard.errors
p=(1-pnorm(abs(z), 0, 1))*2
p
exp(coef(model))
exp(confint(model))

## 다항로지스틱 회귀모델의 평가
# converged
#        llh       llhNull            G2      McFadden          r2ML          r2CU 
# -7.307918e+04 -8.274786e+04  1.933736e+04  1.168450e-01  1.993876e-01  2.343234e-01 
##  R2값이 0.234로 나타나 다중회귀분석 모델이 데이터셋(data_spss)의 분산의 약 23.4% 정도 설명하고 있다. 

install.packages('pscl'); 
library(pscl)
pR2(model)


##20.군집분석 
## K평균 군집분석(군집의 개수 지정) depression_Symptom_factor_20161018.sav
#1)비계층적 군집분석: 연구자가 군집의 수 지정 
#  -1)군집 수 여러개 지정해 k-means 수행 후 가장 적절한 군집의 수 선정
#  -2)스크리 도표 이용해 급격한 경사가 완만해지는 지점의 군집 수로 결정 
#2)계층적 군집분석: 가까운 대상끼리 순차적으로 군집 묶어감 

#청소년 우울증상 세분화 
kmean_data=read.table(file="depression_Symptom_factor_txt.txt",header=T)
attach(kmean_data)
clust_data=cbind(Digestive, Respiratory, Confusing, Eclampsia, Anxious,
                 Fear, Anxiousness, Impulse, Concentration, Lethargy, Lowered, Neglected,
                 Loneliness,Indifference, Worthless, Anger, Pain, Weight, Fatigue, Sleep,
                 Appetite, Guilty,Sadness, Hostility, Retardation, Deprivation, Addicted,
                 Taint, Academic, Blunt, Suicide)  #우울증상 
noc=(nrow(clust_data)-1)*sum(apply(clust_data, 2, var))  #군집 내 편차 
for (i in 2:15)
  noc[i]=sum(kmeans(clust_data, center=i)$withinss)
plot(noc, type='b', pch=19, xlab='Number of Clusters',
     ylab='Within groups sum of squares')


## K평균 군집분석(상기 결과에서 7개로 지정, 즉 K-Means 군집분석에서 군집의 개수를 선정하는
#방법은 군집의 개수를 여러개 지정하여 K-Means  군집분석을 실시한 후에
#수행한 결과중 가장 적절한 선택하는 방법을 사용하는데, 이때 스크리차트(scree chart)를 
#이용하여 가장 급격한 경사가 완만해지는 지점의 군집의 개수를 선택한다.
#상기 스크리차크에서 8에서 이러한 현상을 보이므로 군집의 개수는 7으로 선택하는 것이 적절하다.


# K-Means Cluster Analysis

fit = kmeans(clust_data, 7) # 7 cluster solution
fit
#cluster means가 0.3이상인 요인을 군집에 포함 

# get cluster means 
# aggregate(kmean_data,by=list(fit$cluster),FUN=mean)
# append cluster assignment
kmean_data=data.frame(kmean_data, fit$cluster) 
## cluster save (시장세분화 적용)
## kmean_data의 출력(저장하기)

library(MASS)
write.matrix(kmean_data, "c:/미래신호/my_data_cluster.txt")

## 시장세분화 교차분석 
# t1=ftable(data_spss[c('fit.cluster')])
# ctab(t1,type='n')

#install.packages('Rcmdr'); library(Rcmdr)
#install.packages('catspec');
library(catspec)
data_spss=read.table(file='my_data_cluster.txt', header=T)
attach(data_spss)

data_spss=data_spss[data_spss$fit.cluster!=4,]
t1=ftable(data_spss[c('fit.cluster','Attitude')])
ctab(t1,type=c('n','r','c','t'))
chisq.test(t1)
#부정 감정은 군집7/긍정은 군집3이 가장 높음 