#사용가능한 데이터셑을 리스트로 조회
data()
example(plot)
?plot

#현재 로드된 packages 목록조회
install.packages("vcd")
library(vcd)
search()

library(nnet)
example(nnet)
search()
install.packages("plyr")
library(plyr)
install.packages(c("ade4", "ape", "cluster"))
install.packages("SnowballC", repos="http://R-Forge.R-project.org")
library(SnowballC)
#source_data_package
install.packages("C:/source_data_package/tm_0.5.tar.gz", repos=NULL, type="source")
library()
search()

#library(),search(),detach(), 사용 예제
install.packages("zoo")
library(zoo)
search()
detach(package:zoo)
search()
suppressMessages(require(zoo))
search()
detach(package:zoo)
search()
library()

#21,설치된 패키지 삭제
#tm 
install.packages("tm")
#install.packages("plyr")
library()
remove.packages("tm")
#remove.packages("plyr")
library()

#24p
data()
AirPassengers
CO2
head(CO2,5)
dim(CO2)# 84행개수, 5열개수
str(CO2)# object, 변수(속성)명, ..........
CO2$Plant#열
?CO2
data(CO2)
str(CO2)
#CO2[row index,col index]
CO2[,1:2]
CO2[1,1:2]
CO2[1,2:3]
CO2[1,c(2,5)]
#하드디스크에 저장하기
write.csv(CO2,"C:/Users/ha/Documents/Camtasia Studio/CO2_R.csv")

#25p. 
install.packages("rpart")
library(rpart)
data(package = "rpart")
#27p.
data(BOD)
#BOD[행,열]
#열단위로 불러오기
BOD[,1]
BOD$Time
#행단위로 불러오기 
BOD[1,]
####################
#29
install.packages("datasets")
library(datasets)
data("ChickWeight")
str(ChickWeight)
#열단위
ChickWeight$weight
ChickWeight[,1]
#행단위
ChickWeight[1,]

###########################################
#chapter 03
getwd()
x <- 1:5
y <- 6:10
save(x, y, file ="xy.RData")
getwd()
rm(list =ls())

x
y
load("xy.RData")
x
y

#36p
#현재작업중인 디렉토리 경로 변경하기
#C드라이브에source_data_package 폴더가 있어야함.
setwd("c:/source_data_package")
getwd()
#setwd(“folder name”)
read_file<-read.csv("c:/source_data_package/test.csv")
str(read_file)
##########################################
#44p
mY1<-1
mY1
is.vector(mY1)
########## <- ########### =  ####

 sum(vv2<-1)
#[1] 1
 vv2
#[1] 1
#sum(vv3=1)를 실행해도, vv3이 Environment에 생성되지않았어요.
sum(vv3=1)
#[1] 1
vv3
#Error: object 'vv3' not found
#동영상 으로 볼수 있는 URL
#https://youtu.be/2V3XNXZO2zw

################################
vV <- c(10,20,30)
vV
#10부터 15까지의 값 입력 
vx<-10:15
#""
V_tax <- c("1문자", "2문자", "3문자")
V_tax
1:5
6:10
seq(from=0, to=10,by=2)

#46p. rep() “1 2 1 2 1 2 1 2”
rep(1:2,4)
#rep() “1 1 2 2 1 1 2 2 1 1 2 2 1 1 2 2”
rep(1:2,each=2)

rep(1:2,times=4,each=2)

rep(1:2,times=4,length.out=8, each=2)

#########################################
#55p
vX <- 3.1
vX
is.double(vX)

vY <- vX + 0.9
vY#4정수
is.double(vY)


inte <- as.integer(5)
inte <- inte + 3
is.integer(inte)
######################################
cn2<-as.numeric(c("-.1",2.7,"B"))
cn2

cn1<-as.numeric(c("-.1","2.7","B"))
cn1

is.integer(cn1)
#####################################

cn2<-as.numeric(factor(5:10))
is.integer(cn2)
is.double(cn2)


af<-as.numeric(factor(5:10))
mode(af)
is.integer(af)

factor(5:10)
5:10
as.numeric(factor(5:10))

#알파벳 순서
#Levels :a b c 
#        1 2 3
# a a a c
# 1 1 1 3
x <- c("woman", "man")
x
str(x)
as.factor(x)
as.numeric(as.factor(x))

vChar1 <- c("Test","exam","NA")
vChar1
length(vChar1)
#######################################
5<4
5==4

