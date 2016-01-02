rm(list=ls(all=TRUE)) # clear data
library("bitops"); library("RCurl"); library("digest"); library("rjson"); library("RJSONIO"); library("XML"); library("ROAuth"); require("ROAuth"); library("twitteR")

reqURL <- "https://api.twitter.com/oauth/request_token"
accURL = "http://api.twitter.com/oauth/access_token"
authURL = "http://api.twitter.com/oauth/authorize"
twitCred <- OAuthFactory$new(consumerKey="Xql2Nw0hLH5ZevHMeo0g9g",consumerSecret="d2vJicdLGFf0V28vhmaz7Vv0rB98ZAoxk7rAqufcgks",
                              requestURL=reqURL,
                             accessURL=accURL,
                             authURL=authURL)
### Replace "FILL_WITH_YOUR_CODE" with your own code linked to your twitter account (see the twitteR read-me for more info)
twitCred$handshake() ### After you hit return, wait. R will return a URL. Enter it into a browser, sign in with your twitter account, it'll give you a PIN. Enter the PIN back into R console.
registerTwitterOAuth(twitCred)

#JAPANESE TWITTER COLLECTION (START)
JAP.CITY_NAMES <- c('Tokyo', 'Osaka') #

JAP.GEOCODE <- c('35.689506,139.6917,200km','34.693889,135.502222,200km')
### each city's geocode plus 25mi radius. Get the longitude/latitude from wikipedia!
#make empty vectors to put stuff into for the loop
#Loop to collect tweets (START)
for(o in 48:49){
	JAP.TWEETS <- vector()
	JAP.LOCATION <- vector()
	for(i in 1:10){
		for(j in 1:length(JAP.GEOCODE)) {
   			temp.JAP.TWEETS <- searchTwitter("", n=100, geocode=JAP.GEOCODE[j]) #get 100 JAP.TWEETS from JAPANESE geocodes
   			JAP.LOCATION <- append(JAP.LOCATION, rep(JAP.CITY_NAMES[j], length(temp.JAP.TWEETS))) #in case there are less than n 		JAP.TWEETS
   			JAP.TWEETS <- append(JAP.TWEETS, temp.JAP.TWEETS)
   		} #end 1st inner loop
   Sys.sleep(5)
	}#end 2nd inner loop
	length(JAP.TWEETS);length(JAP.LOCATION)
##Loop to collect tweets (END)
	JAP.text<-vector()
		for(k in 1:length(JAP.TWEETS)){
		JAP.text<-append(JAP.text,JAP.TWEETS[[k]]$text)
		}
	str(JAP.text)
	JAP.sn<-vector()
	for(l in 1:length(JAP.TWEETS)){
		JAP.sn<-append(JAP.sn,JAP.TWEETS[[l]]$screenName)
		}
	str(JAP.sn);head(JAP.sn)
#	JAP.id<-vector()
#	for(m in 1:length(JAP.TWEETS)){
#		JAP.id<-append(JAP.id,JAP.TWEETS[[m]]$id)
#		}
#	str(JAP.id);head(JAP.id)
	JAP.dt<-vector()
	for(n in 1:length(JAP.TWEETS)){
		JAP.dt<-append(JAP.dt,JAP.TWEETS[[n]]$created)
		}
	str(JAP.dt);head(JAP.dt)
#JAP.rpsn<-vector()
#for(p in 1:length(JAP.TWEETS)){
#	JAP.rpsn<-append(JAP.rpsn,JAP.TWEETS[[p]]$replyToSN)
#}
#str(JAP.rpsn);head(JAP.rpsn)
#JAP.rpuid<-vector()
#for(q in 1:length(JAP.TWEETS)){
#	JAP.rpuid<-append(JAP.rpuid,JAP.TWEETS[[q]]$replyToUID)
#}
#str(JAP.rpuid);head(JAP.rpuid)

#CLEAN UP JAP TWEET TEXT FOR NEWLINES (START)
JAP.text2<-gsub("\\\n", "NEWLINE",JAP.text);head(JAP.text2)
#CLEAN UP JAP TWEET TEXT FOR NEWLINES (END)
JAP.tweets<-data.frame(JAP.sn, JAP.text2, JAP.dt, JAP.LOCATION)
#write.table(JAP.tweets,file="./Twitter_Japanese/JAP-Twitter-twitteR-2013-02-21-010.csv", quote=F, sep="\t", col.names=c("User", "Text", "DateTime", "Location"), row.names=T)
outfile<-sprintf("../../Corpora/Twitter_JAPANESE/JAP-Twitter-twitteR-2013-04-10-0%d.csv", o)
write.table(JAP.tweets,file=outfile, quote=F, sep="\t", col.names=c("User", "Text", "DateTime", "Location"), row.names=T)
} #end outer loop
#JAPANESE TWITTER COLLECTION (END)

