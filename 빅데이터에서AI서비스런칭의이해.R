###########################################################
#데이터에 대한 파악
######step 1
attributes(iris)
summary(iris)
range(iris$Sepal.Length)
range(iris[,1])
range(iris[,2:3])
quantile(iris$Sepal.Length)
p <- 0.3
quantile(iris$Sepal.Length,p)
quantile(iris$Sepal.Length , seq(0, 1, by=0.1))
iris[(length(iris$Sepal.Length)-5):length(iris$Sepal.Length),]
iris$Sepal.Length[1:6]
iris[1:6,"Sepal.Length"]
apply(iris[,1:4] , 1, function(row) { print(row) })
###########################################################
#데이터에 추가 변수를 생성하거나 
#데이터에 대한 요약(조건)정보를 새로운 데이터로 구성
######step 2
######이때 추가변수를 생성해 두면 후에 통계법이나 머신러닝법 적용했을때
######분석 결과가 좋지 않은 게 나오는 것을 방지가능
#####나중에 하는것보다 이단계에서 하는 것이 좋음
#####현업 부서와도 커뮤니케이션해서 이런것 보고 싶다한것을 변수로 생성해서 추가

install.packages("plyr")
library(plyr)
sss<-adply(iris, 1, function(row){ row$Sepal.Length >= 5.0 &
    row$Species=="setosa"})
abc<-adply(iris,1,function(rowwww)
{data.frame(sepal5upsetosa =c(row$Sepal.Length >= 5.0 &
                                row$Species == "setosa"))})
head(abc,10)
ddply (iris,.(Species),
       function(sub) {
         data.frame(sepal.width.mean = mean (sub$Sepal.Width))
       })
#.()안에 있는 변수및 조건ㅇ 기준의
#       function (sub) {
#       data.frame ( 새로생성되는변수명 = 값변수에 입력될 값)
#
ddply (iris,.( Species , Sepal.Length>5.0),
       function (sub123) {
         data.frame ( sepal.width.mean1234 = mean (sub123$ Sepal.Width ))}
)
# 데이터셋의 열이름(Sepal.Length, Sepal.Width)에 직접접근
with (iris , {
  print (mean(Sepal.Length ))
  print (mean (Sepal.Width ))
})
par(mfrow=c(1,2))
with(iris, plot(Sepal.Length, Sepal.Width, col=Species, pch=as.numeric(Species)))
##################################################################################
#결측값과 중복값
#3-1 결측값 처리##################################################################
####결측값을 해당 그룹의 median으로 대체
######step 3
######결측값이 있으면 대부분의 함수가 결과값을 출력 못함.
iris_repl<-iris
head(iris_repl)
iris_repl[1, 1] = NA #결측값
head(iris_repl)
?split
#split(분리대상데이터,분리기준)
#대체할 값 tableA 생성
replasement_df <- sapply(split(iris_repl$Sepal.Length,iris_repl$Species),
                         median, na.rm = TRUE )
replasement_df
?within
#결측인지 찾은후 대체할 값 생성(tableA)에서 찾아서 해당값으로 대체
#ifelse( is.na(Sepal.Length), replasement_df[Species], Sepal.Length )
#ifelse(조건,조건이참일때 실행, 조건이 거짓일때 실행)
iris_repl <- within(iris_repl, 
                    {
                      Sepal.Length <- ifelse( is.na(Sepal.Length), replasement_df[Species], Sepal.Length )
                    })
#데이터셋1[데이터셋2]
#replasement_df[iris_repl$Species]
#잘바뀌었는지 확
head(iris_repl)


#3-2. 중복값 확인과, missing의 확인
######step 7
install.packages("Hmisc")
library(Hmisc)
describe(iris)
iris$Species
as.numeric(iris$Species)


###################################################################################33
#4. 데이터에 대한 집계정보(기술통계,설명하기위한)

head(subset(iris , select =c(Sepal.Length , Species )))
subset (iris , select =-c(Sepal.Length, Species ))
#Petal.Width를 Petal.Width변수 기준으로 summary()함수를 적ㅇ
aggregate(Petal.Width ~ Species, summary, data=iris)
#head(iris[order(iris$Sepal.Length), ])
#head(iris[order(iris$Sepal.Length,iris$Petal.Length), ])
order(iris$Sepal.Width)#order() 순위
iris[order(iris$Sepal.Width),]

