//////////////////////////////////////////////////////////////////////////////////////
// ╭──────────────────────────────────────────────────────────────────────────────╮ //
// │                                _                                             │ //
// │                             __| | ___   ___ ___                              │ //
// │                            / _` |/ _ \ / __/ __|                             │ //
// │                           | (_| | (_) | (__\__ \                             │ //
// │                           \__,_|\___/ \___|___/                              │ //
// ╰──────────────────────────────────────────────────────────────────────────────╯ //
//////////////////////////////////////////////////////////////////////////////////////
// github:       https://github.com/brookhong/Surfingkeys
// README:       https://github.com/brookhong/Surfingkeys/blob/master/README_CN.md
// API:          https://github.com/brookhong/Surfingkeys/blob/master/docs/API.md
// conf-example: https://github.com/b0o/surfingkeys-conf
// online-conf:  https://raw.githubusercontent.com/liaohui5/dotfiles/main/serfingkeys/config.js

//////////////////////////////////////////////////////////////////////////////////////
// ╭──────────────────────────────────────────────────────────────────────────────╮ //
// │                    __                 _   _                                  │ //
// │                  / _|_   _ _ __   ___| |_(_) ___  _ __  ___                  │ //
// │                 | |_| | | | '_ \ / __| __| |/ _ \| '_ \/ __|                 │ //
// │                 |  _| |_| | | | | (__| |_| | (_) | | | \__ \                 │ //
// │                 |_|  \__,_|_| |_|\___|\__|_|\___/|_| |_|___/                 │ //
// ╰──────────────────────────────────────────────────────────────────────────────╯ //
//////////////////////////////////////////////////////////////////////////////////////
// 判断一个字符串是否是url
function isURL(str) {
  let urlReg = "^(https?:\\/\\/)?"; // protocol
  urlReg += "((([a-z\\d]([a-z\\d-]*[a-z\\d])*)\\.?)+[a-z]{2,}|"; // domain name
  urlReg += "((\\d{1,3}\\.){3}\\d{1,3}))"; // or ip (v4) address, like: 127.0.0.1
  urlReg += "(\\:\\d+)?(\\/[-a-z\\d%_.~+]*)*"; // port and path
  urlReg += "(\\?[;&a-z\\d%_.~+=-]*)?"; // query string
  urlReg += "(\\#[-a-z\\d_]*)?$"; // hash
  const pattern = new RegExp(urlReg, "i");
  return pattern.test(str);
}

// 处理url
function getFilterURL(inputUrl) {
  if (!inputUrl) {
    return;
  }
  inputUrl = inputUrl.trim();
  // 是否是以http或者https开头, 如果不是就加上 http://
  if (inputUrl.indexOf("http://") !== 0 && inputUrl.indexOf("https://") !== 0) {
    inputUrl = "http://" + inputUrl;
  }
  if (!isURL(inputUrl)) {
    api.Front.showPopup("input string is not a url");
    return;
  }
  return inputUrl;
}

// 显示URL编辑器
function showURLEditor(defaultValue, callback) {
  api.Front.showEditor(defaultValue, callback, "url");
}

//////////////////////////////////////////////////////////////////////////////////////
// ╭──────────────────────────────────────────────────────────────────────────────╮ //
// │             _              _     _           _ _                             │ //
// │            | | _____ _   _| |__ (_)_ __   __| (_)_ __   __ _ ___             │ //
// │            | |/ / _ \ | | | '_ \| | '_ \ / _` | | '_ \ / _` / __|            │ //
// │            |   <  __/ |_| | |_) | | | | | (_| | | | | | (_| \__ \            │ //
// │            |_|\_\___|\__, |_.__/|_|_| |_|\__,_|_|_| |_|\__, |___/            │ //
// │                     |___/                             |___/                  │ //
// ╰──────────────────────────────────────────────────────────────────────────────╯ //
//////////////////////////////////////////////////////////////////////////////////////
// 将<c-p><c-n>映射到<c-j><c-k>
api.cmap("<Ctrl-j>", "<Ctrl-n>");
api.cmap("<Ctrl-k>", "<Ctrl-p>");

// 左右切换tab标签页: Ctrl+h/Ctrl+l
api.map("H", "E");
api.map("L", "R");

// ctrl+u/ctrl+d 上下翻页
api.map("<Ctrl-u>", "u");
api.map("<Ctrl-d>", "d");

// 向左/右移动tab
api.map(">", ">>");
api.map("<", "<<");

