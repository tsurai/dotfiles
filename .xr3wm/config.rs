pub fn get_config<'a>() -> Config<'a> {
  let mut cfg : Config = Default::default();

  let tags : Vec<String> = (vec!("一: ターミナル", "二: ウェブ", "三: コード", "四: メディア", "五: スチーム", "六: ラテック", "七: 音楽", "八: im", "九: 残り")).into_iter().map(String::from_str).collect();
  cfg.workspaces = (1..10).map(|idx| WorkspaceConfig { tag: tags[idx-1].clone(), screen: 0, layout: StrutLayout::new(GapLayout::new(5, TallLayout::new(1, 0.5, 0.05))) }).collect();
  cfg.greedy_view = false;
/*
  cfg.manage_hooks.push(
    ManageHook {
      class_name: String::from_str("Iceweasel"),
      cmd: CmdManage::Move(2)
    });

    cfg.manage_hooks.push(
    ManageHook {
      class_name: String::from_str("Gajim"),
      cmd: CmdManage::Move(3)
    });

  cfg.manage_hooks.push(
    ManageHook {
      class_name: String::from_str("Icedove"),
      cmd: CmdManage::Move(4)
    });
*/
  cfg.log_hook = Some(
    LogHook {
      logs: vec![CmdLogHook::Workspaces, CmdLogHook::Title, CmdLogHook::Layout],
      output: box move |infos: Vec<LogInfo>| -> String {
        let mut workspaces = String::new();
        let mut title = String::new();
        let mut layout = String::new();

        for info in infos.into_iter() {
          match info {
            LogInfo::Workspaces(tags, current, visible, urgent) => {
              workspaces = tags.iter().enumerate().map(|(i,tag)| {
                let (fg,bg) = if i == current {
                  ("#fafafa","#4271ae")
                } else if visible.iter().any(|&x| x == i) {
                  ("#4271ae","#fafafa")
                } else if urgent[i] {
                  ("#fafafa","#ee0000")
                } else {
                  ("#4d4d4c","#fafafa")
                };
                format!("<fc={},{}>[{}]</fc>", fg, bg, tag)
              }).collect::<Vec<String>>().connect(" ");
            },
            LogInfo::Title(val) => {
              title = val;
            },
            LogInfo::Layout(val) => {
              layout = val;
            }
          }
        }

        format!("{}  |  {}  |  {}", workspaces, layout, title)
      }
    });

  cfg
}