vX <- TRUE
vX
is.logical(vX)
typeof(vX)
vY <- (1 < 2) & (1 > 2)
vY

#| 
vY <- (1 < 2) | (1 > 2)
vY
#!
as.logical(0)
as.logical(1)
!0
!3

#61p
Sys.Date()
as.Date("05/17/2016")#Error in charToDate(x) 
as.Date("05/17/2016",format="%m/%d/%Y")
#%m 2자리
#%Y 4자리

#62p
dDate <- c("01-15-2016", "02-15-2013")
dDate
is.character(dDate)
tDate <- as.Date(dDate, "%m-%d-%Y")
tDate
mode(tDate)
data.class(tDate)
#63p,Format  불일치하는 형식
dDate2 <- c("05-15-2011", "02-15-2012")
dDate2
tDate2 <- as.Date(dDate, "%Y-%m-%d")
tDate2

dDate <- c("01-15-2016", "02-15-2013")
dDate
is.character(dDate)
tDate <- as.Date(dDate, "%m-%d-%Y")
tDate
tDate+5

#65p,일단위 증가
tStartDate <- as.Date("2015-09-01")
tEndDate <- as.Date("2015-09-10")
seq(from=tStartDate, to=tEndDate, by=2)
seq(from=tStartDate, by=2, length.out=5)

#년단위증가, 월단위증가, 반복 횟수를 지정
by2date<-seq(from=tStartDate, to=tEndDate, by=2)
by2date
seq(from=tStartDate, by="2 month", length.out=3)
seq(from=tStartDate, by="year", length.out=3)
seq(from=tStartDate, by="1year", length.out=3)#'by' error
seq(from=tStartDate, by="3 year", length.out=3)
##################################################
#66, 2월달의 마지막 날짜 확인
as.Date("2014-03-01")-1
as.Date("2015-03-01")-1


format(as.Date("2015-03-01"), format="%W")

#67
tctT1 <- as.POSIXct("2010-06-01 01:01:01")
str(tctT2)
tctT2 <- as.POSIXct("2010-06-15 01:01:01")
str(tctT2)
oDateTimeDiff <- tctT2 - tctT1
oDateTimeDiff
str(oDateTimeDiff)
vDateTime <- c("05-11-15 01:01:01", "05-11-15 01:02:01")
tctDateTime <- as.POSIXct(vDateTime)
tctDateTime + 10
#71, 72
#년,월, 일을 변수로 저장해보세요.
#추출한 년은t_year 변수에 저장
#추출한 월은t_monr 변수에 저장
#추출한 날은t_day 변수에 저장
tCurrent <- as.POSIXlt("2012-05-05")
tCurrent
tCurrent$year
t_year<-tCurrent$year + 1900
t_monr<-tCurrent$mon+1
t_day<-tCurrent$mday
tCurrent$hour
tCurrent1<-as.data.frame(tCurrent)
tCurrent1[1,2]<-tCurrent$year + 1900
#73
tCurrent$wday
tCurrent$yday
as.POSIXlt("2012-05-05")$wday
as.POSIXlt("2012-05-06")$wday
weekdays(Sys.Date())
weekdays(Sys.time())
weekdays(as.POSIXlt("2012-05-05"))
#
length()


#92
vWeight <- c(10,20,30,60)
is.vector(vWeight)
vWeight
names(vWeight) <- c("mouse", "rabbit", "dog", "human")
colnames(vWeight) <- c("m", "r", "d", "h")## colnames() data frames x
vWeight
#mouse rabbit    dog  human 
# 10     20     30     60


##숫자를 c() 함수사용 vector 생성,93
vX<-c(1:5,10)
vX
#"numeric" 이라는 object가 없다
mode(vX)
data.class(vX)
typeof(vX)
#vector(),factor(),data.frame() 
is.vector(vX)

#94
vX3 <- c(TRUE,FALSE,TRUE)
vX3

vector<-c(100,200,300)
vector
#vector변수에서 [첫번째 위치에서: 3번째 위치]
vector[c(1:3,1)]
vX<-c(1:5)
vX
vVectorX<-1:4
vVectorX
vVectorX[1:4] <- c(1,2)
vVectorX

v1<-c(1,2)
v2<-c(3,v1)
v2
#96
vc2<-c("a","b","1,")
vc2
typeof(vc2)
mode(vc2)
length(vc2)

vc2
paste("a",1:10)
?paste

