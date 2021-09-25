let g:dashboard_default_executive ='fzf'
let g:dashboard_enable_session = 0
let g:dashboard_custom_section={
            \ '0_session': {
                \ 'description': ['  List sessions                        SPC e s l'],
                \ 'command': 'CocList sessions'
                \ },
            \ '1_mru': {
                \ 'description': ['  Find recent                          SPC f f h'],
                \ 'command': 'CocList mru'
                \ },
            \ '2_files': {
                \ 'description': ['  Find files                           SPC f f f'],
                \ 'command': 'CocList files'
                \ },
            \ '3_note': {
                \ 'description': ['  Note index                           SPC n i ·'],
                \ 'command': 'NoteWikiIndex'
                \ },
            \ '4_scratch': {
                \ 'description': ['  Scratch buffer                       SPC n s ·'],
                \ 'command': 'ScratchBuffer'
                \ },
            \ '5_new': {
                \ 'description': ['  New buffer                           SPC e w ·'],
                \ 'command': 'enew'
                \ },
            \ '6_quit': {
                \ 'description': ['  Quit editor                          SPC q q ·'],
                \ 'command': 'qa'
                \ },
            \ }

let g:dashboard_custom_header = [
            \ '            :h-                                  Nhy`                ',
            \ '           -mh.                           h.    `Ndho                ',
            \ '           hmh+                          oNm.   oNdhh                ',
            \ '          `Nmhd`                        /NNmd  /NNhhd                ',
            \ '          -NNhhy                      `hMNmmm`+NNdhhh                ',
            \ '          .NNmhhs              ```....`..-:/./mNdhhh+                ',
            \ '           mNNdhhh-     `.-::///+++////++//:--.`-/sd`                ',
            \ '           oNNNdhhdo..://++//++++++/+++//++///++/-.`                 ',
            \ '      y.   `mNNNmhhhdy+/++++//+/////++//+++///++////-` `/oos:        ',
            \ ' .    Nmy:  :NNNNmhhhhdy+/++/+++///:.....--:////+++///:.`:s+         ',
            \ ' h-   dNmNmy oNNNNNdhhhhy:/+/+++/-         ---:/+++//++//.`          ',
            \ ' hd+` -NNNy`./dNNNNNhhhh+-://///    -+oo:`  ::-:+////++///:`         ',
            \ ' /Nmhs+oss-:++/dNNNmhho:--::///    /mmmmmo  ../-///++///////.        ',
            \ '  oNNdhhhhhhhs//osso/:---:::///    /yyyyso  ..o+-//////////:/.       ',
            \ '   /mNNNmdhhhh/://+///::://////     -:::- ..+sy+:////////::/:/.      ',
            \ '     /hNNNdhhs--:/+++////++/////.      ..-/yhhs-/////////::/::/`     ',
            \ '       .ooo+/-::::/+///////++++//-/ossyyhhhhs/:///////:::/::::/:     ',
            \ '       -///:::::::////++///+++/////:/+ooo+/::///////.::://::---+`    ',
            \ '       /////+//++++/////+////-..//////////::-:::--`.:///:---:::/:    ',
            \ '       //+++//++++++////+++///::--                 .::::-------::    ',
            \ '       :/++++///////////++++//////.                -:/:----::../-    ',
            \ '       -/++++//++///+//////////////               .::::---:::-.+`    ',
            \ '       `////////////////////////////:.            --::-----...-/     ',
            \ '        -///://////////////////////::::-..      :-:-:-..-::.`.+`     ',
            \ '         :/://///:///::://::://::::::/:::::::-:---::-.-....``/- -    ',
            \ '           ::::://::://::::::::::::::----------..-:....`.../- -+oo/  ',
            \ '            -/:::-:::::---://:-::-::::----::---.-.......`-/.      `` ',
            \ '           s-`::--:::------:////----:---.-:::...-.....`./:           ',
            \ '          yMNy.`::-.--::..-dmmhhhs-..-.-.......`.....-/:`            ',
            \ '         oMNNNh. `-::--...:NNNdhhh/.--.`..``.......:/-               ',
            \ '        :dy+:`      .-::-..NNNhhd+``..`...````.-::-`                 ',
            \ '                        .-:mNdhh:.......--::::-`                     ',
            \ '                           yNh/..------..`                           ',
            \ ]

