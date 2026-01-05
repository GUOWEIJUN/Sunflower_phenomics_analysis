
#安装方法：
#====设置安装源为清华大学TUNA镜像站点=====================
# options("repos" = c(CRAN="https://mirrors.tuna.tsinghua.edu.cn/CRAN/"))
# options(BioC_mirror="https://mirrors.tuna.tsinghua.edu.cn/bioconductor")
# install.packages('qqman')
#==========================================================
rm(list=ls())
library(qqman)
setwd("./")
#输入文件格式如下：
#  SNP   CHR   BP   P
# CHR，BP分别为SNP所在的染色体和位置
# P表示该SNP的关联显著性p值
color_set <- c ("#E71F19", "#35A6E0","#F19517", "#1B4B9D",
                "#C1D730", "#574497", "#71B92A", "#B54E98",
                "#6DBB5C", "#E61D4C", "#35A6E0",
                "#F19517", "#1B4B9D","#C1D730", "#574497",
                "#71B92A","#B54E98")

data1<-read.table('GE_GWAS_P0.001.txt',header=T)
# 取bonferroni矫正阈值
#fdr=0.01/nrow(data)
# manhattan(data1, main = "Oil versus Wild", 
#           ylim = c(0, 5), cex = 1.0, cex.axis = 0.9, 
#           col = color_set, 
#           suggestiveline = F, genomewideline = F)
pdf("GE.pdf",width = 8,height = 4)
manhattan(data1,chr="CHR",bp="BP",p="P",
          col=color_set,suggestiveline = F, genomewideline = 7.16,
          ylab="-log10(p-value)",ylim=c(0,20),font.lab=4,cex.lab=1.2,main="GE",cex=0.8)
dev.off()
png("GE.png",width = 1200,height = 400)
manhattan(data1,chr="CHR",bp="BP",p="P",
          col=color_set,suggestiveline = F, genomewideline = 7.16,
          ylab="-log10(p-value)",ylim=c(0,20),font.lab=4,cex.lab=1.2,main="GE",cex=0.8)
dev.off()
