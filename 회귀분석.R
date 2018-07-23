library(ggplot2)
library(dplyr)

# 업종별 회귀분석
merge_sales <- merge(x=projected_sales_hinterland_industry_201711_CS100009, y=projected_sales_hinterland_industry_201711_CS100001, by='상권_코드', all=TRUE)
names(merge_sales) <- c("상권_코드", "커피음료", "한식음식점")
merge_sales <- merge_sales %>% filter(커피음료 < 3e+10)
ggplot(merge_sales, aes(x=커피음료, y=한식음식점)) + geom_point()  # 산점도
cor.test(merge_sales$커피음료, merge_sales$한식음식점)

# 커피음료 등 9개업종 매출액 데이터준비
sales_data <- merge(x=sales_data, y=projected_sales_hinterland_industry_201803_CS100009, by='상권_코드', all=TRUE)
names(sales_data) <- c("상권_코드", "한식음식점", "일식집", "양식집", "분식집", "패스트푸드점", "제과점", "호프간이주점", "편의점", "커피음료")
write.csv(sales_data, file="sales_data.csv")