" let g:dashboard_custom_header = [
"             \ '                 -`                                       ',
"             \ '                 *,                                       ',
"             \ '                 F>                                       ',
"             \ '              ,;`KF;;` ```                                ',
"             \ '         `,;>\7jQ@@DZS}11c,                               ',
"             \ '             `->wQQeSeeXk|`                               ',
"             \ '              `,:qeeuumz|::,.`                            ',
"             \ '     ``-`-     `ZKj6kz^axL?>r;`                    ```    ',
"             \ ' `;va9DNDm_   `=@ez6X:D?>>>>>r:`               `,/ekESi:` ',
"             \ ' :QQK6666k;   _gBew6P;eL>>>>>r:    ````,\Zma7::y#Nq6666X~ ',
"             \ ' ~QD66666k>` `]@6666k2:||>rr;_`_>72kKoXBN9kkkkkUk666666k; ',
"             \ ' ,dN666666\``;@H6666kz,:;|}e{"\QNDK66666666666666666666k_ ',
"             \ ' `eQ6666667-,dQ66666m;K#g8OUh:KN666666666666666k6666666a` ',
"             \ ' .zQk66666],c@$6666k*\@66666j:QK66666kkk66666k{:o#k6666z` ',
"             \ ' -|@k66666o;QRk6666u~eQ6666ki>@66666E>>QK6666k:,9Nk6666|` ',
"             \ ' `r@666666PPQk6666E;"BD6666k^}Q6666kv,^Q$6666j`~QO6666k;  ',
"             \ '  ;QO666666Uk6666k/`^@U6666h_Hg6666k^`i@k666k/`;@k6666E~  ',
"             \ '  _Q866666666666ko`.iQk6666j:Qq6666P,`XQ6666k^`cQk6666j`  ',
"             \ '  ,D#66666666666k; `kBk6666i*@k6666F`~BR6666h_`6N66666c-  ',
"             \ '  `eQk666666666kv- :QH6666k^uQk6666\`;@U6666j`,QK6666k>`  ',
"             \ '  `1@k666666666e, `r@k6666h_&Mk666k;./@6666kL`;@k6666P:   ',
"             \ '  -/@k66666666kr` .zQk6666j;Q96666P,`eQ6666k;.|NPaFv|"`   ',
"             \ '  `=@U66666666}`  ,K#66666L|@k6666u`,qKkPo]*- ``-``       ',
"             \ '  `;Qd6666666X:   :QO6666k^F#kkkPj;``,:`-``               ',
"             \ '   :Bgk66666k|`  `?Qk66khx,;\>:,-`                        ',
"             \ '   ,D#k6666kj`   `;vi=;,.`                                ',
"             \ '   ,aK6kkmyi,                                             ',
"             \ '   `~r;"```                                               ',
"             \ '',
"             \ '',
"             \ ]

" let g:dashboard_custom_header = [
"             \ '',
"             \ '',
"             \ '  ██▄   █   ██▒   █▓ ██▓ ███▄ ▄███▓ ',
"             \ ' ██▒▀█▄ ██▒▓██░   █▒▓██▒▓██▒▀█▀ ██▒ ',
"             \ ' ██   ▀███░ ▓██  █▒░▒██▒▓██    ▓██░ ',
"             \ ' ██    ▒██▒  ▒██ █░░░██░▒██    ▒██  ',
"             \ '  █▒   ░█ ▒   ▒▀█░  ░██░▒██▒   ░██▒ ',
"             \ '  ▒░   ░  ░   ░ ▐░  ░▓  ░ ▒░   ░  ░ ',
"             \ '   ░      ░   ░ ░░   ▒ ░░  ░      ░ ',
"             \ '   ░            ░░   ▒ ░░      ░    ',
"             \ '                 ░   ░         ░    ',
"             \ '                ░                   ',
"             \ '',
"             \ ]

" let g:dashboard_custom_header = [
"             \ '',
"             \ '',
"             \ '',
"             \ '',
"             \ ' =================     ===============     ===============   ========  ======== ',
"             \ ' \\ . . . . . . .\\   //. . . . . . .\\   //. . . . . . .\\  \\. . .\\// . . // ',
"             \ ' ||. . ._____. . .|| ||. . ._____. . .|| ||. . ._____. . .|| || . . .\/ . . .|| ',
"             \ ' || . .||   ||. . || || . .||   ||. . || || . .||   ||. . || ||. . . . . . . || ',
"             \ ' ||. . ||   || . .|| ||. . ||   || . .|| ||. . ||   || . .|| || . | . . . . .|| ',
"             \ ' || . .||   ||. _-|| ||-_ .||   ||. . || || . .||   ||. _-|| ||-_.|\ . . . . || ',
"             \ ' ||. . ||   ||-`  || ||  `-||   || . .|| ||. . ||   ||-`  || ||  `|\_ . .|. .|| ',
"             \ ' || . _||   ||    || ||    ||   ||_ . || || . _||   ||    || ||   |\ `-_/| . || ',
"             \ ' ||_-` ||  .|/    || ||    \|.  || `-_|| ||_-` ||  .|/    || ||   | \  / |-_.|| ',
"             \ ' ||    ||_-`      || ||      `-_||    || ||    ||_-`      || ||   | \  / |  `|| ',
"             \ ' ||    ``         || ||         ``    || ||    ``         || ||   | \  / |   || ',
"             \ ' ||            .===` `===.         .===`.`===.         .===` /==. |  \/  |   || ',
"             \ ' ||         .==`   \_|-_ `===. .===`   _|_   `===. .===` _-|/   `==  \/  |   || ',
"             \ ' ||      .==`    _-`    `-_  `=`    _-`   `-_    `=`  _-`   `-_  /|  \/  |   || ',
"             \ ' ||   .==`    _-`          `-__\._-`         `-_./__-`         `` |. /|  |   || ',
"             \ ' ||.==`    _-`                                                     `` |  /==.|| ',
"             \ ' ==`    _-`                                                            \/   `== ',
"             \ ' \   _-`                            N · V I M                           `-_   / ',
"             \ '  ```                                                                      ```  ',
"             \ ]

