library(XML)
library(httr)
library(RCurl)

#get download page url path
pathURL = "https://www.ptt.cc/bbs/movie/index.html"
tempDATA = getURL(pathURL)
xmldoc = htmlParse(tempDATA,encoding = "UTF-8")
title = xpathApply(xmldoc,"//div[@class=\"title\"]",xmlValue)
url = xpathApply(xmldoc,"//div[@class='title']/a//@href",xmlValue)
date = xpathApply(xmldoc,"div[@class=\"date\"]",xmlValue)

help(setwd)
getwd()
setwd("/Users/user/Desktop/proooo/codepen/R")
getwd()