paste("a",1:10,collapse = ", ")

#97
vc<-c("a","b")
vc
vc[1]
vc[2]
vc[3]<-"c"
vc
mode(vc)
is.vector(vc)

#97
#복수의 데이터값을 선택하려면 c()함수를 사용해서, vector를 인덱스로 사용한다.
#떨어져 있는 값을 여러개 호출하는 경우 c(위치1, 위치2, 위치3)
vector<-c(100,200,300,400,500)
vector[c(1,2,1)]

#떨어져 있는 값들을 추출할때 c() 로 묶지 않으면 오류 발생
vector<-c(100,200,300,400,500)
vector[1,3]#error
vector[1,2]#error
vector[c(1,3)]

#98
#입력한 인덱스가 vector 길이를 벗어나면 NA(Not Available)를 출력
vector<-c(100,200,300,400,500)
vector
vector[5]
vector[100] #100번째 위치에 값이 없음
length(vector)
vector[length(vector)]

#99
vX1 <- c(1,2,3,500,4)
length(vX1)
vX1[[length(vX1)]]
#100
vadd<-c( 10, 20, 30, 40, 50, 60)
vadd[10]<-100
vadd
vadd[1]<-101
vadd[1]
vadd[10]<-1001
vadd
many<-c(100,200,300,400)
many[2:3]<-220
many
many<-c(100,200,300,400)
many[2:3]<-c(220,330)
many

###################Type 응용 문제
#http://cafe.naver.com/dataan 에서 데이터 다운로드
getwd()#[1] "C:/Users/ha/Desktop"
aapl<-read.csv("aapl.csv",   header = TRUE)
aapl$Date2<-as.POSIXlt(aapl$Date)
aapl$year<-aapl$Date2$year+1900
aapl$mon<-aapl$Date2$mon+1
aapl$day<-aapl$Date2$mday
aapl$weekdays<-weekdays(aapl$Date2)
################################################
#101
vector<-c(100,200,300,400,500)
#vector[마지막위치]
vector[length(vector)]
#vector[-삭제하고자하는 위치]
vector[-5]
vadd<-c(10,20,30,40,50,60)
#위치지정 <- 입력하고자하는 값
vadd[10]<-100
vadd
# 변수명<- 기존변수에서 입력하고자하는 부분까지만 지정
vadd<-vadd[1:3]
vadd
#102
vVectorX<-c(10,20,30,40,50)
vaddTemp <- vVectorX[c(1:2, 4:5)]
vaddTemp
vVectorX<-c(10,20,30,40,50)
(vaddTemp2 <- vVectorX[-3])
##############################################
vcc<-c(100,200,300,400,500,600)
vcc[-c(1:2)]
#103
vcc[c(-1,-2,-4)]
vcc[c(-1:2,-4)] #Error in vcc[c(-1:2, -4)] : 
vcc[c(-(1:2),-4)]
app<-c(100,200,300,400,500)
app2 <-append(app,c(101,102),after=1)
length(app2)
app2
#104
vWeight <- c(10,20,25,60)
is.vector(vWeight)
names(vWeight) <- c("mouse","rabbit","dog","human")
vWeight
vWeight[length(vWeight)]
colnames(vWeight) <- c("m","r","d","h") #error
vWeight[1]
vWeight["mouse"]
str(vWeight)
#105
vWeight[length(vWeight)]
vWeight[1:4]
vWeight_df<-as.data.frame(vWeight)
vWeight_df[1,1]

#마지말 컬럼명
#names(데이터셋명)[length(데이터셋명)]
names(vWeight)[length(vWeight)]
vWeight1[1,1] #error
vWeight <- c(10,20,25,60)
is.vector(vWeight)
names(vWeight) <- c("mouse","rabbit","dog","human")
names(vWeight)[length(vWeight)-3]


#106
vX1 <- c(10,20,30,40)
vX2 <- c(1, 2, 3, 4)
vX1+vX2
vX1-vX2
vX1*vX2
vX1/vX2

#109
#NA 처리하기
#NA 값이 있으면 연산불가
sum(c(2,NA,2),na.rm=FALSE)
#NA 값을 제외하고 연산
sum(c(2,NA,2),na.rm=TRUE)
sum(c(2,NA,2))
2+NA+2

#110
vX<- c(NA,NA,NA,NA)
sum(is.na(vX))==length(vX)

