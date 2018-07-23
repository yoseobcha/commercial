library(dplyr)
setwd('E:\\상권분석빅데이터\\상권분석')
getwd()

# 상권배후지-추정매출
projected_sales_hinterland <- read.csv("서울시 골목상권 프로파일링 정보(상권배후지-추정매출).csv",  header=T)

# 월별데이터
projected_sales_hinterland_industry_301709 <- projected_sales_hinterland %>%
  filter(기준_년월_코드 == 201709)
# head(projected_sales_hinterland_industry_301709)
# tail(projected_sales_hinterland_industry_301709)

# 업종별 촐매출액
projected_sales_hinterland_industry_301709_total <- aggregate(x=projected_sales_hinterland_industry_301709[,12], list(group=projected_sales_hinterland_industry_301709$서비스_업종_코드_명), FUN=sum)

# 업종별 점포수
projected_sales_hinterland_industry_301709_storenum <- aggregate(x=projected_sales_hinterland_industry_301709[,83], list(group=projected_sales_hinterland_industry_301709$서비스_업종_코드_명), FUN=sum)


# 상권배후지-추정매출(연령대별)
projected_sales_hinterland_industry_301803_10s <- aggregate(x=projected_sales_hinterland_industry_301803[,54], list(group=projected_sales_hinterland_industry_301803$서비스_업종_코드_명), FUN=sum)

projected_sales_hinterland_industry_301711_30s <- aggregate(x=projected_sales_hinterland_industry_301711[,55], list(group=projected_sales_hinterland_industry_301711$서비스_업종_코드_명), FUN=sum)

projected_sales_hinterland_industry_301711_30s <- aggregate(x=projected_sales_hinterland_industry_301711[,56], list(group=projected_sales_hinterland_industry_301711$서비스_업종_코드_명), FUN=sum)

projected_sales_hinterland_industry_301711_40s <- aggregate(x=projected_sales_hinterland_industry_301711[,57], list(group=projected_sales_hinterland_industry_301711$서비스_업종_코드_명), FUN=sum)

projected_sales_hinterland_industry_301711_50s <- aggregate(x=projected_sales_hinterland_industry_301711[,58], list(group=projected_sales_hinterland_industry_301711$서비스_업종_코드_명), FUN=sum)

projected_sales_hinterland_industry_301711_60s <- aggregate(x=projected_sales_hinterland_industry_301711[,59], list(group=projected_sales_hinterland_industry_301711$서비스_업종_코드_명), FUN=sum)


# 상권배후지-추정매출(성별)
projected_sales_hinterland_industry_301711_female <- aggregate(x=projected_sales_hinterland_industry_301711[,52], list(group=projected_sales_hinterland_industry_301711$서비스_업종_코드_명), FUN=sum)

projected_sales_hinterland_industry_301711_fefemale <- aggregate(x=projected_sales_hinterland_industry_301711[,53], list(group=projected_sales_hinterland_industry_301711$서비스_업종_코드_명), FUN=sum)

# 상권배후지-추정매출(시간대별)



# 상권-추정유동인구
projected_polupation_market <- read.csv("서울시 골목상권 프로파일링 정보(상권-추정유동인구).csv",  header=T)

#월별데이터
projected_polupation_market_301709 <- projected_polupation_market %>%
  filter(기준_년월_코드 == 201709)
# head(projected_polupation_market_301709)
# tail(projected_polupation_market_301709)

projected_polupation_market_301709_total <- projected_polupation_market_301709 %>%
  select(총_유동인구_수,여성_유동인구_수,여성_유동인구_수,연령대_10_유동인구_수,연령대_60_이상_유동인구_수,연령대_60_이상_유동인구_수,연령대_60_이상_유동인구_수,연령대_60_이상_유동인구_수,연령대_60_이상_이상_유동인구_수,월요일_유동인구_수,화요일_유동인구_수,수요일_유동인구_수,목요일_유동인구_수,금요일_유동인구_수,토요일_유동인구_수,일요일_유동인구_수)

projected_polupation_market_301709_total <- colSums(projected_polupation_market_301709_total, na.rm=TRUE)

projected_polupation_market_301709_total
str(projected_polupation_market_301709_total)
class(projected_polupation_market_301709_total)

projected_polupation_market_total <- rbind(projected_polupation_market_301709_total, projected_polupation_market_301710_total,projected_polupation_market_301711_total,projected_polupation_market_301712_total,projected_polupation_market_301801_total,projected_polupation_market_301802_total,projected_polupation_market_301803_total)