install.packages("doBy")
library(doBy)
orderBy(~ Sepal.Width , iris)
orderBy(~ Species + Sepal.Width , iris)
split (iris , iris $ Species )
lapply(split(iris$Sepal.Length , iris$Species), mean )

#종별(factor)기준 여러변수(iris[,1:4])의 평균
?aggregate
#그룹별 평균
aggregate(iris[,1:4],by=list(iris$Species),FUN=mean)
#                    by=iris[c("Species")]
#그룹별 summary 값
aggregate(iris[,c(1,3)],by=list(iris$Species),summary)
#Species123이 첫번째 열에 이름으로
aggregate(iris[,c(1,3)],by=list(Species123=iris$Species),summary)
aggregate(iris[,c(1,3)],by=list(Species=iris$Species),mean)
aggregate(iris[,c(1,3)],by=list(iris$Species),mean)
lapply(iris[, 1:4],mean)
sapply(iris[, 1:4],mean)
class(sapply(iris[,1:4],mean))

#sapply()결과 data.frame 로 저장
x <- sapply(iris[,1:4], mean)
as.data.frame(x)
as.data.frame(t(x))
#sapply()를 각 열에 저장된 데이터의 클래스를 확
#◯ sapply()에 인자로 주어진 함수의 출력이 여러행이라면 행렬이 반환된다.
#다음 예에서는 iris의 숫자형 컬럼들에 대해 각 값이 3보다 큰지의 여부를 반환한다. 
#그리고 이때 반환된 결과의 클래스는 행렬이다.
sapply(iris,class)
y <- sapply(iris[,1:4], function(x){ x > 3 })
class(y)
y


#컬럼평균,행평균
apply(iris[,1:4],2,sum)
colSums(iris[,1:4])
#lapply의 결과는 list object
lapply(iris[,1:4], mean )
colMeans(iris[,1:4])
#list형식을 unlist 로 각각의로 나눈다음에 matrix()하고 data.frame object로 변환
(d <- as.data.frame(matrix(unlist(lapply(iris [,1:4],mean)), ncol =4, byrow = TRUE )))
(names (d) <- names(iris[, 1:4]))
t(d)
#(data.frame(do.call(cbind,........
(data.frame(do.call(cbind, lapply(iris[, 1:4],mean))))
#<-tapply(iris$Sepal.Length, iris$Species, mean)
#<-mapply(mean,iris [1:4])



##############################################################################################
#5 변수의 유형(문자, 숫자등)별 추출
#활용 추출한 변수로 데이터셋 구성등
#변수의 유형을 확인
#변수별 분석 위해
#데이터에 대한 집계정보(기술통계,설명하기위한)
#다른 데이터셋(특정 변수들만 추출)으로 구성한 후에 집계정보
sapply(iris,is.numeric)
#명목형인지 확인
sapply(iris,is.factor)
sapply(iris,is.character)
#변수유형별 추출
irisSa<- iris[,sapply(iris,is.numeric)] #숫자인 변수만 추출해서"irisSa"에저장 
#risSa<- iris[,sapply(iris,is.numeric)] 
risSanotnum<- iris[,!(sapply(iris,is.numeric))] 
iris_fact<-iris[,sapply(iris,is.factor)]  
#저장
write.csv(iris_fact,"iris_fact.csv")
getwd()




#6.##############################################################
#결측값등의 처리가 끝나고 데이터셋구성이 완료된후
#두 컬럼의 평균 계산하기와 도시
# 데이터셋의 열이름(Sepal.Length, Sepal.Width)에 직접접근
> with (iris , {
  +    print (mean(Sepal.Length ))
  +    print (mean (Sepal.Width ))
  +    })
[1] 5.843333
[1] 3.057333

with()를 사용해서 iris 데이터셋의 열이름(Sepal.Length, Sepal.Width)에 직접접근하여
도표를 그리세요.
str(iris)
#with() 의 agr는 with(data, 명령어,..........)
#주의사항 형태가  with() 안에 plot() 가 들어가야한다.
# with(  ...., plot())
 with(iris, plot(Sepal.Length, Sepal.Width, col=Species, pch=as.numeric(Species)))

