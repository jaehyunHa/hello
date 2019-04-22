#2장. 소셜 빅데이터 분석방법론

#2. 통계분석
#수집된 자료를 이해하기 쉬운 수치로 요약하는 기술통계
#모집단을 대표하는 표본을 추출해 표본의 특성값으로 모집단의 모수를 추정하는 추리통계가 있다

 #1)기술통계분석: 변수들이 지닌 분포의 특성 파악해야 하는데, 수집된 자료를 요약/정리하여 
 #                자료의 특성 파악하기 위한 것(중심위치, 산포도, 왜도, 첨도 등)
  
  #(1)중심위치(대푯값): 자료가 어느 위치에 집중되어 있는가 
  #ex)산술평균, 중앙값, 최빈값, 4분위수, 백분위수
  #(2)산포도: 자료의 퍼짐 정도와 분포 모형 ex)범위, 평균편차, 분산/표준편차, 변이계수, 왜도/첨도
  
  #중심위치와 산포도 분석
#library(Rcmdr)
cyberbullying=read.table(file='cyber_bullying_sam.txt', header = T)
attach(cyberbullying) 
length(Strain) 
mean(Strain) 
var(Strain) 
sd(Strain)
sd(Strain)/mean(Strain) #변이계수
quantile(Strain)
  #변수의 정규성 검정
numSummary(cyberbullying[,"Strain"], statistics=c("skewness", "kutosis"))
#왜도는 절대값 3미만, 첨도는 절대값 10 미만이면 정규성 가정 충족
#정규성 가정 위배된 경우 상용로그 치환하여 정규성 검정 실시
numSummary(log(Strain+1), statistics=c("skewness", "kutosis"))
#부정값 log(0) 방지 위해 +1

#1)연속형 변수의 시각화#
par(mfrow=c(1,2))
boxplot(Strain, col="blue", main='box plot')
boxplot(log(Strain+1), col="blue", main='box plot(log)')
hist(Strain, prob=T, main = 'histogram')
lines(density(Strain), col='blue') #추정분포선 
hist(log(Strain+1), prob=T, main = 'histogram(log)')
lines(density(log(Strain+1)), col='blue')  #로그치환한 Strain 요인인 정규분포를 보임 

cyber_s = data.frame(Strain, Physical, Psychological, Self_control, Attachment, Passion, Perpetrator,
                     Delinquency)
boxplot(cyber_s)
cyber_l=log(cyber_s+1)
boxplot(cyber_l)

#2)범주형 변수의 빈도분석#: 평균, 표준편차 개념 없으므로 빈도와 비율 계산
library(catspec)
cyberbullying=read.table(file="cyber_bullying_methodology_label.txt", header = T)
attach(cyberbullying)
t1=ftable(cyberbullying[c('Attitude')])  #평면분할표
ctab(t1, type=c('n', 'r'))
length(Attitude)
#온라인 문서 중 사이버 학교폭력에 대한 부정적인 감성은 45%/긍정은 54%

#3)연속형 변수의 빈도분석#: 평균 분산으로 퍼짐 정도 파악, 왜도 첨도로 정규분포 파악
cyber_bullying = read.table(file="cyber_bullying_descriptive_label.txt", header = T)
attach(cyber_bullying)
summary(Onespread)
install.packages('fBasics')
library(fBasics)
skewness(Onespread)
kurtosis(Onespread)
#1주 확산수는 왜도 7로 왼쪽으로 치우쳐 있고 정규분포보다 뾰족한 분포(첨도 66)=>정규성 가정 위배
skewness(log10(Onespread+1))
kurtosis(log10(Onespread+1))
#상용로그 치환하여 왜도 절대값 3미만, 첨도 절대값 10미만으로 정규성 가정 충족
boxplot(Onespread~Account, col='red', main="boxplot")
boxplot(log10(Onespread+1)~Account, col='red', main="boxplot(log)")
boxplot(Onespread~Channel, col='red', main="boxplot")
boxplot(log10(Onespread+1)~Channel, col='red', main="boxplot(log)")


 #2)추리통계: 표본의 통계량으로 모집단의 모수를 추청하는 통계방법
              #가설검정을 통해 표본의 통계량으로 모집단의 모수를 추정
  #종속/독립변수의 척도의 속성(범주형,연속형)에 따라 모집단의 평균 추정 위해 평균분석 실시,
  #변수 간의 상호 의존성을 파악하기 위해선 교차분석, 상관분석, 요인분석, 군집분석 등 실시
  #변수 간의 종속성 분석 위해선 회귀분석, 로지스틱 회귀분석 등 실시