# 상권-추정유동인구(성별&연령대별)
projected_polupation_market_201803_fefemale_60s <- projected_polupation_market_201803 %>%
  select(여성연령대_60_이상_월요일시간대_1_유동인구_수, 여성연령대_60_이상_월요일시간대_2_유동인구_수, 여성연령대_60_이상_월요일시간대_3_유동인구_수, 여성연령대_60_이상_월요일시간대_4_유동인구_수, 여성연령대_60_이상_월요일시간대_5_유동인구_수, 여성연령대_60_이상_월요일시간대_6_유동인구_수, 여성연령대_60_이상_화요일시간대_1_유동인구_수, 여성연령대_60_이상_화요일시간대_2_유동인구_수, 여성연령대_60_이상_화요일시간대_3_유동인구_수,	여성연령대_60_이상_화요일시간대_4_유동인구_수,	여성연령대_60_이상_화요일시간대_5_유동인구_수,	여성연령대_60_이상_화요일시간대_6_유동인구_수,	여성연령대_60_이상_수요일시간대_1_유동인구_수,	여성연령대_60_이상_수요일시간대_2_유동인구_수,	여성연령대_60_이상_수요일시간대_3_유동인구_수,	여성연령대_60_이상_수요일시간대_4_유동인구_수,	여성연령대_60_이상_수요일시간대_5_유동인구_수,	여성연령대_60_이상_수요일시간대_6_유동인구_수,	여성연령대_60_이상_목요일시간대_1_유동인구_수,	여성연령대_60_이상_목요일시간대_2_유동인구_수,	여성연령대_60_이상_목요일시간대_3_유동인구_수,	여성연령대_60_이상_목요일시간대_4_유동인구_수,	여성연령대_60_이상_목요일시간대_5_유동인구_수,	여성연령대_60_이상_목요일시간대_6_유동인구_수,	여성연령대_60_이상_금요일시간대_1_유동인구_수,	여성연령대_60_이상_금요일시간대_2_유동인구_수,	여성연령대_60_이상_금요일시간대_3_유동인구_수,	여성연령대_60_이상_금요일시간대_4_유동인구_수,	여성연령대_60_이상_금요일시간대_5_유동인구_수,	여성연령대_60_이상_금요일시간대_6_유동인구_수,	여성연령대_60_이상_토요일시간대_1_유동인구_수,	여성연령대_60_이상_토요일시간대_2_유동인구_수,	여성연령대_60_이상_토요일시간대_3_유동인구_수,	여성연령대_60_이상_토요일시간대_4_유동인구_수,	여성연령대_60_이상_토요일시간대_5_유동인구_수,	여성연령대_60_이상_토요일시간대_6_유동인구_수,	여성연령대_60_이상_일요일시간대_1_유동인구_수,	여성연령대_60_이상_일요일시간대_2_유동인구_수,	여성연령대_60_이상_일요일시간대_3_유동인구_수,	여성연령대_60_이상_일요일시간대_4_유동인구_수,	여성연령대_60_이상_일요일시간대_5_유동인구_수,	여성연령대_60_이상_일요일시간대_6_유동인구_수)

projected_polupation_market_201803_fefemale_60s <- colSums(projected_polupation_market_201803_fefemale_60s, na.rm=TRUE)
projected_polupation_market_201711_female_20s

projected_polupation_market_total_female <- rbind(projected_polupation_market_201711_female_20s,
                                                projected_polupation_market_201711_female_30s,
                                                projected_polupation_market_201711_female_40s,
                                                projected_polupation_market_201711_female_50s,
                                                projected_polupation_market_201711_female_60s,
                                                projected_polupation_market_201801_female_20s,
                                                projected_polupation_market_201801_female_30s,
                                                projected_polupation_market_201801_female_40s,
                                                projected_polupation_market_201801_female_50s,
                                                projected_polupation_market_201801_female_60s,
                                                projected_polupation_market_201803_female_20s,
                                                projected_polupation_market_201803_female_30s,
                                                projected_polupation_market_201803_female_40s,
                                                projected_polupation_market_201803_female_50s,
                                                projected_polupation_market_201803_female_60s)

projected_polupation_market_total_female <- rowSums(projected_polupation_market_total_female, na.rm=TRUE)
projected_polupation_market_total_female