#111
vv<-c(1,2,3,4,5,6,7,8,9,10)
#5보다 큰값의 위치에 TRUE 
vv>5
#5보다 큰값 출력
#데이터셋명[조건]
vv[vv>5]


##5보다 큰값을 "600"으로 변경
vv[vv>5] <- 600

vv
x1<-c(1,2,3,4)
x1
x2<-c(4,4,4,4)
x1==x2
#############################################
#112
x1!=x2
x1<-c(1,2,3,4)
x2<-c(4,4,4,4)
x1<x2
x1<=x2

#115
#%in%은  앞이기준
vX1 <- c(10,20,30,40,50)
vX2 <- c(20,30)
vX1 %in% vX2
vX2 %in% vX1
#116
vv<-c(10,20,30,20,40)
match(20,vv)#일치하는 첫번째 위치
which(20==vv)#일치하는 모든 위치
#119 빈 vector
vV1<-NA
length(vV1)

vV2<-vector()
length(vV2)

vV3<-NULL
length(vV3)

#vector() 함수로 length만 지정한 경우
#vector()의 기능은  produces a vector of the given length and mode
#vector()함수의 형식은 
#vector(x, mode = "logical", length = 0),
#x는 R object
#vector() 으로 길이 3의 공간을 만듬, type을 지정하지 않았으므로 FALSE 로 할당
y<-vector(length=3)
y
length(y)
y[1]
#y[3]위치에 숫자3값을 입력하면 type이 숫자로 설정 됨
#vector object는 동일한 type 만 저장 가능하므로 
#나머지 y[1]과 y[2]도 type가 숫자로 변경된다. FALSE 가 있었 이므로  0으로 변경된다.
y[3]<-3
y

str(aapl)
#################################################################
#Factor Object
#142, 143
vG<-c("very_bad","bad","normal","good","very_good")
str(vG)
fvG<-factor(vG)
fvG
fvG[1]
fvG[6]<-"bad123"
fvG
#144
levels(fvG)
levels(fvG)[1]
levels(fvG)[3]
levels(fvG)[c(1:2,4:5)]
nlevels(fvG)
#145
x<-c("1","2","1","1")
gender2<-factor(x)
gender2
levels(gender2)


f_6<-c("normal","good","very_good")

(f_6_level<-factor(f_6, c("very_bad","bad","normal","good","very_good")))


#“f” “m” --> “famale” “male” 
#factor(값, levels)
gender<-factor(c("f","m", "f"), c("f","m"))
gender
levels(gender)
gender
nlevels(gender)
#levels를 변경하면 변수안에 있는 값들도 지정한 levels로 변경.
levels(gender) <- c("female","male")
gender


#147, "<"
vG<-c("very_bad","bad","normal","good","very_good")
vG
ord_vG<-ordered(vG,levels=c("very_bad","bad","normal","good","very_good"))
ord_vG
#level을  c(v_b,b,n,g,v_g)로 변경?
levels(ord_vG) <- c("v_b","b","n","g","v_g")
ord_vG

#150
#rheuma데이터를 파악해보세요. 
#구조(vector, Factor,...), 데이터 타입(숫자문자),
#속성(컬럼)의 의미 등.
install.packages("Fahrmeir")
library(Fahrmeir)
?rheuma
str(rheuma)
summary(rheuma)
rheuma$Improvement
edit(rheuma)

#153
(fX <- factor(c("KA", "AS", NA, "EU", "NA", "SA")))
is.na(fX)


###Factor 따라하기 예

emergency_14<-read.csv("e:/00-R/d_icheon_emergency_14_2.csv",header=TRUE)

str(emergency_14)
summary(emergency_14$환자연령)
dim(subset(emergency_14, 구급발생장소유형 == "가정"))
dim(subset(emergency_14, 구급발생장소유형 != "가정"))
emergency_14_e_house<-subset(emergency_14, 구급발생장소유형 == "가정")
plot(emergency_14_e_house$구급발생장소유형,emergency_14_e_house$환자연령)
levels(emergency_14_e_house$구급발생장소유형)
emergency_14_e_house$구급발생장소유형<-factor(emergency_14_e_house$구급발생장소유형)
levels(emergency_14_e_house$구급발생장소유형)
summary(emergency_14_e_house)
##################################################
vG<-c("very_bad","bad","normal","good","very_good")
str(vG) 
vG<-ordered(vG,levels=c("very_bad","bad","normal","good","very_good"))
str(vG)
vG
vGnumberic<-as.double(vG)
vGnumberic
summary(vGnumberic)
###################################################
#Matrix Object
#168 p.p.
mX <- matrix(1:6,ncol=2)
mX
#169
mX <- matrix(1:6, nrow=2)
mX
mX <- matrix(1:6, 3, 2, byrow=T)
mX
data.class(mX)
mode(mX)
typeof(mX)
dim(mX)
#170
mX2 <- 1:6
mX2
#  dim(데이터셋)<-c(행개수, 열개수)
dim(mX2) <- c(3,2)
mX2

