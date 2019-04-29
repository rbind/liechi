local({
  # input/output filenames are passed as command-line arguments
  a = commandArgs(TRUE)
  if (length(a) < 2) stop(
    "The script build_one.R requires at least 2 command-line args"
  )
  unlink(a[2])

  # content/foo/bar/hi.Rmd -> foo/bar/hi
  d = xfun:::sans_ext(gsub('^content/', '', a[1])) #change knitr to xfun
  knitr::opts_chunk$set(
    fig.path   = sprintf('figures/%s/', d),
    cache.path = sprintf('blogdown/cache/%s/', d),
    error = FALSE, fig.width = 6, fig.height = 5, dpi = 96, tidy = TRUE
  )
  knitr::opts_knit$set(
    base.dir = normalizePath('static/', mustWork = TRUE),
    base.url = '/', width = 60
  )
  knitr::knit(a[1], a[2], quiet = TRUE, encoding = 'UTF-8', envir = .GlobalEnv)
  if (file.exists(a[2])) {
    x = blogdown:::append_yaml(
      xfun:::read_utf8(a[2]), list(from_Rmd = TRUE)
    )
    xfun:::write_utf8(xaringan:::protect_math(x), a[2])
    Sys.chmod(a[2], '0444')  # read-only (should not edit)
  }
})
#change blogdown to xfun and readUTF8 to read_utf8
#The sans_ext() was changed from knitr to xfun,
#and the blogdown:::readUTF8() and blogdown:::writeUTF8()
#were changed to xfun:::read_utf8() and xfun:::write_utf8().
#These changes affected R/build_one.R, instead of R/build.R,
#so the rmd files were not knitted.(19/04/29 commented)