#4)교차분석#
#빈도분석은 단일 변수에 대한 통계 특성 분석하는 기술통계(빈도분석표)
#두 가지 이상의 변수 사이의 상관관계 분석하기 위해선 교차분석(교차표)
#카이제곱 검정 분할표는 행과 열을 구성하고 두 변수 간의 독립성과 동질성을 검정해주는 통계량으로
#우리가 조사한 표본의 두 변수 간의 관계를 모집단에서도 동일하다고 판단할 수 있는가 유의성 검정
#독립성 검정: 모집단에서 추출한 표본에서 관찰대상을 사전에 결정하지 않고 검정 실시-통계조사
#동질성 검정: 관찰대상 사전에 결정한 후 두 변수 간에 검정 실시-임상실험 결과 분석시 사용 

#카이제곱 검정 순서
#가설 설정->유의수준 결정->표본의 통계량에서 유의확률(p) 산출->p<유의수준, 귀무가설 기각 

#연관성 측도: 귀무가설 기각할 경우 두 변수가 얼마나 연관되어 있는가를 나타냄
#분할계수: 행과 열의 크기 같을 때 사용
#Cramer's V: 행과 열의 크기 같지 않을 때도 사용 가능(0<V<1)
#Kendall's 타우: 행과 열의 수 같거나 다른 순서형 자료에 사용
#이타: 범주형 자료와 연속형 자료 간에 연관측도 나타냄 (1에 가까울수록 연관관계 높음)
#Somer's D: 순서형 자료에서 두 변수 간에 인과관계가 정해져 있을 때 사용(-1<D<1)(전공, 직업)
#Pearson's R: 구간 자료 간에 선형적 연관성 나타냄 

#사이버 학교폭력 감정(Attitude)과 GST요인(Strain_N) 간 교차분석 실시
library(catspec)
cyber_bullying=read.table(file='cyber_bullying_methodology_label.txt', header=T)
attach(cyber_bullying)
t1=ftable(cyber_bullying[c('Strain_N', 'Attitude')])
ctab(t1, type=c('n','r','c','t'))  #빈도, 행, 열, 전체
#GST요인이 1개인 경우 부정적 감정이 50%, 2개 이상인 경우 긍정적 감정이 58%로 가장 많음
chisq.test(t1)
#카이제곱검정 결과 두 변수 간의 유의한 차이가 았는 것으로 나타남(차이가 없다는 귀무가설 기각)

#연관성 측도 분석
cyber_bullying= read.table(file='cyber_bullying_methodology_numeric.txt', header = T)
with(cyber_bullying, cor.test(Strain_N, Attitude, method = 'pearson'))
with(cyber_bullying, cor.test(Strain_N, Attitude, method = 'kendall'))
cv.test=function(x,y){   #cramer's V
  CV=sqrt(chisq.test(x,y, correct=FALSE)$statistic/
            (length(x)*(min(length(unique(x)),length(unique(y)))-1)))
  print.noquote("Cramer V/Phi:")
  return(as.numeric(CV))
}
with(cyber_bullying, cv.test(Strain_N, Attitude))

#삼원분할표 분석
cyber_bullying=read.table(file='cyber_bullying_methodology_label.txt', header=T)
t1=ftable(cyber_bullying[c('Strain_N','Account', 'Attitude')])
ctab(t1, type=c('n','r','c','t'))  #빈도, 행, 열, 전체
chisq.test(t1)


#T검정은 두 개의 집단에 대한 평균값 검정하기 위한 분석 
#5)평균의 검정(일표본T검정)#: 모집단의 평균 알고 있을 때 모집단과 단일표본 평균의 차이 검정
#귀무가설:사이버 학교폭력의 1주차 평균 확산수가 모집단의 확산수인 100회와 차이가 없다
cyber_bullying=read.table(file='cyber_bullying_descriptive_label.txt', header=T)
t.test(cyber_bullying[c('Onespread')], mu=100)
#1주차 확산수의 평균은 61회로 검정값인 100회보다 유의하게 낮다=>대립가설 채택
#신뢰구간이 0을 포함하지 않으므로 대립가설 지지


#6)평균의 검정(독립표본 T검정)
#두 개의 모집단에서 각각 표본 추출하여 모집단 간의 평균의 차이 검정하는 방법
#1.등분산등 검정 후 2.평균의 차이 검정 실시
#등분산일 경우 합동분산 이용해 T검정 실시, 등분산 아닌 경우 Welch의 T검정 

#가설: 사이버 학교폭력의 순계정(account) 두 집단(first, spread)간 1주 확산수(onespread) 평균의 차이있다
rm(list=ls())
cyber_bullying=read.table(file='cyber_bullying_descriptive_label.txt', header=T)
var.test(Onespread~Account, cyber_bullying)
#등분산 가정 기각
t.test(Onespread~Account,cyber_bullying)   #분산 다른 경우
#순계정 두 집단의 평균 차이는 유의하다 
#t.test(Onespread~Account,var.equal=T, cyber_bullying) #분산 같은 경우


#7)평균의 검정(대응표본 T검정)
#동일한 모집단에서 각각의 표본 추출하여 평균 간의 차이 검정하는 방법