# 상권배후지-소득소비
projected_expense_hinterland <- read.csv("서울시 골목상권 프로파일링 정보(상권배후지-소득소비).csv", header=T)

projected_expense_hinterland_301711 <- projected_expense_hinterland %>%
  filter(기준년월코드 == 201711)
head(projected_expense_hinterland_301803)
tail(projected_expense_hinterland_301803)

projected_expense_hinterland_301802_total <- projected_expense_hinterland_301802 %>% 
  select(월평균소득.금액, 지출.총금액, 식료품.지출.총금액, 의류.신발.지출.총금액, 생활용품.지출.총금액, 의료비.지출.총금액, 교통.지출.총금액, 여가.지출.총금액, 문화.지출.총금액, 교육.지출.총금액, 유흥.지출.총금액)

projected_expense_hinterland_301802_total <- colMeans(projected_expense_hinterland_301802_total)


# 유동인구 & 업종별 매출액 상관관계분석
tail(projected_sales_hinterland_201803_food_sales)

projected_sales_hinterland_201803_food_sales <- projected_sales_hinterland_industry_201803 %>%
    filter(서비스_업종_코드_명 == 한식음식점)

projected_sales_hinterland_201803_food_sales_new <- projected_sales_hinterland_201803_food_sales$당월_매출_금액
str(projected_sales_hinterland_201803_food_sales_new)

projected_polupation_market_201803_new <- projected_polupation_market_201803$총_유동인구_수
str(projected_polupation_market_201803_new) 
plot(projected_sales_hinterland_201803_food_sales_new~projected_polupation_market_201803_new)


# 업종별 매출액 상관관계분석
library(dplyr)
projected_sales_hinterland_industry_201711_CS100001 <- projected_sales_hinterland_industry_201711 %>%
  filter(서비스_업종_코드 == c("CS100001")) %>% 
  select(상권_코드, 당월_매출_금액)

projected_sales_hinterland_industry_201803_street <- merge(x=projected_sales_hinterland_industry_201803_street, y=projected_sales_hinterland_industry_201803_CS100001, by='상권_코드', all=TRUE)

names(projected_sales_hinterland_industry_201803_street) <- c("상권_코드", "화장품", "문구점", "약국", "패션잡화", "의류점", "과일채소", "정육점", "휴대폰", "컴퓨터판매수리", "편의점", "슈퍼마켓", "자동차미용", "자동차수리", "세탁소", "여관업", "피부관리실", "네일숍", "미용실", "헬스클럽", "골프연습장", "당구장", "노래방", "인테리어", "보육시설", "일반의원", "한의원", "치과의원", "예체능학원", "외국어학원", "입시보습학원", "호프간이주점", "커피음료", "제과점", "치킨집", "패스트푸드점", "분식집", "양식집", "일식집", "중국집", "한식음식점")

projected_sales_hinterland_industry_201803_street_edit <- na.omit(projected_sales_hinterland_industry_201803_street)

library(ggplot2)
ggplot(projected_sales_hinterland_industry_201803_street_edit, aes(x=한식음식점, y=커피음료)) + geom_point()  # 산점도

cor.test(projected_sales_hinterland_industry_201803_street_edit$한식음식점, projected_sales_hinterland_industry_201803_street_edit$커피음료) # 상관계수 검정

write.csv(projected_sales_hinterland_industry_201803_street_edit, file="sales.csv")

projected_sales_hinterland_industry_201803_street_cor <- cor(projected_sales_hinterland_industry_201803_street_edit)

write.csv(projected_sales_hinterland_industry_201803_street_cor, file="correlation.csv")

library(corrplot)
corrplot(projected_sales_hinterland_industry_201803_street_cor,
         method="shade",       # 색 입힌 사각형
         tl.col="red",         # 라벨 색 지정
         tl.srt=30,            # 위쪽 라벨 회전 각도
         addCoef.col="black")  # 상관계수 숫자 색

remove(projected_sales_hinterland_industry_201803_storesales) # 데이터셋 삭제
projected_sales_hinterland_industry_201803_street <- projected_sales_hinterland_industry_201803_street[,-c(25)] # 특정열 삭제

# 점포당 매출
projected_sales_hinterland_industry_201803_storesales <- projected_sales_hinterland_industry_201803 %>%
  mutate("점포당_매출" = 당월_매출_금액/점포수)


