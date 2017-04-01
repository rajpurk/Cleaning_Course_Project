
#To Create a Tidy Data Set

###################################
# Step 1 : Merging the data set
#################################
library(dplyr)
library(Hmisc)
library(reshape2)

#read in all the activity labels

activity_labels<-read.table("activity_labels.txt")
colnames(activity_labels)<-c("label","label_name")

#read in all the features
features<-read.table("features.txt")
colnames(features)<-c("no","name")
features$name<-make.names(features$name,unique=TRUE)
#need to use this because of spaces present in the names


#read in all the variables from Test Set
X_test<-read.table("X_test.txt")
colnames(X_test)<-features$name

X_train<-read.table("X_train.txt")
colnames(X_train)<-features$name

#read in Activity labels
y_test<-read.table("Y_test.txt")
colnames(y_test)<-c("activity_label")
y_train<-read.table("Y_train.txt")
colnames(y_train)<-c("activity_label")


#read in subject labels

subject_test<-read.table("subject_test.txt")
colnames(subject_test)<-c("Subject_label")
subject_train<-read.table("subject_train.txt")
colnames(subject_train)<-c("Subject_label")

#do a column bind to make a wide format set of joined variables including subject ids and activity labels 

test_global<-cbind(subject_test,y_test,X_test)
train_global<-cbind(subject_train,y_train,X_train)



#now do a row bind 

global<-rbind(test_global,train_global)

#Merged data set created
################################################################

## Step 2 : To extract only the mean and standard deviation

#############################################################

#extract column names
mycols<-colnames(global)

#find ones which only have mean or std

mynewcols<-mycols[grepl("label|mean|std",mycols)]

#redefine global

newglobal<-global[mynewcols]
#selective data set created

##############################################################

###Step 3 : to create activity labels

######################################################


newglobal<-mutate(newglobal,activity_name=activity_labels$label_name[newglobal$activity_label])


######################################
### STep 4 : To name variables descriptively

####################################

### this has already been done by reading the features txt file to create col names 


###############################################################################

##### Step 5 : To create means for each activity and each subject


###############################################################################


globalmelt<-melt(newglobal,id.vars=c("activity_name","Subject_label"))
recast_globalmelt<-dcast(globalmelt,Subject_label+activity_name~variable,mean)


#####################################

##### STEP 6 : To write out both tables


#################################################
write.table(newglobal, "Data_set_mean_std_variables.txt",row.names=FALSE)
write.table(recast_globalmelt, "Data_set_mean_of_activity_and_subject.txt",row.names=FALSE)


# also adding csv files for convenience
write.table(newglobal, "Data_set_mean_std_variables.csv",sep=",",row.names=FALSE)
write.table(recast_globalmelt, "Data_set_mean_of_activity_and_subject.csv",sep=",",row.names=FALSE)