#가설:청소년 비만환자 20명을 대상으로 다이어트 약 복용 전후의 체중 측정하여
#약이 다이어트에 효과가 있었는지 검정(귀무가설:체중 같음)
rm(list=ls())
data_pair=read.table(file='paired_test.txt', header=T)
with(data_pair, t.test(diet_b-diet_a))  
#체중의 평균의 차이가 있는 것으로 검정되어 귀무가설 기각, 약은 체중 감량에 효과가 있다


#8)평균의 검정(일원배치 분산분석)
#3개 이상의 집단에 대한 평균값의 비교분석에는 F검정인 분산분석(anova) 사용
#종속변수는 구간척도나 정량적인 연속형 척도로 종속변수가 2개 이상일 경우 다변량분산분석(manova)
#특히 독립변수의 범주가 3개 이상으로 요인이 하나이면 일원배치 분산분석(one-way)
#요인이 2개이면 이원배치 분산분석(two-way)

#집단 간 분산이 다를 경우, 요인수준들이 평균 차이를 보이는지 사후분석 실시해야 함
#사후분석(다중비교)에는 통상 Tukey(작은 평균 차이에 대한 유의성 발견 시 용이),
#Scheffe(큰 평균 차이에 대한 유의성 발견 시 용이)의 다중비교 실시
#등분산 가정되지 않을 경우 Dunnett의 다중비교 실시

#귀무가설: 채널별 평균 버즈 1주 확산수(onespread)에 유의한 차이가 없다(같다)
cyber_bullying=read.table(file='cyber_bullying_descriptive_label.txt', header=T)
attach(cyber_bullying)
tapply(Onespread, Channel, mean) #tapply 함수는 각 그룹의 평균 산출
tapply(Onespread, Channel, sd)
sel=aov(Onespread~Channel, data = cyber_bullying)  #분산분석표
summary(sel)
#채널 간 1주 확산수의 평균은 차이가 있다 
bartlett.test(Onespread~Channel, data = cyber_bullying) #등분산 검정
#귀무가설 기각되어 채널 간 분산 다르게 나타남 

#집단 간 분산 다르므로 다중비교(사후분석) 실시
library(multcomp)
sel=aov(Onespread~Channel, data = cyber_bullying)
windows(height = 5.5, width = 5)
dunnett=glht(sel, linfct=mcp(Channel='Dunnett'))  #다중비교 검정 
summary(dunnett)
plot(dunnett, cex.axis=0.6)  #축의 문자크기 지정 
#트위터와 블로그 채널 간의 평균이 유의한 차이가 있다 
tukey=glht(sel, linfct=mcp(Channel='Tukey'))
summary(tukey)
plot(tukey, cex.axis=0.6)
#blog, cafe, board, news는 동일한 채널로 나타남, 트위터는 다른 채널 간 평균의 차이가 있음 

library(gplots)
plotmeans(Onespread~Channel, data=cyber_bullying, xlab ='Channel', ylab = 'mean of onespread',
          main="mean plot")   #평균도표 
#등분산 가정 성립되지 않으므로 동일 집단군에 대한 확인은 dunnett의 다중비교나 평균도표를 분석
#하여 확인 가능, 평균도표에서 1주 확산수는 2개의 집단으로 구분 할 수 있음(트위터/그 외)

#귀무가설: 8종의 사이버 학교폭력 유형별 전통적 학교폭력(bullying) 평균은 유의한 차이가 없다
cyber_bullying=read.table(file='type_anova.txt', header=T)
attach(cyber_bullying)
tapply(bullying, psychological_type, mean)
tapply(bullying, psychological_type, sd)
sel=aov(bullying~psychological_type, data=cyber_bullying)
summary(sel)
#학교폭력 유형에서 유형4(가해피해자)의 전통적 학교폭력이 0.92로 가장 높게 나타났으며
#분산분석 결과 사이버 학교폭력 유형별 전통적 학교폭력 평균은 차이가 있는 것으로 나타남
bartlett.test(bullying~psychological_type,data=cyber_bullying)
#등분산 검정 결과 귀무가설 기각되어 사이버 학교폭력 유형 간 분산이 다르게 나타남
tukey=glht(sel, linfct = mcp(psychological_type='Tukey'))
summary(tukey)
plot(tukey, cex.axis=0.6)
#tukey 다중비교 분석결과(피해자, 가해방관자, 가해피해방관자)와 (가해피해자, 피해방관자)는 
#동일한 유형으로 나타났으며 다른 유형 간 평균의 차이가 있는 것으로 나타남 
#따라서 사이버 학교 폭력의 유형은 5개의 집단으로 구분할 수 있다

