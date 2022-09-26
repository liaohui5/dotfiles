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

//////////////////////////////////////////////////////////////////////////////////////
// ╭──────────────────────────────────────────────────────────────────────────────╮ //
// │                    __                 _   _                                  │ //
// │                  / _|_   _ _ __   ___| |_(_) ___  _ __  ___                  │ //
// │                 | |_| | | | '_ \ / __| __| |/ _ \| '_ \/ __|                 │ //
// │                 |  _| |_| | | | | (__| |_| | (_) | | | \__ \                 │ //
// │                 |_|  \__,_|_| |_|\___|\__|_|\___/|_| |_|___/                 │ //
// ╰──────────────────────────────────────────────────────────────────────────────╯ //
//////////////////////////////////////////////////////////////////////////////////////
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
  var pattern = new RegExp('^(https?:\\/\\/)?' +        // protocol
  '((([a-z\\d]([a-z\\d-]*[a-z\\d])*)\\.?)+[a-z]{2,}|' + // domain name
  '((\\d{1,3}\\.){3}\\d{1,3}))' +                       // OR ip (v4) address
  '(\\:\\d+)?(\\/[-a-z\\d%_.~+]*)*' +                   // port and path
  '(\\?[;&a-z\\d%_.~+=-]*)?' +                          // query string
  '(\\#[-a-z\\d_]*)?$','i');                            // fragment locator
  return pattern.test(str);
}

// 打开prompt弹窗,输入url并打开
function getPromptURL(url) {
  var inputUrl = window.prompt("Please input url", url);
  if (!inputUrl) {
    return;
  }
  inputUrl = inputUrl.trim();
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
// │                    |___/                             |___/                   │ //
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
  var url = getPromptURL("");
  url && window.open(url);
});

// 打开输入框, 输入网址并打开(当前页)
api.mapkey("oO", "open prompt input url(current tab)", function () {
  var url = getPromptURL("");
  if (url) {
    window.location.href = url;
  }
});

// 编辑当前网址, 并且打开(新标签页)
api.mapkey("oe", "edit current url", function () {
  var url = getPromptURL(window.location.href);
  url && window.open(url);
});

// 编辑当前网址, 并且打开(当前页)
api.mapkey("oE", "edit current url(current tab)", function () {
  var url = getPromptURL(window.location.href);
  if (url) {
    window.location.href = url;
  }
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
    favicon_url: "https://static.npmjs.com/3dc95981de4241b35cd55fe126ab6b2c.png",
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
    desc: "Open blog",
    url: "https://liaohui5.github.io/study-notes/#/",
  },
  {
    desc: "Open github profile",
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
// │                                    _   _                                     │ //
// │                       ___  _ __ | |_(_) ___  _ __  ___                       │ //
// │                      / _ \| '_ \| __| |/ _ \| '_ \/ __|                      │ //
// │                     | (_) | |_) | |_| | (_) | | | \__ \                      │ //
// │                      \___/| .__/ \__|_|\___/|_| |_|___/                      │ //
// │                                     |_|                                      │ //
// ╰──────────────────────────────────────────────────────────────────────────────╯ //
//////////////////////////////////////////////////////////////////////////////////////
// 显示当前模式
settings.showModeStatus = true;

// 显示搜索框时延迟多少秒显示搜索结果提示
settings.omnibarSuggestionTimeout = 100;

// 按下按键延迟多少毫秒显示提示
settings.richHintsForKeystroke = 100;

// 设置主题
settings.theme = `
.sk_theme {
  font-size: 10pt;
  background: #24272e;
  color: #abb2bf;
}
.sk_theme tbody {
  color: #fff;
}
.sk_theme input {
  color: #d0d0d0;
}
.sk_theme .url {
  color: #61afef;
}
.sk_theme .annotation {
  color: #56b6c2;
}
.sk_theme .omnibar_highlight {
  color: #528bff;
}
.sk_theme .omnibar_timestamp {
  color: #e5c07b;
}
.sk_theme .omnibar_visitcount {
  color: #98c379;
}
.sk_theme #sk_omnibarSearchResult ul li:nth-child(odd) {
  background: #303030;
}
.sk_theme #sk_omnibarSearchResult ul li.focused {
  background: #3e4452;
}
#sk_status {
  position: fixed;
  bottom: 0;
  left: 0;
  right: auto;
  border-radius: 0;
}
#sk_status, #sk_find {
  font-size: 15pt;
}`;

