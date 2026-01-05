#install.packages("CMplot")
library(CMplot)
mydata<-read.table("snp_density.txt",header=TRUE,'\t')
head(mydata)
# snp         chr       pos
# snp1_1    1        2041
# snp1_2    1        2062
# snp1_3    1        2190
CMplot(mydata,plot.type="d",bin.size=1e6,
       col=c("darkgreen","yellow", "red"),
       file="pdf",memo="snp_density",dpi=600)
CMplot(mydata,plot.type="d",bin.size=1e6,
       col=c("darkgreen","yellow", "red"),
       file="jpg",memo="snp_density",dpi=600)

#indel
mydata<-read.table("indel_density.txt",header=TRUE,'\t')
head(mydata)
# snp         chr       pos
# snp1_1    1        2041
# snp1_2    1        2062
# snp1_3    1        2190
CMplot(mydata,plot.type="d",bin.size=1e6,
       col=c("darkgreen","yellow", "red"),
       file="pdf",memo="indel_density",dpi=600)
CMplot(mydata,plot.type="d",bin.size=1e6,
       col=c("darkgreen","yellow", "red"),
       file="jpg",memo="indel_density",dpi=600)