#귀무가설: 사이버 학교폭력 감정(Attitude)별 복합형 사이버 학교폭력 유형(complex_psychology)
#의 평균은 유의한 차이가 없다
rm(list=ls())
cyber_bullying=read.table(file='attitude_anova.txt', header=T)
attach(cyber_bullying)
tapply(Complex_psychology,Attitude, mean)
tapply(Complex_psychology, Attitude, sd)
sel=aov(Complex_psychology~Attitude, data=cyber_bullying)
summary(sel)
#사이버 학교폭력 감정에서 보통의 복합형 사이버 학교폭력 유형이 0.022로 가장 높음
#분산분석 결과 사이버 학교폭력 감정별 복합형 사이버 학교폭력 유형의 평균은 차이가 있음
bartlett.test(Complex_psychology~Attitude,data=cyber_bullying)
#등분산 검정 결과 귀무가설 기각되어 사이버 학교폭력 감정그룹 간 분산이 다르게 나타남
tukey=glht(sel, linfct = mcp(Attitude='Tukey'))
summary(tukey)
#다중비교 분석결과 negative와 neutral은 동일한 감정으로 나타났으며 positive 간 평균의 차이가
#있는 것으로 나타남
#따라서 사이버 학교폭력 감정은 2개의 집단(negative,neutral)/positive로 구분할 수 있다 
plot(tukey, cex.axis=0.6)


#9)평균의 검정(이원배치 분산분석)
#범주형 독립변수가 2개인 경우 집단 간 종속변수의 평균비교를 하기 위한 분석방법
#두 요인에 대한 상호작용이 존재하는지를 우선적으로 점검 후
#상호작용 없으면 각각의 요인의 효과 따로 분석 가능

#Account(first, spread)와 Channel에 따라 Onespread에 차이가 있는가? 
#그리고 Account와 Channel의 상호작용 효과는 있는가?
cyber_bullying=read.table(file='cyber_bullying_descriptive_label.txt', header = T)
attach(cyber_bullying)
tapply(Onespread, Channel, mean)
tapply(Onespread, Channel, sd)
tapply(Onespread, Account, mean)
tapply(Onespread, Account, sd)
tapply(Onespread, list(Channel,Account), mean)
tapply(Onespread, list(Channel,Account), sd)
sel=lm(Onespread~Channel+Account+Channel*Account, data=cyber_bullying)  #회귀분석 
anova(sel)  #개체 간 효과 검정 실시 
#1주 확산수에 대한 순계정과 채널의 효과는 유의한 차이가 있음
#채널과 계정의 상호작용 효과가 있음
#모든 채널에 대해 최초문서(first)보다 확산문서(spread)의 1주 확산수가 많음

interaction.plot(Account, Channel, Onespread, bty='l', main='interaction plot')
#트위터와 그 외 채널은 교차되어 상호작용 효과 있음
#나머지 채널들은 상호 간 교차되지 않아 동일 집단으로 확인됨


#10)산점도
#두 연속형 변수 간의 선형적 관계 살펴보고자 가장 먼저 실시
#직선관계식을 나타내는 단순회귀분석 실시
rm(list=ls())
cyber_bullying=read.table(file='cyber_bullying_sam.txt', header = T) ##
attach(cyber_bullying)
z1=lm(Delinquency~Strain, data=cyber_bullying)
z2=lm(Delinquency~Self_control, data=cyber_bullying)
z3=lm(Delinquency~Attachment, data=cyber_bullying)
plot(Delinquency, Strain, xlim=c(0,150), ylim = c(0,100), col='blue', xlab='Strain',
     ylab='Delinquency', main = 'Scatter diagram of Strain and Delinquency')
abline(z1$coef, lty=2, col='red')  #z1의 회귀계수에 대한 직선 
#양의 선형 관계 보임


#11)상관분석
#정량적인 두 변수 간에 선형관계가 존재하는지 파악, 상관관계 정도 측정하는 분석방법
#두 변수 간의 관계가 얼마나 밀접한지 측정
#-1~1값 가지며 절대값 클수록 밀접한 관계, 0이면 상관관계 없음
#인과관계가 아닌 관련성 정도 검정하는 것
#자료의 수에 따라 모수적/비모수적 방법
#표본 수 30이 넘는 경우 모수적 방법 사용
#모수적 방법에는 상관계수로 피어슨/비모수적 방법에는 스피어만, 켄달의 타우 선택

#두 변수 간의 상관분석
rm(list=ls())
cyber_bullying=read.table(file='cyber_bullying_sam.txt', header = T) ##
attach(cyber_bullying)
with(cyber_bullying, cor.test(Delinquency, Strain))  #상관계수와 유의확률 산출
with(cyber_bullying, cor.test(Delinquency, Attachment))
#둘 다 강한 양의 상관관계 보임

#전체 변수 간의 상관분석
cyber_bullying1=cbind(Strain, Physical, Psychological, Self_control, Attachment,
                      Passion, Perpetrator, Delinquency)
library(psych)
corr.test(cyber_bullying1)  
#전체 변수 간의 상관분석에서 상관계수 매트릭스와 유의확률 확인하면 
#delinquency와 strain의 상관관계 가장 높음
cyber_bullying_corr=cor(cyber_bullying1, use='pairwise.complete.obs')
library(corrplot)
corrplot(cyber_bullying_corr, 
         method = 'shade',  #색 입힌 사각형, 그림자 효과 
         addshade = 'all',  #상관관계 방향선 제시
         tl.col='red', tl.srt = 30,    #라벨 색 시정, 회전각도
         diag=FALSE, addCoef.col = "black",  #대각선 값 미제시/상관계수 숫자 색 
         order="FPC"    #first principle component 
         )