# 여러 집단을 함께 산점도에 표시
#도식 + 표
#plot(x축변수, y축변수,col=색, pch=모양)
par(mfrow=c(1,1))
plot(iris$Petal.Length, iris$Petal.Width,col=iris$Species,
     pch=as.numeric(iris$Species))

legend(1, 2.5,
       legend=levels(iris$Species),
       pch=1:length(levels(factor(iris$Species)))
       ,col=1:length(levels(factor(iris$Species))))
aggregate(iris[,c(1,3)],by=list(iris$Species),summary)
#as<-aggregate(iris[,c(1,3)],by=list(iris$Species),summary)
#write.csv(as,"aggre_iris.csv")
#getwd()한 폴더에서 csv 파일 보고 해석

plot(iris$Petal.Length,
     iris$Sepal.Length,
     pch=as.integer(factor(iris$Species)),
     col=as.integer(factor(iris$Species)))

legend(1, 8,
       legend=levels(iris$Species),
       pch=1:length(levels(factor(iris$Species)))
       ,col=1:length(levels(factor(iris$Species))))

#도식 파이도표
table(iris$Species)
pie(table(iris$Species))
names(iris)


##데이터에 중복이 많은 경우 사용 jitter
#자료의 흩어짐을 정확히 파악
#jitter()
#jitter 의 기능은 점이 중복될 경우
#아주 작은 랜덤 수자를 좌표에 가감하여 점이 비껴서 찍히도록 하는 기능
#plot(x축변수,y축변수,xlab="x축이름",ylab="y축이름",
#       xlim=c(x축최소값,x축최대값),ylim=c(y축최소값,y축 최대값),
#     pch=점모양)
windows(40,40)
par(mfrow=c(1,3))
plot(iris[,3],iris[,4],xlab="Petal.Length",ylab="Petal.Width"
     ,xlim=c(0,7),ylim=c(0,3),pch=1)
plot(jitter(iris[,3],amount=0.2),jitter(iris[,4],amount=0.2)
     ,xlab="Petal.Length",ylab="Petal.Width"
     ,xlim=c(0,7),ylim=c(0,3),pch=2)

sunflowerplot(iris[,3],iris[,4],xlab="Petal.Length",ylab="Petal.Width"
              ,xlim=c(0,7),ylim=c(0,3),pch=1)

#3차원도표,변수 3개 도표
install.packages("scatterplot3d")
library(scatterplot3d)
iris_setosa = iris[iris$Species=="setosa",]
iris_versicolor = iris[iris$Species=="versicolor",]
iris_virginica = iris[iris$Species=="virginica",]
#창정리
par(mfrow=c(1,1))
#type="n"은 내부에 아무것도 그리지 않음
d3 <- scatterplot3d(iris$Petal.Length, iris$Sepal.Length,
                    iris$Sepal.Width,type="n" )
#검정동그라미
d3$points3d(iris_setosa$Petal.Length, iris_setosa$Sepal.Length, 
            iris_setosa$Sepal.Width,bg="black", pch=21)

#빨강네모:iris_versicolor 데이터셋을 기준으로 x축 y축, z축을 입력하여 점으로 그림
d3$points3d(iris_versicolor$Petal.Length, iris_versicolor$Sepal.Length, 
            iris_versicolor$Sepal.Width,bg="red", pch=22)

#파랑세모:_iris_virginica 데이터셋을 기준으로 x축 y축, z축을 입력하여 점으로 그림
d3$points3d(iris_virginica$Petal.Length, iris_virginica$Sepal.Length, 
            iris_virginica$Sepal.Width,bg="blue", pch=24)

#음영예제,변수 3개
#x축, y축, 음영 변수
install.packages("lattice")
library(lattice)
#levelplot(음영으로사용할 변수~x축*y축, 데이터셋,기타)
levelplot(Petal.Width~Sepal.Length*Sepal.Width, iris,
          cuts=9,col.regions=grey.colors(10)[10:1])


#개체(obs=레코드=표본=행)의 변화를 파악하기위한 도표
install.packages("lattice")
library(lattice)
#parallelplot(~그릴변수 | 패널을 구분할 변수,...)
parallelplot(~iris[1:4] | Species, data=iris)
parallelplot(~iris[1:4], data=iris)