data.class(mX2)
mode(mX2)
tex1<-c("1","2","3","4","5,","6","7","8","9")
tex1
mXtex <- matrix(tex1)
mXtex
mXtexnume <- matrix(tex1,colClass="numeric")#error
mXtexnume <- matrix(as.integer(tex1))##“5,” --> NA
mXtexnume
data.class(mXtexnume)
#172
#101이 반복됨
#rbind 열의 개수를 일치
mM1<-rbind(c(101,103),c(201,202,203),c(301,302,303))
mM1
#173
mM3<-rbind(c(101,102,103),c(201,202,203),c(301,302,303))
mM3
#3열의 값중에서 300을 초과하는 값
mM3[mM3[,3]>300,]#[1] 301 302 303
#mM3[행의위치,열의위치,drop=F]
mM3[mM3[,3]>300,,drop=F]
#3열의 값중에서 300을 초과하는 값, 그중에서 3열의 위치한
mM3[mM3[,3]>300,3]

#174
mM3<-rbind(c(201,202,203),c(301,302,303))
mM3[mM3[,3]>200,3]
#177
mt10<-matrix(1:100,ncol=10)
mt10
diag(mt10)

#178
mX<-rbind(c(101,102,103),c(201,202,203),c(111,222,333))
mX>200
mX[mX > 200]
mY <- mX
mY[mY > 200] <- 0
mY
#추가 예제
mX<-rbind(c(101,102,103),c(201,202,203),c(222,222,333))
데이터 셋명[ 행위치,열위치,drop=F ]
#아래 예제는 
#데이터셋명[행위치에 열위치값까지 포함 되므로 error]
mX[mX>200,,drop=F]
#179
mX <- matrix(1,2,3)
mX
mY <- matrix(1:6,3,2)
mY
t(mY)
#182
mX3 <- matrix(seq(1,9),nrow=3)
mX3
diag(mX3)
diag(mX3) <- 0
mX3
#183
mX3 <- diag(2,3,3)
mX3
diag(2,3,3)
#191
mtcars
str(mtcars)
(co1<-colnames(mtcars))
(co2<-names(mtcars))
(ro1 <- rownames(mtcars))

#192
(mX <- matrix(c(1,2,3,4,5,6),2,3,byrow=T))
cbind(mX, rowSums(mX))
#193
cbind(mX, rowSums(mX[,2:3]))

#194
mY <- matrix(1:6,3,2)
mY
apply(mY, 1, sum)
apply(mY, 2, sum)
rowMeans(mY)
colMeans(mY)
my1<-cbind(mY, apply(mY, 1, sum),drop=F)
my1
#195
mY <- matrix(1:6,3,2)
my2<-apply(mY, 1, sum)
my3<-apply(mY, 2, sum)
my4<-apply(mY, 1, mean)
my5<-apply(mY, 2, mean)
my11<-cbind(mY,sum1=my2)
my11
my12<-cbind(my11,mean2=my4)
my13<-rbind(my12,sumR=c(my3,0,0))
my14<-rbind(my13,meanR=c(my5,0,0))  
rownames(my14)<-c("1","2","3","sum","mean")
my14
#rm( list =ls ())
###############################################
tex1<-c("1","2","3","4","5,","6","7","8","9")
mXtex <- matrix(tex1)
mXtexnume <- matrix(tex1,colClass=c("numeric"))
mXtexnume
tex1_inte<-as.integer(tex1)

### Data Frame
#211
(vX1 <- c(TRUE,FALSE,TRUE)) #밖같쪽 괄호는 결과를 출력하기 위해서
(vX2 <- rnorm(3))#normal distribution(정규분포에서)random(랜덤하게)추출서

dDataFrame <- data.frame(logic=vX1, value=vX2)
dDataFrame

data.class(dDataFrame) #java 기반 패키지가 사용되는 경우, 데이터 구조확인
mode(dDataFrame) #C기반 패키지가 사용되는 경우 데이터 구조확인