#12)편상관분석
#부분상관분석은 두 변수 간의 상관관계를 분석한다는 점에서 단순상관분석과 같으나
#두 변수에 영향 미치는 특정 변수 통제하고 분석
library(ppcor)
cyber_bullying=read.table(file='cyber_bullying_sam.txt', header = T) ##
attach(cyber_bullying)
cor.test(Delinquency, Strain)
pcor.test(Delinquency, Strain, Attachment)   #Attachment가 통제할 변수 #pearson
#Attachment 통제하니 단순상관분석보다 상관계수 낮게 나타남


#13)단순회귀분석
#회귀분석은 상관분석과 분산분석의 확장된 개념
#종속변수와 독립변수 간의 관계를 함수식으로 분석하는 것

#단순회귀:연속형 독립변수 1개, 연속형 종속변수 1개
#다중회귀:연속형 독립 2개 이상, 연속형 종속 1개
#이분형 로지스틱: 연속형 독립 1개이상, 이분형 종속변수 1개
#다항 로지스틱:연속형 독립 1개 이상, 다항 종속 1개

#ex)사이버 학교폭력에서 긴장요인(strain)은 비행요인(delinquency)에 영향을 미치는가?
rm(list=ls())
cyber_bullying=read.table(file='cyber_bullying_sam.txt', header = T) ##
attach(cyber_bullying)
summary(lm(Delinquency~Strain, data = cyber_bullying))
library(lm.beta)    #표준화 회귀계수 산출 패키지 
lm1=lm(Delinquency~Strain, data=cyber_bullying)
lm.beta(lm1)  
#결정계수 R^2는 총변동 중에서 회귀선에 의해 설명되는 비율
#비행요인의 변동 중 58.4%가 긴장요인에 의해 설명된다는 의미
#0~1사이의 범위를 갖고 1에 가까울수록 회귀선이 표본을 설명하는 데 유의하다
#F통계량은 회귀식이 유의한가를 검정하는 것으로 유의확률 p에 따라 회귀식이 매우 유의하다
#표준화 회귀계수는 회귀계수 크기 비교 위해 회귀분석에 사용한 모든 변수를 표준화한 회귀계수
#표준화 회귀계수가 크다는 것은 종속변수에 미치는 영향이 크다는 의미
#Strain이 한 단위 증가하면 비행요인이 0.764씩 증가한다는 의미
anova(lm(Delinquency~Strain, data = cyber_bullying))
#분산분석표는 회귀선의 모델이 적합한지 검정하는 것으로 단순회귀분석에서는 F통계량과 같음


#14)다중회귀분석
#두 개 이상의 독립변수가 종속변수에 미치는 영향 분석하는 방법
#고려할 사항
#(1)독립변수 간의 상관관계 즉 다중공선성 높은 변수(공차한계 낮은 변수)는 제외한다
#  >독립변수 중 서로 상관 높은 변수가 포함되어 있으면 분산•공분산 행렬식이 0에 가까워져 회귀계수의 추정정밀도가 매우 나빠지는 현상
#  >VIF(분산팽창지수)는 보통최소자승법 회귀분석에서 다중공선성 정도를 검정하기 위해 사용, 5나 10보다 작아야 함
#(2)잔차항 간의 자기 상관 없어야 함(상호 독립적)
#(3) 편회귀잔차도표 이용하 종속변수와 독립변수의 등분산성 확인
#(4)독립변수 투입방식은 입력방식과 단계선택법
  #입력방식은 독립변수를 동시에 투입(lm())
  #단계선택법은 독립변수의 통계적 유의성 검정해 회귀모형 구성하는 방법, 
  #유의도 낮은 독립변수는 단계적으로 제외하고 적합한 변수만 구성(step())

#ex)사이버 학교폭력에서 비행요인에 영향 미치는 독립변수(Strain~Perpetrator)는 무엇인가?

#1.입력방법
rm(list=ls())
cyber_bullying=read.table(file='cyber_bullying_sam.txt', header = T) ##
attach(cyber_bullying)
cyber_bullying1=data.frame(Strain, Physical, Psychological, Self_control, Attachment,
                      Passion, Perpetrator, Delinquency)
summary(lm(Delinquency~.,data = cyber_bullying1))  #모든 독립변수에 대해 1차 다중회귀분석
#Strain, physical, self_control, attachment는 비행에 양의 영향
#perpetrator는 비행에 음의 영향 미침, 나머지는 영향 미치지 않음
#회귀식의 통계적 유의성을 나타내는 F값은 매우 유의함

