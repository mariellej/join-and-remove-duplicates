#join crimson hexagon files (can be over 50,000) and remove duplicates
library("openxlsx")
library("plyr")
library("dplyr")

#files to join should be saved as excel workbooks and put into their own directory

#set working direcory below:
setwd("C:\\Users\\marielle.jurist\\Documents\\Join_test\\files")

#loading file sin directory
file_list = list.files()

for (i in 1 : length(file_list)){
  
  exportDF = read.xlsx(loadWorkbook(file_list[i]))
  
  # create joined file
  if (i ==1){
    joinedfile = exportDF
  }
  
  # append to joined file
  else{
    joinedfile = join(joinedfile,exportDF,type="full")
  }
  
}

#remove duplicates based on GUID
distinct(joinedfile,GUID)


#write joined file to output
write.csv(joinedfile,"C:/Users/marielle.jurist/Documents/Join_test/files/test1.csv",row.names = FALSE)
