###################################################################
#(BOOK TIELE) : 빅데이터 외부 및 내부 데이터 수집과 저장(개정판)
# (BOOK published in Korea)
#http://cafe.naver.com/dataan
##https://github.com/heeseonhan/

###################################################################
#I.트위터 데이터 가져와 분석하기             
#1.트위스터 데이터 가져와서 저장하기
#2.키워드 입력해서, 트윗 데이터 가져와서 분석하기
 consumerKey <- "인증키"
 consumerSecret <- "인증키"
 requestURL <- "https://api.twitter.com/oauth/request_token"
 authURL <- "https://api.twitter.com/oauth/authorize"
accessURL	<- "https://api.twitter.com/oauth/access_token"

library(ROAuth)
twitCred <- OAuthFactory$new(
     consumerKey=consumerKey,
     consumerSecret=consumerSecret,
     requestURL=requestURL,
     accessURL=accessURL,
     authURL=authURL)
n <- 200
keyword <- '장애인' 
keyword <- enc2utf8(keyword)
tweets2 <- searchTwitter(keyword, n)
Rangers_df <- twListToDF(tweets2)

# 내용을 파일에 저장
write.csv(Rangers_df,"Rangers_df.csv")


#II.Open-API로 데이터 가져오기                                                  
#1.Open-API 이해 및 Json  읽기 함수
#2. 날씨 json 파일 읽어서 가공후 저장하기
#3. 교통사고 데이터를 Open API를 사용해서 가져오기
#4. 서울 열린 데이터 광장(seoul.data.go.kr) Open-API 사용하기 : XML로 받는 경우
library(jsonlite)
setwd("e:/00-R")
life<-fromJSON("life.json", flatten=TRUE)
 str(life$body$region)

 df <- lapply(life$body$region$jisu, function(play) 
{
  
  data.frame(matrix(unlist(play), ncol=5))
})

df <- do.call(rbind, df)
df_life27<-cbind(rep(life$body$region$rgnNm,each=14),df)
head(df_life27)


library(jsonlite)
url2="http://taas.koroad.or.kr/data/rest/accident/death?authKey=[인증키]&searchYear=2015&sido=1100&gugun="
raw.data <- readLines(url2, warn = "F",encoding="UTF-8")
dat<- fromJSON(raw.data)
str(dat)
data.frame2<-data.frame(dat$searchResult$accidentDeath)
write.csv(data.frame2,"e:/0-0-smt-12/0_data.frame2.csv")



url2_se="http://openAPI.seoul.go.kr:8088/인증키/xml/GeoInfoDongPowerUsage2007/1/5"
library(Ruchardet)
detectFileEncoding("http://openAPI.seoul.go.kr:8088/인증키/xml/GeoInfoDongPowerUsage2007/1/5")
library(XML)
seoul_data<-xmlToDataFrame("http://openAPI.seoul.go.kr:8088/인증키/xml/GeoInfoDongPowerUsage2007/1/5")
str(seoul_data)

#III. CURL로 데이터 가져오기
#1. 레파지토리에서 데이터 읽어와서 하드디스크의 R작업 폴더에 저장하기


#IV. CSV 파일 읽기                                            
#1. csv 파일 가져오기 
#2.read.csv() 함수의 default 옵션
#3.Factor Object로 읽지 않기
#4.NA로 처리할 값 설정하기
#5.따라하기 과제
#6.글깨짐 처리하기
#7.금액 등 중간에 쉼표(“,”)가 포함된 CSV 파일 읽기
#8."열의 개수가 열의 이름들보다 많습니다."처리하기
#9.컬럼별로 데이터 타입을 지정하여 읽기
#10.상위 몇 개 라인을 제외하고 읽고, 메타 데이터 입력하기
#11.관련 에러 및 경고 메시지의 처리하기
#12.csv 파일 읽어오고 날짜 가공하기  
#13. 주소에서 국가, 도, 시, 읍, 리로 파생변수 생성하여 데이터셋 구성하기

eadcsv_defa <-read.csv("readcsv_simple.csv",header=TRUE)
str(readcsv_defa)



readcsv <-read.csv("readcsv_simple.csv",header=TRUE,stringsAsFactors=FALSE)
str(readcsv)



nilnumchr <- read.csv("numChar.csv", na.strings =c("NIL"))
str(nilnumchr)



nilnumchr3 <- read.csv("numChar2.csv", na.strings =c("NIL","NN","CC"))
str(nilnumchr3)



corre2 <- read.csv("correlationx1x2x3-raw.csv",header=TRUE,encoding="UTF-8")
str(corre2)


qdf<-read.csv("quote.csv",quote="'",header=TRUE)


qdf3<-read.csv("quote3.csv",quote="'",header=TRUE)



cols <-read.csv("quote.csv",header=TRUE,quote="'"
                ,colClasses=c("character","numeric","numeric","numeric","factor"))



