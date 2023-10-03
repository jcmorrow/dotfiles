" clojure setup attempt
if exists("did_load_filetypes")
  finish
endif
augroup filetypedetect
  au! BufRead,BufNewFile *.bb                setfiletype clojure
augroup END
