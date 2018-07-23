### 1. �ϵӵ����͸�R�����κ���###

# ȯ�漳��#
Sys.setenv(JAVA_HOME='/usr/java/jdk1.7.0_67-cloudera') # Java Path ����
Sys.setenv(HADOOP_CMD='/usr/lib/hadoop/bin/hadoop') # HadoopCMD ����
Sys.getenv() # ȯ�漳��Ȯ��

# ������Ű����ġ�׶��̺귯������
install.packages("rJava")
library(rJava)

# rhdfs ��Ű����ġ�Ǿ��ֱ⶧������Ű����ġ���̶��̺귯���Լ����
library(rhdfs)
hdfs.init() # rhdfs �ʱ�ȭ

# hdfs.ls() �Լ�����Ͽ��ϵӿ�����Ȱ�����ȸ������Ȯ��
hdfs.ls('/user/rosabian75/contest2018')

# console â�ǰ���������ؼ����簡�ȵǱ⶧����sink()�Լ�������Ͽ��������txt ��������
sink('hdfs_print.txt')

# CODE �������ִµ����͸�����ϱ�����CODE �������ִµ�����Ȯ��
hdfs.ls('/user/rosabian75/contest2018/CODE')

# sink()�Լ���������Ͽ��������consoleâ�����
sink()

# hdfs.get()�Լ�������Ͽ��ϵӵ����͸�R �����ξ��ε�
hdfs.get(src = '/user/rosabian75/contest2018/CODE/ADSTRD_DIM_u.csv', dest = 'tmp.csv')

# read.csv()�Լ�������Ͽ������͸�R �޸𸮿�LOAD
tmp_data <-read.csv(file = 'tmp.csv', header = T, stringsAsFactors = T, sep = "|")
head(tmp_data) # ������Ȯ��