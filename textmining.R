docs1 <- data.frame(docs = c(
"Для большинства экземпляров вид бабоч также характерна своеобразная червеобразная личинка с недоразвитыми брюшными ногами, называемая гусеницей. ",
"ископаемые останки этого вид которых известны начиная с юрского периода, ",
"в настоящее время вид  бабоч — один из наиболее богатых вид отряд насекомых, ",
"представители вид которого распространены на всех континентах, за исключением Антарктиды."

                            
                            ))
docs2 <- data.frame(docs = c(
  
"Теорем о бабоч является классической теорем планиметрии.",
"теорем Опубликована в 1815 году в англ мужском журнале «Gentleman's Diary» (англ.). ",
" авторство теорем приписывают англ математику Уильяму Джорджу Горнеру. ",
"Сформулировать теорем можно следующим образом:"

                            ))

ds1 <- DataframeSource(docs1)
ds2 <- DataframeSource(docs2)                    
r1 = Corpus(ds1)
r2 = Corpus(ds2)
r = c(r1,r2)
sw1 = c('kterou','tomu','které','tohoto','tzv')
sw1 = c('следующим','можно','образом','tzv')

sw2 = c('этого','также','которых','которого','для', 'всех')
sw = c(sw1,sw2)
tdm1=TermDocumentMatrix(r1,control = list(removePunctuation = TRUE,  stopwords = sw, 
                         minWordLength = 3))
tdm2=TermDocumentMatrix(r2,control = list(removePunctuation = TRUE,  stopwords = sw, 
                         minWordLength = 3))                    
tdm3=TermDocumentMatrix(r,control = list(removePunctuation = TRUE,  stopwords = sw, 
                         minWordLength = 3))  
dtm3=TermDocumentMatrix(r,control = list(removePunctuation = TRUE,  stopwords = sw, 
                         minWordLength = 3))

#tdm = c(tdm1,tdm2)
t11=NULL
i=0
keyterms = findFreqTerms(tdm3,2,5)
for(term in keyterms){
  i=i+1
t11= c(t11, data.frame(findAssocs(tdm3, keyterms[i], 0.2), row.names = NULL))
        
} 

print(t11)


