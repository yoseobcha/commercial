### 1. 하둡데이터를R서버로복사###

# 환경설정#
Sys.setenv(JAVA_HOME='/usr/java/jdk1.7.0_67-cloudera') # Java Path 설정
Sys.setenv(HADOOP_CMD='/usr/lib/hadoop/bin/hadoop') # HadoopCMD 설정
Sys.getenv() # 환경설정확인

# 관련패키지설치및라이브러리실행
install.packages("rJava")
library(rJava)

# rhdfs 패키지설치되어있기때문에패키지설치없이라이브러리함수사용
library(rhdfs)
hdfs.init() # rhdfs 초기화

# hdfs.ls() 함수사용하여하둡에저장된경진대회데이터확인
hdfs.ls('/user/rosabian75/contest2018')

# console 창의결과물에대해서복사가안되기때문에sink()함수를사용하여결과물을txt 파일저장
sink('hdfs_print.txt')

# CODE 폴더에있는데이터를사용하기위해CODE 폴더에있는데이터확인
hdfs.ls('/user/rosabian75/contest2018/CODE')

# sink()함수를재실행하여결과물을console창에출력
sink()

# hdfs.get()함수를사용하여하둡데이터를R 서버로업로드
hdfs.get(src = '/user/rosabian75/contest2018/CODE/ADSTRD_DIM_u.csv', dest = 'tmp.csv')

# read.csv()함수를사용하여데이터를R 메모리에LOAD
tmp_data <-read.csv(file = 'tmp.csv', header = T, stringsAsFactors = T, sep = "|")
head(tmp_data) # 데이터확인