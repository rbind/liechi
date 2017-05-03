---
title: "Second test for rmd file"
author: "Liechi Zhang"
date: '2017-05-04'
slug: second-test-for-rmd-file
tags: []
categories: []
from_Rmd: yes
---

If you see this, it means my rmd file is succesfully compiled to a webpage.

Now I will draw a plot to display 100 random numbers.


```r
x <- 1:100
y <- rnorm(100, 100, 100)
plot(x, y)
abline(h = 100)
```

![plot of chunk Random](/figures/en/2017-05-04-second-test-for-rmd-file/Random-1.png)

In this example, I ran `blogdown::build_site()` after I wrote the contents, but I received an error like this:
  
>
Error in loadNamespace(name) : there is no package called ‘xaringan’
Calls: local ... tryCatch -> tryCatchList -> tryCatchOne -> <Anonymous>
Execution halted
Error in build_one(unlist(files[i, ])) : 
  Failed to compile content/en/2017-05-04-second-test-for-rmd-file.Rmd to content/en/2017-05-04-second-test-for-rmd-file.md
Execution halted
Error in run_script("R/build.R", as.character(local)) : 
  Failed to run R/build.R
  
  
I do not well understand why "xaringan" is needed, but anyway, I install "xaringan", then rebuild the site. Now I can see a new markdown file generated, and I added this file, commited, and pushed to the github repo（Maybe you feel curious about the tense I used here, the same feeling that in the letter, you see, "I hope to send some money to you with this letter, but unfortunately the envelope is already sealed"）.

