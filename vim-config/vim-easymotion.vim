"Update hjkl to work with easymotion
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)
let g:EasyMotion_startofline = 0 " keep cursor column when JK motion"

"Replace vim search (/) with easymotion search
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

"search for 'a' will match 'a' and 'A'. But search for 'A' will only match 'A'
let g:EasyMotion_smartcase = 1

" Bi-directional find motion
" `s{char}{label}`
nmap s <Plug>(easymotion-s)