lidftest<-data.frame(position=c("top","down","top"),value= c(2,4),tf=c(T,F))#error
lidftest_loop<-data.frame(position=c("top","down","top"),value= c(2),tf=c(T))#loop
lidftest_loop_<-data.frame(position=c("top","down","top"),value= 2,tf=T)#loop

#dDataFrame[행번호,열번호]
dDataFrame[1,2]
str(dDataFrame)

#dDataFrame[행번호,"열이름"]
dDataFrame[1,"logic"]
dDataFrame[,"logic"]

#dDataFrame[행번호,"열이름",drop=F]
dDataFrame[,"logic",drop=F]

#dDataFrame$속성명
#dDataFrame$'ue'
dDataFrame$logic
dDataFrame$value

#214
data(mtcars)#로딩
dCar<-mtcars#복사
str(dCar)#복사확인
vcar6 <- dCar[, 6]#한열만 추출
str(vcar6)#추출확인
is.vector(vcar6)#object 변경확인

dWeightdf <- dCar[,c(6,4)]
data.class(dWeightdf) #data.frame Object

#215
mtvec<-mtcars$mpg#한열만 추출
is.vector(mtvec)#object 변경확인

#[[ ]]는 추출한 결과가 vector로 하고자할때 사용
dCar11<-mtcars
vWeight <- dCar[["wt"]]
data.class(vWeight)
is.vector(vWeight)

vWeightdo <- dCar[[6]]
is.vector(vWeightdo)
#216
dCar<-mtcars
vWeightcomb2 <- dCar[[c("wt","hp")]] #error
vWeightcomb2 <- dCar[c("wt","hp")]
data.class(vWeightcomb2)

# data.frame(열이 여러개)에서 “데이터셋명[[음의정수]] “적용시,
#나머지 여러개의 열이 추출되면  에러 
dCar<-mtcars
vWeightdoNe <- dCar[-6] #wt
WeightdoNe

dCar<-mtcars
dTemp <- dCar[,-c(2:4)] 
dTemp

#한 개의 케이스(레코드) 삭제 
dCar<-mtcars
dT <- dCar[-1,]  #Mazda RX4 만 삭제
head(dT)

#여러 개 레코드 삭제
dCar<-mtcars
dTemp <- dCar[-c(5:15),]
dTemp <- dCar[c(-5:15),]#error

#로직으로 삭제
(df_del <- data.frame (x=c(1, 2, 3, 4, 5) ,
                       y=c("a", "b", "c", "d", "e")))
#FAlSE  로직은 삭제
df_del[c(TRUE , FALSE , TRUE , FALSE , TRUE ), ]

# X열의값이 짝수인 행추출
(df_del <- data.frame (x=c(1, 2, 3, 4, 5) ,
                       y=c("a", "b", "c", "d", "e")))
#X열의값이 짝수인 행추출, %%는 나누기,
#나누기 해서 0으로 떨어지는 TRUE인 행만 유지
df_del[df_del$x %% 2 == 0, ]

######################
# Mazda RX4의 mpg값이 기존 21임,
# Mazda RX4의 mpg값이 10으로로 수정
dCar <- mtcars
head(dCar)
dCar[1,1] <- 10   
head(dCar)

#row을 추가
dCar <- mtcars
head(dCar)
edit(dCar)#32개의 row
dCar["NewCar",1]<-20 #33개 row,맨 마지막에 추가도
edit(dCar)값

#데이터셋명["행이름","열이름"]<- 변경할 값
dCar["Mazda RX4","mpg"] <-22


#wt (차의 무게)가 5보다 큰 차량(레코드) 추출
mtcars[mtcars$wt>5,]

#wt열의 값이 wt열의 평균보다 큰값, mean()
mean(mtcars$wt)
(wt5up<-mtcars[mtcars$wt>mean(mtcars$wt),])

#wt열의 값이 5보다 크면서(&) am열의 값이  0인 행추출
wtmean<-mtcars[mtcars$wt>5&mtcars$am==0,] 

#위 결과 하드디스크에 저장, write.csv()
write.csv(wtmean,"0801.csv") # getwd() 된 디렉토리파일로 저장

#아래 방법에서 잘못된 부분을 찾아보자
#코드를 나눠서 실행하면 에러원인찾기 용이하다.
dM <- mtcars
dM$wt <- dM[dM$wt>5] #error, 컬럼(속성) 지정이 안됨, 쉼표를 해주어야한다.

