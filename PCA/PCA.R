#PCA analysis
# install.packages("FactoMineR")
# install.packages("factoextra")
library("FactoMineR")
library("factoextra")

S <- read.table("Traits_all.txt",header = T,sep ="\t")
#去除第一二列
S <- S[,c(-1,-2)]
S.pca <- PCA(S, graph = FALSE)

#下面两步产生一样的图
PCA(S)

fviz_pca_var(S.pca, col.var = "black")


#变量分析
var <- get_pca_var(S.pca)
#代表质量作图
var$cos2


#展示各变量对主成分的代表质量
library("corrplot")
# is.corr表示输入的矩阵不是相关系数矩阵
pdf("PCA.cos.pdf",width = 15,height = 15)
corrplot(var$cos2,is.corr=FALSE)
dev.off()



#各变量相关图，颜色代表代表质量
pdf("PCA.相关性.pdf",width = 8,height = 8)
fviz_pca_var(S.pca, col.var = "cos2",
             gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"),
             repel = TRUE # Avoid text overlapping
)
dev.off()



#变量对主成分贡献
library("corrplot")
pdf("PCA.contrib.pdf",width = 8,height = 8)
corrplot(var$contrib, is.corr=FALSE)
dev.off()