head(ich<-read.csv("rainfall_2010-2015.csv",skip=6))
ichn <- structure(ich, "Term"="2010.1.1 ~ 2015.12.31", "district"="Icheon", "description"="일단위측정" )

#V. 탭으로 구분된 파일 읽기                                   
#1.탭으로 구분된 파일 읽기 함수
#2. 일정한 간격으로 구분된 파일 읽기
#3.Wi-fi 설치 위도경도 좌표 데이터 읽기 따라하기
ar<-read.delim("tab.txt", sep=" ")
ar<-read.delim("tab.txt", sep="")
ar<-read.csv("e:/00-R/tab.csv", sep="\t")
ars<-read.csv("tab.csv", sep="")



wifi_data <- read.csv("seoul_wifi2.csv", header = T,sep="")


#VI. 규칙적인 형식의 다양한 Text 파일 읽기                    
#1. 규칙적인 형식의 다양한 Text 파일 읽기 함수
#2. 함수 형식
#3. 헤드가 있는 데이터 읽기
#4. “#”표시가 입력되있고, 모양이 불일치해보이는 Text 파일 
#5. 앞줄 몇 라인 건너 뛰고 읽고 메타데이터로 입력하기


a <- read.table("readtable_2.txt",header=TRUE)


qardt<-read.table("e:/00-R/question1.txt",skip=1)
str(qardt)


vDataFrame <- read.table("e:/00-R/header.txt",skip=2, quote="'",sep=",",header=TRUE,stringsAsFactors=FALSE,
                         colClasses=c("character", "numeric","numeric","numeric","factor"))


#VII. 넓이로 고정된 형식의 테이블 읽기                        
#1. 넒이로 고정된 데이터 파일 읽기 함수
#2. 특정 위치 제외하고 읽기
a <- read.fwf("e:/00-R/read_widths.txt", header=FALSE, widths=c(2,-4,2) ,col.names=c("Id","Flag") )
a


#VIII. 웹페이지 및 웹에 올린 파일, 연결된 링크 주소 읽기        
#1. 크롤링과 스크레이핑
#2. 웹 페이지 읽고 패턴단어 찾기
#3. 여러 웹 페이지 읽고 패턴단어 찾기
#4. 웹에 올린 엑셀 파일 읽어오기
#5. 웹에 올린 CSV 및 텍스트 파일 읽어오기
#6. URL 중에 특수문자(?)를 기준으로 앞의 내용만 추출하기
#7. 웹페이지에 연결된 링크 주소 가져오기


webpage =  readLines('http://news.maxmovie.com/329621',encoding = "UTF-8")
head(webpage)
mypattern = '크리'
grep(mypattern,webpage)



library(Ruchardet)
detectFileEncoding("웹주소")
dTable_R_L<-readLines(list.url,encoding="EUC-KR")
library(rvest)
webpage_lot<-lapply(1:24,function(x){
readLines(paste("http://hkconsensus.hankyung.com/apps.analysis/analysis.list?skinType=industry&pagenum=1000&order_type=&now_page=",x,sep=""),encoding="euc-kr")
}
)
str(webpage_lot)



#IX. x l s, x l s x 파일 읽기                                  
#1.gdata
#2.서식있는 엑셀 파일 읽기, xlsx 패키지
#3.x l s x 관련 함수
#4.관련 에러 메시지 해결하기
#5.엑셀파일 여러개 동시에 읽기
#6.x l s x  확장자 엑셀 파일 읽기
#7. 서식이 있는 엑셀파일 읽기에서 잘못 읽혀진 부분 제대로 읽기
installXLSXsupport(perl = "C:\\Strawberry\\perl\\bin\\perl5.20.2.exe", verbose = FALSE)
library(gdata)    # 반드시 패키지를 로드하여야함
dExcel <- read.xls("d:/rbook/test.xls", sheet=1)   # “.xls” 파일 읽기

hamp<-read.xlsx("hamp.xlsx",
                sheetIndex =1,
                colNames=TRUE,
                startRow = 2)

hamp<-read.xlsx("E:/0-0-gg/real/hamp.xlsx",
                sheet=1,
                colNames=TRUE,
                startRow = 2)



setwd("C:/경로/many_xlsx")
file_list = list.files(pattern = "xlsx$")
file_list
dataset = data.frame()
for (file in file_list){
  print(file)
  temp = read.xlsx(file,sheetIndex = 1, colNames=TRUE)
  dataset = rbind(dataset,temp)
}



#X. SPSS 데이터 파일 R로 읽기                                
#1.SPSS 데이터 읽기 함수
#2.SPSS 파일 읽기 따라하기
rspss<-read.spss("e:/00-R/dummy-regression.sav" )
data2<-as.data.frame(rspss)
str(data2)



#XI. PDF 파일 읽기                                           
library(pdftools)
rm_170402_pdf <- pdf_text("순서1.pdf")




