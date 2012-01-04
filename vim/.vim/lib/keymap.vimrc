" カーソルキーを無効にする
map <DOWN> <ESC>
map <UP> <ESC>
map <LEFT> <ESC>
map <RIGHT> <ESC>

imap <DOWN> <NOP>
imap <UP> <NOP>
imap <LEFT> <NOP>
imap <RIGHT> <NOP>

" キーマップリーダー
let mapleader=","

" : ; 入れ替え
nnoremap ; :

" インサートモードを抜ける
inoremap jj <ESC>
inoremap kk <ESC>

" 基本移動
nnoremap h <Left>
nnoremap j gj
nnoremap k gk
nnoremap l <Right>

" 移動支援
noremap H ^
noremap L $
nnoremap J 3gj
nnoremap K 3gk

" 画面移動
noremap <Space>j <C-f>
noremap <Space>k <C-b>
noremap <C-i><C-i> :<C-u>help<Space><C-r><C-w><CR>

" ヤンク
nnoremap Y y$
nnoremap vy vawy
vnoremap v $h

" 保存・終了
nnoremap <Space>ww :<C-u>w<CR>
nnoremap <Space>wq :<C-u>wq<CR>
nnoremap <Space>q :<C-u>q<CR>

" インサートモード
imap <C-e> <End>
imap <C-a> <Home>
imap <C-h> <Backspace>
imap <C-d> <Del>

" 空行挿入
inoremap <Leader><Leader> <ESC>:<C-u>call append(expand('.'), '')<CR>ji
nnoremap <Leader><Leader> :<C-u>call append(expand('.'), '')<CR>j
