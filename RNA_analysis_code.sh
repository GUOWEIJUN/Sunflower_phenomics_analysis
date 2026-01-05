#create environment
conda create -n RNAseq
source activate RNAseq
#install software
conda install histat2  featureCounts

source activate RNAseq

#1.prepare reference genome
hisat2-build  /public1/home/wjguo/Genome/HanSK/HanSK.fa  /public1/home/wjguo/Genome/HanSK/hisat2/HanSK

#2.aligment clean reads to the reference genome
hisat2   -p 40 --dta -x  /public1/home/wjguo/Genome/HanSK/index/hisat2/HanSK  -1 Unknown_CV792-002T0001_good_1.fq.gz  -2 Unknown_CV792-002T0001_good_2.fq.gz  --summary-file   VI-2.log      | samtools sort -@ 8 -O bam -o VI-2.bam
hisat2   -p 40 --dta -x  /public1/home/wjguo/Genome/HanSK/index/hisat2/HanSK  -1 Unknown_CV792-002T0002_good_1.fq.gz  -2 Unknown_CV792-002T0002_good_2.fq.gz  --summary-file   VI-1.log      | samtools sort -@ 8 -O bam -o VI-1.bam
hisat2   -p 40 --dta -x  /public1/home/wjguo/Genome/HanSK/index/hisat2/HanSK  -1 Unknown_CV792-002T0003_good_1.fq.gz  -2 Unknown_CV792-002T0003_good_2.fq.gz  --summary-file   VI-3.log      | samtools sort -@ 8 -O bam -o VI-3.bam
hisat2   -p 40 --dta -x  /public1/home/wjguo/Genome/HanSK/index/hisat2/HanSK  -1 Unknown_CV792-002T0004_good_1.fq.gz  -2 Unknown_CV792-002T0004_good_2.fq.gz  --summary-file   EV-1.log      | samtools sort -@ 8 -O bam -o EV-1.bam
hisat2   -p 40 --dta -x  /public1/home/wjguo/Genome/HanSK/index/hisat2/HanSK  -1 Unknown_CV792-002T0005_good_1.fq.gz  -2 Unknown_CV792-002T0005_good_2.fq.gz  --summary-file   EV-2.log      | samtools sort -@ 8 -O bam -o EV-2.bam
hisat2   -p 40 --dta -x  /public1/home/wjguo/Genome/HanSK/index/hisat2/HanSK  -1 Unknown_CV792-002T0006_good_1.fq.gz  -2 Unknown_CV792-002T0006_good_2.fq.gz  --summary-file   EV-3.log      | samtools sort -@ 8 -O bam -o EV-3.bam

#3.samtools index 
samtools index  VI-2.bam
samtools index  VI-1.bam
samtools index  VI-3.bam
samtools index  EV-1.bam
samtools index  EV-2.bam
samtools index  EV-3.bam

#4.gene expression count calculation
featureCounts  -T 60 -p -t exon -g gene_id  -o CBF4.count.txt  -a  /public1/home/wjguo/Genome/HanSK/annotation/HanSK.gtf    VI-2.bam  VI-1.bam  VI-3.bam  EV-1.bam  EV-2.bam  EV-3.bam