# 그룹별로 변수의  평균을 연결한 도표
#각 변수의 교호작용(상호작용)여부 파악 하기 위해
#->분산분석 검정등으로 해당변수 삭제 여부결정등 생각 필요
#일정시점을 지난 다음에는 변수간의 영향 관계의 방향(+,-)이 변함.
#도표가 복잡해 질때에는(그리기 옵션을 일일이 지정하는 경우)
#pch, col등의 옵션에 사용설정값을 변수로 저장해서 
#반복해서 사용할 때 유용하게 사용가능
plot(x=c(1,3),y=c(0,12),pch=22,type="n",
     xaxt="n",yaxt="n",ylab="Length",xlab="Species")
vAttr <- c("Sepal.Length","Sepal.Width","Petal.Length","Petal.Width")
vSym <- c(21,22,23,24)
vCol <- c(2,3,4,5)
# 보조 도포함수, x축,
axis(1,at=1:3,labels=levels(iris$Species))
# y축의 명칭 표시
axis(2,at=0:12)
# 각 속성의 평균을 구한 후 라인 표시
lines(aggregate(Sepal.Length ~ Species,mean,data=iris),type="b",col="gray")
lines(aggregate(Sepal.Width ~ Species,mean,data=iris),type="b",col="gray")
lines(aggregate(Petal.Length ~ Species,mean,data=iris),type="b",col="gray")
lines(aggregate(Petal.Width ~ Species,mean,data=iris),type="b",col="gray")

# 각 속성의 평균을 구한 후 점을 표시
points(aggregate(Sepal.Length ~ Species,mean,data=iris),pch=vSym[1],bg=vCol[1],col=1)
points(aggregate(Sepal.Width ~ Species,mean,data=iris),pch=vSym[2],bg=vCol[2],col=1)
points(aggregate(Petal.Length ~ Species,mean,data=iris),pch=vSym[3],bg=vCol[3],col=1)
points(aggregate(Petal.Width ~ Species,mean,data=iris),pch=vSym[4],bg=vCol[4],col=1)
# 범례(legend)박스 표시
legend(1,12,legend=vAttr,pch=vSym,pt.bg=vCol,cex=0.8)

###################################################
#7.밀도
#데이터 분포 파악
#4개의 변수에 대한 밀도그림 하나로
par(mfrow=c(2,2))
hist(iris[,1], freq=FALSE)
lines(density(iris[,1]))
abline(v=mean(iris[,1]),lty="dotted")
abline(v=median(iris[,1]),col="red",lty="dotted")
abline(v=quantile(iris[,1],c(0.25,0.75)),col="green")
abline(v=quantile(iris[,1],c(0.95)),col="red",lwd=2)

hist(iris[,2], freq=FALSE)
lines(density(iris[,2]))
abline(v=mean(iris[,2]),lty="dotted")
abline(v=median(iris[,2]),col="red",lty="dotted")
abline(v=quantile(iris[,2],c(0.25,0.75)),col="green")
abline(v=quantile(iris[,2],c(0.95)),col="red",lwd=2)

hist(iris[,3], freq=FALSE)
lines(density(iris[,3]))
abline(v=mean(iris[,3]),lty="dotted")
abline(v=median(iris[,3]),col="red",lty="dotted")
abline(v=quantile(iris[,3],c(0.25,0.75)),col="green")
abline(v=quantile(iris[,3],c(0.95)),col="red",lwd=2)

hist(iris[,4], freq=FALSE)
lines(density(iris[,4]))
abline(v=mean(iris[,4]),lty="dotted")
abline(v=median(iris[,4]),col="red",lty="dotted")
abline(v=quantile(iris[,4],c(0.25,0.75)),col="green")
abline(v=quantile(iris[,4],c(0.95)),col="red",lwd=2)
#######################################################
#8. 데이터(각변수)가 분포가 정규분포를 따르는지 확인
#밀도까지 파악하고 그림을 그리고 나서,
#다음단계로는 
#데이터(각변수)가 분포가 정규분포를 따르는지 확인
#변수의 정규성 검정--> 통계적 검정
#-> 비모수적 검정 분석
#정규성을 따르는 변수는 모수적 검정가능(통계)
#귀무가설
#가설
#귀무가설: "데이터가 정규분포를 따른다"
#p-value 값이 작으면 귀무가설 기각(정규분포를 안따른다.)
#유의수준은 임의로 설정
#유의수준+신뢰도 =1
#신뢰도는 일반적으로 90%~99%범위내에서 사용
#89%신뢰도는?
#shapiro.test()

