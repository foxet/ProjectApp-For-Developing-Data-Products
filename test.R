library(htmltools)
library(htmlwidgets)
library(metricsgraphics)
library(RColorBrewer)
tmp <- data.frame(year=seq(1790, 1970, 10), uspop=as.numeric(uspop))

tmp %>%
        mjs_plot(x=year, y=uspop) %>%
        mjs_line() %>%
        mjs_add_marker(1850, "Something Wonderful") %>%
        mjs_add_baseline(150, "Something Awful")


mjs_point(mjs_plot(mtcars,x=mpg, y=cyl))
        
print(tem)

tem<-data.frame(mpg=mtcars$mpg,x=mtcars[,'cyl'])
mjs_point(mjs_plot(tem,x,mpg))