dM$wt <- dM[dM$wt>5,]#error

#데이터 프레임에서 “%in%”를 사용해서 특정 문자가 있는 컬럼추출
#데이터 프레임에서 “b”,“c”라고 되어있는 열만 추
(d <- data.frame (a=1:3 , b=4:6 , c =7:9) )
d[, names(d)%in% c("b", "c")] #%in%연산자는 앞부분을 기준


#열의 이름에 “a”문자가 들어가지 않은(!) 컬럼을 추출
(d <- data.frame (a=1:3 , b=4:6 , c =7:9) )
#names(d)에 "a" 가 들어가지 않은(!)
d[, !names(d)%in% c("a")]

#위내용을 이럴때 사용.
#gugeom1031<-read.csv("E:/0-0-gg/전체요일.csv")
#> grep("긴급",colnames(gugeom1031_tbl))
#[1]  6  7  8  9 10 11
#> gugeom1031_tbl[, grep("긴급",colnames(gugeom1031_tbl))]
# A tibble: 142 × 6
#긴급구조시 긴급구조구 긴급구조동 긴급구조리 긴급구조번지             긴급구조상세주소
#<fctr>     <fctr>     <fctr>     <fctr>       <fctr>                       <fctr>
#  1       경기도     이천시     호법면      매곡리           NA                           NA

#연습 따라하기, 227~ 229 p.p.
#mtcars 테이터셑에 대해 아래와 같이 따라하면서 지금까지 학습한 내용을 정리.
#코드작성하고, 결과 보면서 학습.

#[데이터]
data(mtcars)
str(mtcars)

dCar <- mtcars

#[데이터 읽기]
#"[]"로 접근시 data.frame
#하나의 속성을 []로 추출을 한 경우, object 가 data.frame.
#6번째 열이 wt
 dWeight <- dCar[6]

 data.class(dWeight)
mode(dWeight)
 #[1] "data.frame"


#[데이터 읽기 후 변수에 저장]
# 여러개 속성을 추출해서 저장한 후에 object
#“[]”로 접근시 data.frame
dWeight <- dCar[c("wt","hp")]

data.class(dWeight)
#[1] "data.frame"

# 열이름으로도 접근해서 object 확인
#“[]”로 접근시 data.frame
 dWeight <- dCar[c("wt")]

 data.class(dWeight)
#[1] "data.frame"

#[데이터 추출 후 Object확인]
# $로 접근해서 추출한 후에 object 확인
#**data frames는 기존의 vector object($등, [번호])에 적용되었던 조작 기능이 모두 가능하다. 
# $ 로 읽은 것만 vector 형태
#  [1] "numeric" 이라는 것은 objct 가 없다는 뜻
# data.class(mtvec)


 mtvec<-mtcars$mpg

data.class(mtvec)
#[1] "numeric"

is.vector(mtvec)
#[1] TRUE


#[ “[[”로  데이터 추출 후 Object확인]
# 추출결과를 vector로 하기 위해서는  [[  ]]를 사용한다.
#mtcars[[6]] = mtcars$wt = mtcars[[“wt”]] = mtcars[[c(“wt”)]] 모두 동일한 결과
    
    dCar<-mtcars
    vWeight <- dCar[["wt"]]
    
    data.class(vWeight)
#   [1] "numeric"
    
    vWeightv <- dCar$wt
    data.class(vWeightv)
#  [1] "numeric"
    
    vWeightdo <- dCar[[6]]  
    data.class(vWeightdo)
#    [1] "numeric"
    
    vWeightcomb <- dCar[[c("wt")]]
    data.class(vWeightcomb)
#    [1] "numeric“
    
#두번째 열(데이터셋$컬럼명,[],[“”],[,]) 평균값 보다, 큰 값(> 로직)이 있는 행을  추출
argg1<-data.frame(col1=1:3, col2=4:6, col3=7:9, col4=10:12)

argg1[argg1$col2>mean(argg1$col2),]


#238
# List object는 Vector와 같이 1차 배열이다. 
#종이 한 장씩 포개놓은 것과 같은 object.
 Vector와 matrix 가 동일한 타입의 데이터만 저장하는 반면, 
