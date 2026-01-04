#!/bin/bash
#SBATCH -J GEC
#SBATCH -N 1
#SBATCH -n 60
#SBATCH --comment=indel

source activate gwas
cd  /public1/home/wjguo/1_guowj/1_GWAS_salt_sunflower/8_LD_group
#PopLDdecay  -InVCF  /public1/home/wjguo/Sunflower_DB/sunflower972.chr1_17.mis10maf5.snp.vcf.gz    -OutStat   sunflower972_LDdecay   
#perl  /public1/home/wjguo/software/LD/PopLDdecay/bin/Plot_OnePop.pl  -inFile   sunflower972_LDdecay.stat.gz  -output  sunflower972_Fig

PopLDdecay   -InVCF  /public1/home/wjguo/Sunflower_DB/sunflower972.chr1_17.mis10maf5.snp.vcf.gz   -OutStat  MST_LDdecay  -SubPop    MST.list   -MaxDist  1000
PopLDdecay   -InVCF  /public1/home/wjguo/Sunflower_DB/sunflower972.chr1_17.mis10maf5.snp.vcf.gz   -OutStat  SS_LDdecay     -SubPop    SS.list   -MaxDist  1000
PopLDdecay   -InVCF  /public1/home/wjguo/Sunflower_DB/sunflower972.chr1_17.mis10maf5.snp.vcf.gz   -OutStat  ST_LDdecay     -SubPop    ST.list   -MaxDist  1000

perl  /public1/home/wjguo/software/LD/PopLDdecay/bin/Plot_OnePop.pl  -inFile   MST_LDdecay.stat.gz    -output  MST_Fig
perl  /public1/home/wjguo/software/LD/PopLDdecay/bin/Plot_OnePop.pl  -inFile   SS_LDdecay.stat.gz     -output  SS__Fig
perl  /public1/home/wjguo/software/LD/PopLDdecay/bin/Plot_OnePop.pl  -inFile   ST_LDdecay.stat.gz     -output  ST__Fig

perl  /public1/home/wjguo/software/LD/PopLDdecay/bin/Plot_MultiPop.pl   -inList  Pop.ResultPath.list  -output All_Fig
