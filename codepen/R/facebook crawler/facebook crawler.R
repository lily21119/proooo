#清除記憶體=旁邊的小掃把=
rm(list=ls(all.names = TRUE))


library(httr)
library(rjson)
library(httpuv)
library(Rfacebook)

#資料分段，此兩段為固定，所以放這邊~~
prefex ="https://graph.facebook.com/v2.8/"
token  ="EAACEdEose0cBAMXcegbKnXO6EYHpbbuDj9z6JFGDHwoQUkuxvEpqZBEVJ6Dj7DeLWmsctQEdgzrMyPZCmfNXMil63cKYEvQQytWc0xun2Lx53PjjNFxjbzhNsEBPX87wKjbdI0bodjsrtZCrkumhw7R2ZBZCe1E52ZAl4p5vdnKQZDZD

#==============================================================================

attrs  = "me/friends?access_token="
#融合所有網址
url = paste0(prefex,attrs,token)
#抓資料，資料名稱:res
res = GET(url)
#再底下用"res$"找到資料在content
#整理資料，將資料內容整理為text檔，編碼是UTF-8
data = content(res)
#groups是把data裡的東西全部拉長變成一個長長的盒子
groups  = matrix(unlist(data$data))
#定義after在哪兒
after   = data$paging$cursors$after
#nextflg是data底下的paging下的第二個孩子(因為next是R底下的保留單字，所以只能用第幾個表示)
nextflg = data$paging[2]

#迴圈(當next不等於空白時就不停止)
while( nextflg !="")
{
  nextUrl   = paste0(url,"&after=",after)
  nextres   = GET(nextUrl)
  nextdata  = content(nextres)
  nextgroups= matrix(unlist(nextdata$data))
  after     = nextdata$paging$cursors$after
  nextflg   = data$paging[2]
}


