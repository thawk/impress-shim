精简版本的[impress.js](https://github.com/impress/impress.js)。

Shimmed version of [impress.js](https://github.com/impress/impress.js) for easy using.

https://github.com/thawk/impress-shim

- 去掉了``extras``下多达几十兆的``mathjax``插件
- 使用更新的`impress.js`

# 用法

可以使用`git subtree`加入自己的幻灯片项目中。

- Add git subtree
  ```sh
  git subtree add --prefix impressjs/impress.js https://github.com/thawk/impress-shim master --squash
  ```

- Update git subtree
  ```sh
  git subtree pull --prefix impressjs/impress.js https://github.com/thawk/impress-shim master --squash
  ```

- Might add a remote to easy operation:
  ```sh
  git remote add -f impress-shim https://github.com/thawk/impress-shim
  git subtree add  --prefix impressjs/impress.js impress-shim master --squash
  git subtree pull --prefix impressjs/impress.js impress-shim master --squash
  git subtree push --prefix impressjs/impress.js impress-shim master
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

