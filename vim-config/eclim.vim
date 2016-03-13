let g:EclimProjectTreeAutoOpen=0 " open Eclipse project tree automatically
let g:EclimProjectTreeExpandPathOnOpen=1
let g:EclimProjectTreeSharedInstance=1 " share tree instance through all tabs
" use tabnew instead of split for new action
let g:EclimProjectTreeActions = [ {'pattern': '.*', 'name': 'Tab', 'action': 'tabnew'} ]
let g:EclimJavaSearchSingleResult = 'tabnew'
let g:EclimLocateFileDefaultAction = 'tabnew'
let g:EclimCompletionMethod = 'omnifunc'

nnoremap <leader>jt :ProjectTreeToggle<CR>
nnoremap <leader>i :JavaImportOrganize<CR>
nnoremap <leader>f :JavaFormat<CR>
nnoremap <leader>d :JavaDocPreview<CR>
nnoremap <leader>c :JavaCorrect<CR>
nnoremap <leader>j :lnext<CR>
nnoremap <leader>k :lprev<CR>
nnoremap <leader>o :lopen<CR>

" Unit testing
nnoremap <leader>ju :JUnit<CR>

" Searching
nnoremap <leader>s :JavaSearch<CR>
nnoremap <leader>jd :JavaSearch -x declarations<CR>
nnoremap <leader>jr :JavaSearch -x references<CR>
