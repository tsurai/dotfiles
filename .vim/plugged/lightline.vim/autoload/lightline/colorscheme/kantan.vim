let s:black = [ '', 0 ]
let s:gray = [ '', 235 ]
let s:white = [ '', 7 ]
let s:blue = [ '' , 4 ]
let s:green = [ '', 2 ]
let s:purple = [ '', 5 ]
let s:red = [ '', 1 ]
let s:lightred = [ '', 9 ]
let s:yellow = [ '', 3 ]

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
let s:p.normal.left = [ [ s:black, s:green ], [ s:green, s:gray ] ]
let s:p.normal.right = [ [ s:black, s:green ], [ s:green, s:gray ] ]
let s:p.inactive.left =  [ [ s:black, s:blue ], [ s:blue, s:gray ] ]
let s:p.inactive.right = [ [ s:black, s:blue ], [ s:blue, s:gray ] ]
let s:p.insert.left = [ [ s:black, s:blue ], [ s:blue, s:gray ] ] 
let s:p.insert.right = [ [ s:black, s:blue ], [ s:blue, s:gray ] ]
let s:p.replace.left = [ [ s:white, s:red ], [ s:red, s:gray ] ]
let s:p.replace.right = [ [ s:white, s:red ], [ s:red, s:gray ] ]
let s:p.visual.left = [ [ s:black, s:purple ], [ s:purple, s:gray ] ]
let s:p.visual.right = [ [ s:black, s:purple ], [ s:purple, s:gray ] ]
let s:p.normal.middle = [ [ s:white, s:gray ] ]
let s:p.inactive.middle = [ [ s:white, s:gray ] ]
let s:p.tabline.left = [ [ s:blue, s:gray ] ]
let s:p.tabline.tabsel = [ [ s:black, s:blue ] ]
let s:p.tabline.middle = [ [ s:blue, s:gray ] ]
let s:p.tabline.right = [ [ s:black, s:blue ] ]
let s:p.normal.error = [ [ s:gray, s:lightred ] ]
let s:p.normal.warning = [ [ s:gray, s:yellow ] ]

let g:lightline#colorscheme#kantan#palette = lightline#colorscheme#flatten(s:p)