List 구조는 다양한 이질적 데이터 타입과 구조를 저장할 수 있다. 
- List는 list object 자신도 저장이 가능하므로 다양하게 응용이 가능하다. 
- List는 값과 해당하는 이름으로 구성된다. 
-  R의 통계함수는 분석결과모형(회귀분석, 의사결정트리 등) 출력 시 List 구조를 사용한다. 
 dCar<-mtcars
 abc<-lm(dCar$hp~dCar$wt)
 abc
 abc$coefficients
 
 #List Object 생성
 lSales1 <- list("홍길동", 8, c(1500, 3000, 2500, 3000)) 
 lSales[[1]]
 #세 번째 sheet [[3]]의 첫 번째 엘리먼트[1] 를 추출
 lSales[[3]]
 #[1] 1500 3000 2500 3000
 lSales[[3]][1]
 lSales[[3]][2]
 
 ?lm
 
#list 성분(sheet, component)에 이름붙이기
lSales2 <- list(Name="홍길동", Count=8, Price=c(1500, 3000, 2500, 3000)) 
lSales2$Name
lSales2$Count


 a <- 1:10
 b <- 11:20                                 
list_comp_element <- list(vector1=a, vector2=b, descrip="List_example")
 list_comp_element                                           

#두 번째 성분의 5번째 원소
list_comp_element [[2]][5] 

#(1) 리스트 Object에 여러개 성분 읽기
# 리스트적인 [[]][]를 사용하는 방법과,
#“$”를 사용한  벡터로 접근할 수 있다.
#$vector2의 2, 3번째 원소
#$vector2의 2, 3번째 원소 읽기, “$”를 사용한 벡터적인 읽기
list_comp_element$vector2[c(2,3)]                            
#[1] 12 13

#전체 종이가 몇 장인지 
length(list_comp_element )
#[1] 3

#243
#이미 생선된 List Object에 성분에 이름부여하기
Lex <- list(c("Ab", "Bo", "Ca", "Deb"),c("Weight","Waist"))
names(Lex) <- c("Rows","Columns") 
Lex

#List Object 속성명 읽기와 변경하기
lSales <- list(Name="홍길동", Price=c(1500, 3000, 2500, 3000))
names(lSales)
names(lSales)<-c("KoreanName","SalePrice")
lSales 


# delete, 컴포넌트의 삭제
lSales <- list(Name="홍길동", Count=8, Price=c(1500, 3000, 2500, 3000))
lSales
lSales[2]
lSales[[2]]
lSales$Count
lSales[2]<-NULL

# delete, 원소의 삭제
mat1 <- matrix(1:4, nrow=2)
list1 <- list("A", 1:8, mat1)
list1
list1[[2]][5]
list1[[2]][-5]
#[1] 1 2 3 4 6 7 8

list1[[2]]<-list1[[2]][-5]

list1

#251
#List Object에 데이터 추가하기
li <- list(c("top","down"), c(2,4,6),c(T,F,T))
#네 번째 성분으로 1:3값 추가
li[[4]]<-c(1:3)
li
li[[5]]<-list(c(1:3))
li
li[[5]][1]

#[[5]] 
#[[5]][[1]]
#[1] 1 2 3
li[[5]][[1]][2]

#list object 응용예
asdf_14_5<-read.csv("E:/00-R/2010_2015.csv",stringsAsFactors = T)
asdf_14_5$발생년월일2<- paste(
  substr(asdf_14_5$발생년월일,1,4),
  substr(asdf_14_5$발생년월일,5,6),
  substr(asdf_14_5$발생년월일,7,8),
  sep="-")
asdf_14_5$발생년월일2<-as.POSIXlt(asdf_14_5$발생년월일2)
asdf_14_5$year<-asdf_14_5$발생년월일2$year + 1900
asdf_14_5$mon<-asdf_14_5$발생년월일2$mon +1
asdf_14_5$day<-asdf_14_5$발생년월일2$mday 

asdf_14_5$발생년월일2_2<-as.POSIXlt(asdf_14_5$발생년월일2)
asdf_14_5$weekdays<-weekdays(asdf_14_5$발생년월일2_2)

asfd_divi<-lapply(asdf_14_5$weekdays, function(x)
  if (x=="월요일"|x=="화요일"|x=="수요일"|x=="목요일"|x=="금요일") "주중" 
  else x)

asfd_divi_divi<-as.data.frame(unlist(asfd_divi))

asdf_14_5<-cbind(asdf_14_5,asfd_divi_divi)


length(vector("list", 5))

library(ggplot2)
detach(package:ggplot2)
search()