str(iris)
shapiro.test(iris$Sepal.Length)
shapiro.test(iris$Sepal.Width)#-->평균차이검정,아노바
shapiro.test(iris$Petal.Length)#
shapiro.test(iris$Petal.Width)

#정규분포를 따르는 변수가 1개이므로
#머신 러닝(스켈링,패턴을 찾음)적 분석을 사용
######################################################
#9.
#여기까지 한후 결과가 의미가 없으면, step2 단계부터 다시
######기존변수를 토대로 추가변수를 생성(데이터셋을 보강)
#의사결정나무
#분류(붓꽃의종류분류)에 어떤 변수가 가장 많은 영향을 미치는지
#install.packages("tree")
library(tree)
ir.tr <- tree(Species ~., iris)
ir.tr
par(mfrow=c(1,1))
summary(ir.tr)
plot(ir.tr);  text(ir.tr)
########################################################
library(rpart)
(m <- rpart(Species ~., data = iris ))
plot(m, compress =TRUE , margin =.2)
text(m, cex =1.5)
par(mfrow=c(1,1))

library(rpart.plot)
prp(m, type =4, extra =2, main="extra=2")


prp(m, type =4, extra =1,main="extra=1")


#4 Class models: probability per class of observations in the node
prp(m, type =4, extra =4,main="extra=4")
prp(m, type =4, extra =104)
###########################
library(party)
#변수중 levels 가 있는 변수를 Species 위치에
(m <- ctree(Species~., data = iris ))
plot(m)

###########################################################
#10. 훈련데이터와 테스트데이터로 분할하여서
#훈련데이터에서 생성한 모형이 테스트데이터에서도
#잘 적용되는 지 확인하여
#모형을 결정
par(mfrow=c(2,2))
#freq=FALSE 로 왼쪽 축이 비율값으로
?hist
#a vector giving the breakpoints 
#between histogram cells
aa<-hist(iris$Sepal.Length,
         freq=FALSE,breaks=13)
#aa$breaks
#밀도ㅅ
lines(density(iris$Sepal.Length))
#Sepal.Width 대한 히스토그램과 밀도
hist(iris$Sepal.Width, freq=FALSE,breaks=24)
lines(density(iris$Sepal.Width))

hist(iris$Petal.Length, freq=FALSE,breaks=50)
lines(density(iris$Petal.Length))

hist(iris$Petal.Width, freq=FALSE,breaks=40)
lines(density(iris$Petal.Width))
#plot(변수들,col=as.integer(factor형 변수),
#substring((iris$Species),1,1)
#pch=점의 모양
plot(iris[,1:4],col=as.integer(iris$Species),
     pch=substring((iris$Species),1,1))


###머신러닝법중 의사결정나무 적용
#랜덤하게 변수를 추출할때 중심을 잡음
set.seed(1234)
#prob=c(0.7,0.3)은 전체데이터를 70%와 30%로 나눔(대략적인 나눔)
#?sample
#sample(2, iris데이터의 행개수,기타) 2등분
ind<-sample(2, nrow(iris),
            replace=TRUE, prob=c(0.7,0.3))
ind
#모형(수식)을 만들기 위한 학습 데이터
trainData<-iris[ind==1,]
#학습데이터에서 생성된 모형을 평가하기 위한데이터
testData<-iris[ind==2,]
# 모형에 사용할 변수들
myFormula<-Species ~Sepal.Length + Sepal.Width +Petal.Length+Petal.Width

#학습용데이터를 사용해서 모형 생성
library(party)
iris_ctree <-ctree(myFormula, data=trainData)
##정확도를 판단
#table(x위치,Y의 위치)
#table(학습용데이터로생성된iris_ctree모형으로 예측한값,실제값)
table(predict(iris_ctree),trainData$Species)

print(iris_ctree)
plot(iris_ctree)
plot(iris_ctree, type="simple")
#모형의 평가
#모형이 잘예측하는지 테스트 데이터에서 확인
testPred<-predict(iris_ctree, newdata=testData)
table(testPred,(testData$Species))
?install.packages
#install.packages("패키지명",dependencies=FALSE)