" let g:dashboard_custom_footer = ['N · V I M']
" let g:dashboard_custom_header = [
"             \ '',
"             \ '',
"             \ '   ⠀⠀⠀⠀⠀⠀⠀⠀⠀⡴⠞⠉⢉⣭⣿⣿⠿⣳⣤⠴⠖⠛⣛⣿⣿⡷⠖⣶⣤⡀⠀⠀⠀   ',
"             \ '    ⠀⠀⠀⠀⠀⠀⠀⣼⠁⢀⣶⢻⡟⠿⠋⣴⠿⢻⣧⡴⠟⠋⠿⠛⠠⠾⢛⣵⣿⠀⠀⠀⠀  ',
"             \ '    ⣼⣿⡿⢶⣄⠀⢀⡇⢀⡿⠁⠈⠀⠀⣀⣉⣀⠘⣿⠀⠀⣀⣀⠀⠀⠀⠛⡹⠋⠀⠀⠀⠀  ',
"             \ '    ⣭⣤⡈⢑⣼⣻⣿⣧⡌⠁⠀⢀⣴⠟⠋⠉⠉⠛⣿⣴⠟⠋⠙⠻⣦⡰⣞⠁⢀⣤⣦⣤⠀  ',
"             \ '    ⠀⠀⣰⢫⣾⠋⣽⠟⠑⠛⢠⡟⠁⠀⠀⠀⠀⠀⠈⢻⡄⠀⠀⠀⠘⣷⡈⠻⣍⠤⢤⣌⣀  ',
"             \ '    ⢀⡞⣡⡌⠁⠀⠀⠀⠀⢀⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀⢿⡀⠀⠀⠀⠸⣇⠀⢾⣷⢤⣬⣉  ',
"             \ '    ⡞⣼⣿⣤⣄⠀⠀⠀⠀⢸⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡇⠀⠀⠀⠀⣿⠀⠸⣿⣇⠈⠻  ',
"             \ '    ⢰⣿⡿⢹⠃⠀⣠⠤⠶⣼⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡇⠀⠀⠀⠀⣿⠀⠀⣿⠛⡄⠀  ',
"             \ '    ⠈⠉⠁⠀⠀⠀⡟⡀⠀⠈⡗⠲⠶⠦⢤⣤⣤⣄⣀⣀⣸⣧⣤⣤⠤⠤⣿⣀⡀⠉⣼⡇⠀  ',
"             \ '    ⣿⣴⣴⡆⠀⠀⠻⣄⠀⠀⠡⠀⠀⠀⠈⠛⠋⠀⠀⠀⡈⠀⠻⠟⠀⢀⠋⠉⠙⢷⡿⡇⠀  ',
"             \ '    ⣻⡿⠏⠁⠀⠀⢠⡟⠀⠀⠀⠣⡀⠀⠀⠀⠀⠀⢀⣄⠀⠀⠀⠀⢀⠈⠀⢀⣀⡾⣴⠃⠀  ',
"             \ '    ⢿⠛⠀⠀⠀⠀⢸⠁⠀⠀⠀⠀⠈⠢⠄⣀⠠⠼⣁⠀⡱⠤⠤⠐⠁⠀⠀⣸⠋⢻⡟⠀⠀  ',
"             \ '    ⠈⢧⣀⣤⣶⡄⠘⣆⠀⠀⠀⠀⠀⠀⠀⢀⣤⠖⠛⠻⣄⠀⠀⠀⢀⣠⡾⠋⢀⡞⠀⠀⠀  ',
"             \ '    ⠀⠀⠻⣿⣿⡇⠀⠈⠓⢦⣤⣤⣤⡤⠞⠉⠀⠀⠀⠀⠈⠛⠒⠚⢩⡅⣠⡴⠋⠀⠀⠀⠀  ',
"             \ '    ⠀⠀⠀⠈⠻⢧⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⣻⠿⠋⠀⠀⠀⠀⠀⠀  ',
"             \ '    ⠀⠀⠀⠀⠀⠀⠉⠓⠶⣤⣄⣀⡀⠀⠀⠀⠀⠀⢀⣀⣠⡴⠖⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀  ',
"             \ '                                       ',
"             \ ]


" autocmd FileType dashboard set showtabline=0
" autocmd WinLeave <buffer> set showtabline=1