// 搜索关键字(google)
api.mapkey("<Ctrl-p>", "search in google", function () {
  showURLEditor("", (input) => {
    window.open(`https://www.google.com.hk/search?q=${input}`);
  });
});

// 打开粘贴班中的 url
api.mapkey("p", "Open the clipboard's URL in the current tab", () => {
  api.Clipboard.read(function (response) {
    window.location.href = response.data;
  });
});

// 打开输入框, 输入网址并打开(新标签页)
api.mapkey("oo", "open prompt input url", () => {
  showURLEditor("", (input) => {
    const url = getFilterURL(input);
    url && window.open(url);
  });
});

// 打开输入框, 输入网址并打开(当前页)
api.mapkey("oO", "open prompt input url(current tab)", () => {
  showURLEditor("", (input) => {
    const url = getFilterURL(input);
    if (url) window.location.href = url;
  });
});

// 编辑当前网址, 并且打开(新标签页)
api.mapkey("oe", "edit current url", function () {
  showURLEditor(window.location.href, (input) => {
    const url = getFilterURL(input);
    url && window.open(url);
  });
});

// 编辑当前网址, 并且打开(当前页)
api.mapkey("oE", "edit current url(current tab)", function () {
  showURLEditor(window.location.href, (input) => {
    const url = getFilterURL(input);
    if (url) window.location.href = url;
  });
});

// o[number] 直接打开url
const links = [
  {
    desc: "打开博客",
    url: "https://liaohui5.github.io/study-notes/#/",
  },
  {
    desc: "打开 Github 个人页",
    url: "https://github.com/liaohui5",
  },
  {
    desc: "打开 dotfiles",
    url: "https://github.com/liaohui5/dotfiles",
  },
];
let key, item;
for (let i = 0, l = links.length; i < l; i++) {
  key = i + 1;
  item = links[i];
  api.mapkey(`o${key}`, item.desc, () => api.tabOpenLink(item.url));
}

//////////////////////////////////////////////////////////////////////////////////////
// ╭──────────────────────────────────────────────────────────────────────────────╮ //
// │                                  _   _                                       │ //
// │                       ___  _ __ | |_(_) ___  _ __  ___                       │ //
// │                      / _ \| '_ \| __| |/ _ \| '_ \/ __|                      │ //
// │                     | (_) | |_) | |_| | (_) | | | \__ \                      │ //
// │                      \___/| .__/ \__|_|\___/|_| |_|___/                      │ //
// │                           |_|                                                │ //
// ╰──────────────────────────────────────────────────────────────────────────────╯ //
//////////////////////////////////////////////////////////////////////////////////////
// 设置语言(默认英文)
settings.language = "zh-CN";

// 显示当前模式
settings.showModeStatus = true;

// 显示搜索框时延迟多少秒显示搜索结果提示
settings.omnibarSuggestionTimeout = 100;

// 按下按键延迟多少毫秒显示提示
settings.richHintsForKeystroke = 100;

// 使用 github API 来解析 markdown
settings.useLocalMarkdownAPI = false;

// 自动选中第一个结果
settings.focusFirstCandidate = true;

// 设置主题: https://github.com/brookhong/Surfingkeys/wiki/Color-Themes
settings.theme = `
.sk_theme {
  font-family: SauceCodePro Nerd Font, Consolas, Menlo, monospace;
  font-size: 10pt;
  background: #f0edec;
  color: #2c363c;
}
.sk_theme tbody {
  color: #f0edec;
}
.sk_theme input {
  color: #2c363c;
}
.sk_theme .url {
  color: #1d5573;
}
.sk_theme .annotation {
  color: #2c363c;
}
.sk_theme .omnibar_highlight {
  color: #88507d;
}
.sk_theme #sk_omnibarSearchResult ul li:nth-child(odd) {
  background: #f0edec;
}
.sk_theme #sk_omnibarSearchResult ul li.focused {
  background: #cbd9e3;
}
#sk_keystroke {
  background: #f0edec !important;
  color: #2c363c !important;
}
#sk_status {
  position: fixed;
  bottom: 0;
  left: 0;
  right: auto;
  border-radius: 0;
  border: none !important;
  background-color: rgba(81, 162, 116, 0.15);
  color: #888;
}
#sk_status, #sk_find {
  font-size: 12pt;
}`;

/* prettier-ignore */
const hintsCss = "font-size: 10pt; border: none; color:#f8f8f8; background: initial; background-color: #51a274;";
api.Hints.style(hintsCss);
api.Hints.style(hintsCss, "text");
