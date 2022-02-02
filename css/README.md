# 精简版本的impress.js

主要去掉了``extras``下多达几十兆的``mathjax``插件。

## 用法

我通常使用 ``git submodule add`` 命令把这个库加到我的展示目录下的``impress.js``子目录。

```sh
git submodule add https://github.com/thawk/impress-shim impress.js
```

最终的目录结构（``css``目录可以使用[这个版本](https://github.com/thawk/impress-css)）：

```
.
├── css
├── impress.js
│   ├── css
│   ├── js
│   └── extras
├── presentation1.html
└── presentation2.html
```

我通常使用以下HTML：

```html
<script src="impress.js/extras/markdown/markdown.js" charset="utf-8"></script>
<!-- <script src="impress.js/extras/highlight/highlight.pack.js" charset="utf-8"></script> -->
<script src="impress.js/js/impress.js" charset="utf-8"></script>
<script charset="utf-8">impress().init();</script>
```

