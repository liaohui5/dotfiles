--------------------------------------------------------------
-- 自动设置一些没有不常见的文件的filetype
-- 让 neovim 可以更方便的识别语法 & 高亮语法
--------------------------------------------------------------
vim.filetype.add({
  extension = {
    profile = "sh",
    json = "jsonc",
    env = "sh",
  },
  filename = {
    env = "sh",
    bashrc = "sh",
    yabairc = "sh",
    skhdrc = "sh",
    spacebarrc = "sh",
    sketchybarrc = "sh",
    [".bashrc"] = "sh",
    [".zprofile"] = "sh",
    ["vifmrc"] = "vim",
  },
  pattern = {
    ["%.env%.[%w_.-]+"] = "sh",
  },
})