#2차 다중회귀분석
#유의한 독립변수에 대해 다중회귀분석 실시
sel=lm(Delinquency~Strain+Physical+Self_control+Attachment+Perpetrator, data=cyber_bullying1)
anova(sel)   #회귀계수 검정(요인에 대한 분산분석)
library(Rcmdr)
vif(sel)  #다중공선성 검정
#유의하지 않은 self_control과 attachment 중 상대적으로 vif 높은 attachment 제거하고 3차 회귀분석

#3차
summary(lm(Delinquency~Strain+Physical+Self_control+Perpetrator, data=cyber_bullying1))
#perpetrator는 비행에 음의 영향, 나머지는 양의 영향
#회귀식 설명력은 R^2 63.8, F통계량은 유의확률 <.001로 추정회귀식은 매우 유의 

#표준화 회귀계수 산출
library(lm.beta)
lm1=lm(Delinquency~Strain+Physical+Self_control+Perpetrator, data=cyber_bullying1)
#유의한 변수만 다중회귀분석 실시
lm.beta(lm1) 
#회귀계수 크기 비교한 결과 회귀식에 대한 독립변수의 영향력은
#Strain, physical, perpetrator, self_control 순으로 나타남

#분산팽창지수(vif) 산출
library(Rcmdr)
sel=lm(Delinquency~Strain+Physical+Self_control+Perpetrator, data=cyber_bullying1)
anova(sel)
vif(sel)
#독립변수가 다른 변수로부터 독립적이기 위해서는 vif가 5나 10보다 작아야 함
#모든 독립변수가 10보다 작으므로 다중공선성 문제 없음

#공차한계(tolerance) ->  1/vif
#공차한계 낮을수록 다중공선성 높은 변수

#잔차의 정규성 검정
shapiro.test(residuals(sel))
#잔차는 정규성이라는 귀무사설 기각하여 정규성 만족하지 못함 

#잔차의 자기상관 검정
library(lmtest)
dwtest(sel)  #더빈-왓슨 검정
#회귀모형의 잔차는 상호독립이라는 귀무가설 기각되어 잔차 간의 자기상관 있는 것으로 나타남
confint(sel)  #회귀계수에 대한 95% 신뢰구간 분석 

#모형의 비교
fit_s=lm(Delinquency~Strain)
fit_t=lm(Delinquency~Strain+Physical+Self_control+Perpetrator, data=cyber_bullying1)
anova(fit_s, fit_t)
#귀무가설 기각되어 fit_t를 최종 모형으로 결정

#2. 단계적 투입방법에 의한 다중회귀분석
library(MASS)
sel=lm(Delinquency~., data=cyber_bullying1)
setp_set=step(sel, direction = 'both')   #변수선택법: both, backward, forward
summary(setp_set)
#Strain, physical, self_control, attachment는 비행에 양의 영향
#perpetrator는 비행에 음의 영향 미침


#15)요인분석
#여러 변수들 간의 상관관계 분석하여 상관 높은 변인들을 묶어 몇 개의 요인으로 규명하고
#그 요인의 의미 부여하는 통계분석 방법으로 측정도구의 타당성 파악하기 위함
#타당성은 측정한 것이 실제에 얼마나 가깝게 측정되었는가를 나타냄
#연구의 방향 파악하기 위한 탐색적 목적
#절차:
#(1)모상관행렬이 단위행렬인지 바틀렛 검정으로 검정하여 귀무가설 기각되면 상관관계가 
#   통계적으로 유의하여 요인분석 적합
#(2)최소요인 추출단계에서 얻은 고유치를 스크리차트로 표시한 경우 한 군데 이상 꺾여 있으면 적합
#(3)요인수 결정: 고유값이 1보다 크면 1개 이상의 변수 설명할 수 있다는 것
#(4)요인부하량은 각 변수와 요인 간 상관관계 정도를 나타내는 것으로 해당 변수를 설명하는 비율, 
    #절대값 0.4 이상이면 유의
#(5)요인회전: 요인에 포함되는 변수 분류 명확히 하기 위해 요인축 직각/사각 회전 사용

#ex)사이버 학교폭력에서 청소년 긴장요인을 측정하기 위해 수집된 28개 긴장변수는 타당한가?
#1차 요인분석
rm(list=ls())
cyber_bullying=read.table(file='cyber_bullying_factor_strain28.txt', header = T)
attach(cyber_bullying)
fact1=cbind(Domestic_violence,Child_abuse,Parent_divorce,Economic_problem,
            Friend_Violence,           
            Break_up,                   School_control,             Academic_stress,           
            School_records,             School_violence_experience, Transfer,                  
            Individualism,              Materialism,                Bullying_culture,          
            Class_society,              Hell_Korea,                 Female_dislike,            
            Interested_soldier,         Traffic_accident,           Game,                      
            Internet_addiction,         Celebrity,                  Movie,                     
            Adult,                    Gag,                        Chat_app,                  
            Youtube,                  Personal_broadcasting)