#KOREAN TWITTER COLLECTION (START)
KOR.CITY_NAMES <- c('Seoul','Busan') #

KOR.GEOCODE <- c('37.566536,126.977969,50km','35.179444,129.075556,50km')
### each city's geocode plus 25mi radius. Get the longitude/latitude from wikipedia!


#make empty vectors to put stuff into for the loop
#Loop to collect tweets (START)
for(o in 64:65){
	KOR.TWEETS <- vector()
	KOR.LOCATION <- vector()
	for(i in 1:10){
		for(j in 1:length(KOR.GEOCODE)) {
   			temp.KOR.TWEETS <- searchTwitter("", n=100, geocode=KOR.GEOCODE[j]) #get 100 KOR.TWEETS from KOREAN geocodes
   			KOR.LOCATION <- append(KOR.LOCATION, rep(KOR.CITY_NAMES[j], length(temp.KOR.TWEETS))) #in case there are less than n 		KOR.TWEETS
   			KOR.TWEETS <- append(KOR.TWEETS, temp.KOR.TWEETS)
   		} #end 1st inner loop
 	  Sys.sleep(5)
	}#end 2nd inner loop
	length(KOR.TWEETS);length(KOR.LOCATION)
##Loop to collect tweets (END)
	KOR.text<-vector()
		for(k in 1:length(KOR.TWEETS)){
		KOR.text<-append(KOR.text,KOR.TWEETS[[k]]$text)
		}
	str(KOR.text)
	KOR.sn<-vector()
	for(l in 1:length(KOR.TWEETS)){
		KOR.sn<-append(KOR.sn,KOR.TWEETS[[l]]$screenName)
		}
	str(KOR.sn);head(KOR.sn)
#	KOR.id<-vector()
#	for(m in 1:length(KOR.TWEETS)){
#		KOR.id<-append(KOR.id,KOR.TWEETS[[m]]$id)
#		}
#	str(KOR.id);head(KOR.id)
	KOR.dt<-vector()
	for(n in 1:length(KOR.TWEETS)){
		KOR.dt<-append(KOR.dt,KOR.TWEETS[[n]]$created)
		}
	str(KOR.dt);head(KOR.dt)
#KOR.rpsn<-vector()
#for(p in 1:length(KOR.TWEETS)){
#	KOR.rpsn<-append(KOR.rpsn,KOR.TWEETS[[p]]$replyToSN)
#}
#str(KOR.rpsn);head(KOR.rpsn)
#KOR.rpuid<-vector()
#for(q in 1:length(KOR.TWEETS)){
#	KOR.rpuid<-append(KOR.rpuid,KOR.TWEETS[[q]]$replyToUID)
#}
#str(KOR.rpuid);head(KOR.rpuid)

#CLEAN UP KOR TWEET TEXT FOR NEWLINES (START)
KOR.text2<-gsub("\\\n", "NEWLINE",KOR.text);head(KOR.text2)
#CLEAN UP KOR TWEET TEXT FOR NEWLINES (END)
KOR.tweets<-data.frame(KOR.sn, KOR.text2, KOR.dt, KOR.LOCATION)
#write.table(KOR.tweets,file="./Twitter_Korean/KOR-Twitter-twitteR-2013-02-21-010.csv", quote=F, sep="\t", col.names=c("User", "Text", "DateTime", "Location"), row.names=T)
outfile<-sprintf("../../Corpora/Twitter_Korean/KOR-Twitter-twitteR-2013-04-10-0%d.csv", o)
write.table(KOR.tweets,file=outfile, quote=F, sep="\t", col.names=c("User", "Text", "DateTime", "Location"), row.names=T)
} #end outer loop
#KOREAN TWITTER COLLECTION (END)

