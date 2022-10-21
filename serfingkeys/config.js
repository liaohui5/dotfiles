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
// 设置主题: https://github.com/brookhong/Surfingkeys/wiki/Color-Themes
function setTheme(theme) {
  const themes = {
    gruvbox: `
    .sk_theme {
      font-size: 10pt;
      background: #282828;
      color: #ebdbb2;
    }
    .sk_theme tbody {
      color: #b8bb26;
    }
    .sk_theme input {
      color: #d9dce0;
    }
    .sk_theme .url {
      color: #98971a;
    }
    .sk_theme .annotation {
      color: #b16286;
    }
    .sk_theme .omnibar_highlight {
      color: #ebdbb2;
    }
    .sk_theme #sk_omnibarSearchResult ul li:nth-child(odd) {
      background: #282828;
    }
    .sk_theme #sk_omnibarSearchResult ul li.focused {
      background: #51a274;
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
    }`,
    light: {
      callback: function () {
        const hintsCss =
          "font-size: 10pt; border: none; color:#f8f8f8; background: initial; background-color: #51a274;";
        api.Hints.style(hintsCss);
        api.Hints.style(hintsCss, "text");
      },
      styles: `
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
      }`,
    },
  };
  let item = themes[theme];
  if (typeof item === "undefined") {
    item = themes["gruvbox"];
  }
  if (typeof item === "string") {
    settings.theme = item;
  } else if (typeof item === "object") {
    settings.theme = item.styles;
    item.callback();
  }
}

// 遍历数组, 并执行 callback
function each(array, callback) {
  var item;
  for (var i = 0, l = array.length; i < l; i++) {
    item = array[i];
    typeof callback === "function" && callback(item, i);
  }
}

// 判断一个字符串是否是url
function isURL(str) {
  var urlReg = "^(https?:\\/\\/)?"; // protocol
  urlReg += "((([a-z\\d]([a-z\\d-]*[a-z\\d])*)\\.?)+[a-z]{2,}|"; // domain name
  urlReg += "((\\d{1,3}\\.){3}\\d{1,3}))"; // or ip (v4) address, like: 127.0.0.1
  urlReg += "(\\:\\d+)?(\\/[-a-z\\d%_.~+]*)*"; // port and path
  urlReg += "(\\?[;&a-z\\d%_.~+=-]*)?"; // query string
  urlReg += "(\\#[-a-z\\d_]*)?$"; // hash
  var pattern = new RegExp(urlReg, "i");
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

// ctrl+p: 直接 google 搜索
api.map("<Ctrl-p>", "og");

// 左右切换tab标签页: H, L
api.map("H", "E");
api.map("L", "R");

// ctrl+u/ctrl+d 上下翻页
api.map("<Ctrl-u>", "u");
api.map("<Ctrl-d>", "d");
// api.mapkey('<Ctrl-d>', '#9Forward half page', function() { api.Normal.feedkeys('5j'); });
// api.mapkey('<Ctrl-u>', '#9Back half page', function() { api.Normal.feedkeys('5k'); });

// 向左/右移动tab
api.map(">", ">>");
api.map("<", "<<");

// 打开粘贴班中的 url
api.mapkey("p", "Open the clipboard's URL in the current tab", function () {
  api.Clipboard.read(function (response) {
    window.location.href = response.data;
  });
});

// 打开输入框, 输入网址并打开(新标签页)
api.mapkey("oo", "open prompt input url", function () {
  api.Front.showEditor("", function (input) {
    const url = getFilterURL(input);
    url && window.open(url);
  }, "url");
});

// 打开输入框, 输入网址并打开(当前页)
api.mapkey("oO", "open prompt input url(current tab)", function () {
  api.Front.showEditor("", function (input) {
    const url = getFilterURL(input);
    if (url) window.location.href = url;
  }, "url");
});

// 编辑当前网址, 并且打开(新标签页)
api.mapkey("oe", "edit current url", function () {
  api.Front.showEditor(window.location.href, function (input) {
    const url = getFilterURL(input);
    url && window.open(url);
  }, "url");
});

// 编辑当前网址, 并且打开(当前页)
api.mapkey("oE", "edit current url(current tab)", function () {
  api.Front.showEditor(window.location.href, function (input) {
    const url = getFilterURL(input);
    url && window.open(url);
    if (url) window.location.href = url;
  }, "url");
});

// 自定义搜索
var searchUrls = [
  {
    key: "B",
    engine: "Bilibili",
    url: "https://search.bilibili.com/all?keyword=",
    favicon_url: "https://www.bilibili.com/favicon.ico",
  },
  {
    key: "N",
    engine: "npm",
    url: "https://www.npmjs.com/search?q=",
    favicon_url:
      "https://static.npmjs.com/3dc95981de4241b35cd55fe126ab6b2c.png",
  },
  {
    key: "M",
    engine: "MDN",
    url: "https://developer.mozilla.org/en-US/search?q=",
    favicon_url: "https://developer.mozilla.org/apple-touch-icon.6803c6f0.png",
  },
];
each(searchUrls, function (item) {
  api.addSearchAlias(
    item.key,
    item.engine,
    item.url,
    "o",
    item.url,
    Function.prototype,
    "",
    {
      favicon_url: item.favicon_url,
    }
  );
});

// o[number] 直接打开url
var urls = [
  {
    desc: "打开博客",
    url: "https://liaohui5.github.io/study-notes/#/",
  },
  {
    desc: "打开 Github 个人页",
    url: "https://github.com/liaohui5",
  },
];
each(urls, function (item, i) {
  var key = "o" + (i + 1);
  api.mapkey(key, item.desc, function () {
    api.tabOpenLink(item.url);
  });
});

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

// 设置主题
setTheme("light");