#KMO와 Bartlett 구형성 검정
library(psych)
KMO(fact1)
bartlett.test(list(Domestic_violence,Child_abuse,Parent_divorce,Economic_problem,
                   Friend_Violence,           
                   Break_up,                   School_control,             Academic_stress,           
                   School_records,             School_violence_experience, Transfer,                  
                   Individualism,              Materialism,                Bullying_culture,          
                   Class_society,              Hell_Korea,                 Female_dislike,            
                   Interested_soldier,         Traffic_accident,           Game,                      
                   Internet_addiction,         Celebrity,                  Movie,                     
                   Adult,                    Gag,                        Chat_app,                  
                   Youtube,                  Personal_broadcasting))
#KMO값이 0.52이며 바틀렛 검정 결과가 유의하여 상관행렬이 요인분석 하기에 적합하다

#스크리차트 
library(graphics)
scr=princomp(fact1)  #주성분분석
screeplot(scr, npcs=21, type = 'lines', main='scree plot')
#가로축은 요인의 수, 세로축은 고유값의 분산
#요인 6부터 크게 꺾이는 형태를 보여 요인분석에 적합한 자료인 것으로 나타남

#고유값 산출
eigen(cor(fact1))$val  #벡터의 고유값 산출(요인 수 결정)
#요인분석의 목적은 변수의 수를 줄이는 것이므로 고유값이 1 이상인 요인은 9개로 나타남

#1차 요인분석
FA1=factanal(fact1, factors = 9, rotation = 'none')  #요인분석
FA1
VA1=factanal(fact1, factors = 9, rotation = 'varimax')
VA1
#1차 직각회전 요인분석 결과 각 요인에서 요인부하량이 0.3 미만인 변수는 제거한 후 2차분석
#21개의 변수에서 9개의 변수가 제거됨

#2차 요인분석 고유값 산출
fact1=cbind(Domestic_violence,Child_abuse,Parent_divorce,Economic_problem,
            Friend_Violence,         Academic_stress,           
            School_violence_experience,              Materialism,          Game,                      
            Internet_addiction,               Movie,               Chat_app)
eigen(cor(fact1))$val
#고유값이 1 이상인 요인은 5개

#2차 요인분석
VA1=factanal(fact1, factors = 5, rotation = 'varimax')
VA1
#요인1의 설명령은 7%
#학교폭력요인/가정폭력요인/경제적 요인/학업스트레스요인/게임요인으로 명명

#이분형 로지스틱 회귀분석
regression_factor=read.table(file='regression_factor_score.txt', header = T)
summary(glm(Attitude~Factor1+Factor2+Factor3+Factor4+Factor5, family=binomial,
            data=regression_factor))   #이분형 로지스틱회귀
exp(coef(glm(Attitude~Factor1+Factor2+Factor3+Factor4+Factor5, family=binomial,
            data=regression_factor))) #오즈비
exp(confint(glm(Attitude~Factor1+Factor2+Factor3+Factor4+Factor5, family=binomial,
             data=regression_factor)))   #신뢰구
library(lm.beta)
#요인 1과 2는 학교폭력에 부정적 감정이 높으며, 3,4,5는 긍정적 감성이 높음
lm1=glm(Attitude~Factor1+Factor2+Factor3+Factor4+Factor5, family=binomial,
        data=regression_factor)
lm.beta(lm1)
#요인 1,2 순으로 부정적 감정이 높으며, 3,4,5 순으로 학교폭력에 대한 긍정적 감정 높음


#16)신뢰성 분석
#동일한 개념에 대해 반복적으로 측정했을 때 나타나는 측정값들의 분산
#측정한 다변령 변수 사이의 일관된 정도를 의미
#크론바흐 알파계수 이용해 신뢰성 구함

#ex)8개의 GST 요인에 포함된 변수에 대한 신뢰성을 측정하라
library(psych)
rm(list=ls())
cyber_bullying=read.table(file='cyber_bullying_reliability.txt', header = T) ##
attach(cyber_bullying)
factor1=cbind(Strain, Physical, Psychological, Self_control, Attachment,
                      Passion, Perpetrator, Delinquency)   #신뢰성 분석에 필요한 변수
alpha(factor1)
#GST요인에 포함되어 있는 변수들의 표준화 신뢰도(std.alpha)는 0.41,
#self_control 제거했을 때 신뢰도가 0.47로 향상되어, self_control 제거하고 2차 신뢰성 분석

#2차 신뢰성 분석
factor1=cbind(Strain, Physical, Psychological, Attachment,
              Passion, Perpetrator, Delinquency)
alpha(factor1)
#GST 요인에 포함되는 변수들의 표준화 신뢰도는 0.49로 나타



#17)다변량 분산분석
#MANOVA는 2개 이상의 독립변수와 2개 이상의 종속변수들의 평균 차이를 검정

