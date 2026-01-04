#create environment
conda create -n gwas
source activate gwas
#install software
conda install bioconda::gemma
conda install -c bioconda plink

#1.covert vcf to bed
plink --threads  30 --vcf sunflower972.chr1_17.mis10maf5.indel.vcf  --recode  --allow-extra-chr  --make-bed   --out  sunflower972_indel
plink --threads  30 --vcf sunflower972.chr1_17.mis10maf5.snp.vcf  --recode  --allow-extra-chr  --make-bed   --out  sunflower972

#2.calculate kinship matrix, using MFV_FW traits as example
gemma  -bfile /public1/home/wjguo/Sunflower_DB/sunflower972   -gk 2   -p    /public1/home/wjguo/1_guowj/1_GWAS_salt_sunflower/2_trait/MFV_FW.txt     -o  MFV_FW   

#3.gwas
gemma -bfile /public1/home/wjguo/Sunflower_DB/sunflower972 -k output/MFV_FW.sXX.txt   -lmm 1 -p /public1/home/wjguo/1_guowj/1_GWAS_salt_sunflower/2_trait/MFV_FW.txt    -o  MFV_FW_gwas  