#ex)사이버 학교폭력 관련 독립변수(account, channel) 간에 종속변수(onespread, twospread)의
#평균의 차이가 있는가?
rm(list=ls())
cyber_bullying=read.table(file='cyber_bullying_descriptive_analysis.txt', header = T) 
attach(cyber_bullying)
tapply(Onespread, Channel, mean)
tapply(Onespread, Channel, sd)
tapply(Onespread, Account, mean)
tapply(Onespread, Account, sd)
tapply(Onespread, list(Channel,Account), mean)
tapply(Onespread, list(Channel,Account), sd)
#채널별 순계정별 1주 확산수의 평균과 표준편차
tapply(Twospread, Channel, mean)
tapply(Twospread, Channel, sd)
tapply(Twospread, Account, mean)
tapply(Twospread, Account, sd)
tapply(Twospread, list(Channel,Account), mean)
tapply(Twospread, list(Channel,Account), sd)
#채널별 순계정별 2주 확산수의 평균과 표준편차
#최초문서보다 확산문서가 트위터의 1주 확산수와 2주 확산수의 평균이 높은 것으로 나타남

#다변량 분산분석
y=cbind(Onespread, Twospread)
Mfit=manova(y~Account+Channel+ Account:Channel)  #이원 다변량 분산분석
Mfit
summary(Mfit, test='Wilks')
summary(Mfit, test='Pillai')
summary(Mfit, test='Roy')
summary(Mfit, test='Hotelling')
#account와 channel 집단 간 1주 확산수와 2주 확산수는 유의한 차이가 있는 것으로 나타남
#상호작용 효과검정에서 account*channel의 월크스 람다는 .943이며 유의한 차이가 나타나, 
#상호작용이 없다는 귀무가설 기각되어 channel 중 트위터에서의 확산문서(spread)의
#1주 확산수와 2주 확산수의 평균이 가장 큰 것으로 나타남 

#개체 간 효과 검정
summary.aov(Mfit)
#account에 따른 1주 확산수와 2주 확산수의 평균은 유의한 차이가 있다
#channel에 따른 1주 확산수와 2주 확산수의 평균에도 유의한 차이가 있다
#account*channel에 따른 1주 확산수와 2주 확산수의 평균에도 유의한 차이가 있다



#18)이분형 로지스틱 회귀분석
#독립변수들이 양적 변수를 가지고 종속변수가 2개범주를 갖는 회귀모형 분석

#ex)사이버 학교폭력 감정(attitude(negative/positive))에 영향 미치는 GST요인은 무엇인가?
rm(list=ls())
cyber_bullying=read.table(file='cyber_bullying_methodology_numeric.txt', header = T) 
input=read.table('input_binary_logistic.txt', header = T, sep=",")
output=read.table('output_binary_logistic.txt', header = T, sep=",")
attach(cyber_bullying)
input_vars=c(colnames(input))
output_vars=c(colnames(output))
form=as.formula(paste(paste(output_vars,collapse = '+'),'~',paste(input_vars, collapse = '+')))
form
summary(glm(form, family = binomial, data = cyber_bullying))
exp(coef(glm(form, family = binomial, data = cyber_bullying)))   #오즈비
exp(confint(glm(form, family = binomial, data = cyber_bullying)))  #신뢰구간 
#Strain, Physical, psychological, perpetrator, delinquency는 사이버 학교폭력에 부정적 영향
#self_control, attachment, passion은 긍정적 영향을 줌

#이분형 로지스틱 회귀모형의 결정계수 산출
library(pscl)
model=glm(form, family = binomial, data = cyber_bullying)
pR2(model)
#결정계수 r2CU가 2.229로 나타나 추정 로지스틱 회귀모형이 데이터셋이 분산을 약 22.9% 설명함 



#19)다항 로지스틱 회귀분석
#독립변수들이 양적 변수를 가지며 종속변수가 3개 이상의 범주 갖는 회귀모형
library(nnet)
rm(list=ls())
cyber_bullying=read.table(file='cyber_bullying_multinomial_logistic.txt', header = T) 
input=read.table('input_binary_logistic.txt', header = T, sep=",")
output=read.table('output_multinomial_logistic.txt', header = T, sep=",")
attach(cyber_bullying)
input_vars=c(colnames(input))
output_vars=c(colnames(output))
form=as.formula(paste(paste(output_vars,collapse = '+'),'~',paste(input_vars, collapse = '+')))
form
model=multinom(form, data = cyber_bullying)
summary(model)
z=summary(model)$coefficients/summary(model)$standard.errors
#multinom 함수는 p-value를 산출할 수 없으므로 z-test(wald tests) 사용해 p-value 산출
p=(1-pnorm(abs(z),0,1))*2   #p-value
p
exp(coef(model))
exp(confint(model))
#사이버 학교폭력 유형에 영향 미치는 GST 요인에 대한 다항 로지스틱 회귀분석 결과는
#Strain과 Delinquency 요인은 피해자(2), 방관자(3), 복합형(4)보다 가해자(1)에 영향 미침
#Physical요인은 가해자보다는 피해자, 복합형에 영향, 방관자보다는 가해자에 영향
#나머지는 가해자보다 피해자, 방관자, 복합형에 영향 미침 