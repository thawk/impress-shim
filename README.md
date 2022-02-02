# 常用CSS样式说明

个人用于 impress.js<sup>*</sup> 展示的CSS样式表。位于 https://github.com/thawk/impress-css 。

## 用法

可以使用 ``git submodule add`` 命令或者 ``git subtree add`` 命令把这个库加到展示目录下的``css``子目录。

- `git submodule`
  ```sh
  git submodule add https://github.com/thawk/impress-css.git css
  git submodule init
  ```
- `git subtree add`
  - Add git subtree
    [source,sh]
    ----
    git subtree add --prefix css https://github.com/thawk/impress-css master --squash
    ----
  - Update git subtree
    [source,sh]
    ----
    git subtree pull --prefix css https://github.com/thawk/impress-css master --squash
    ----

最终的目录结构（``impress.js``目录可以使用原版的[impress.js](https://github.com/impress/impress.js)，我自己使用[体积更小的版本](https://github.com/thawk/impress-shim)）：
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

我通常使用以下样式表组合：

```html
<link href="css/tachyons.min.css" rel="stylesheet" />
<link href="impress.js/css/impress-common.css" rel="stylesheet" />
<link href="css/fonts.css" rel="stylesheet" />
<link href="css/classic-slides.css" rel="stylesheet" />
<link href="css/themes/default" rel="stylesheet" />
```

## 主要样式表文件

### classic-slides.css

* 主要的样式定义
* 针对 impress.js<sup>*</sup> 定义了很多CSS类

  | 类名             | 作用                                | 类名     | 作用             |
  |------------------|-------------------------------------|----------|------------------|
  | .slide           | 有确定的宽度和高度，缺省没有边框    | .accent  | 重点颜色         |
  | .box             | 加边框                              | .accent1 | 同.accent        |
  | .title           | 标题页                              | .accent2 | 重点颜色2        |
  | .subslide        | 仅在当前步骤可见，如堆叠的页面      | .accent3 | 重点颜色3        |
  | .is-curr-step    | 只在当前step可见                    | .accent4 | 重点颜色4        |
  | .is-curr-substep | 仅在当前substep激活时可见           | .primary | 主要颜色         |
  | .remove          | 配合.is-curr-substep，删除而非隐藏  | .primary | 主要颜色         |
  | .fly-in          | 从上方飞入的效果                    | .success | 成功颜色         |
  | .fly-out         | 从下方飞出的效果                    | .warning | 告警颜色         |
  | .fade-in         | 渐显                                | .error   | 错误颜色         |
  | .fade-out        | 渐隐                                | .dark    | 深灰             |
  | .zoom-in         | 缩小                                | .light   | 浅灰             |
  | .zoom-out        | 放大                                | .navy    | 深灰色           |
  | .borderless      | 应用到table上，没有表格边框         | .green   | 绿色             |
  | .striped         | 应用到table上，奇偶行底色不同       | .teal    | 青色             |
  | .hover           | 应用到table上，鼠标放上去变化背景色 | .blue    | 蓝色             |
  | .font-normalsize | font-size: 100%                     | .purple  | 紫色             |
  | .font-larger1    | font-size: 110%                     | .pink    | 粉色             |
  | .font-larger2    | font-size: 120%                     | .red     | 红色             |
  | .font-larger3    | font-size: 130%                     | .orange  | 橙色             |
  | .font-larger4    | font-size: 150%                     | .yellow  | 黄色             |
  | .font-larger5    | font-size: 200%                     | .grey    | 浅灰色           |
  | .font-smaller1   | font-size: 90%                      |          |                  |
  | .font-smaller2   | font-size: 80%                      |          |                  |
  | .font-smaller3   | font-size: 70%                      |          |                  |
  | .font-smaller4   | font-size: 60%                      |          |                  |
  | .font-smaller5   | font-size: 50%                      |          |                  |
  | .more-text       | 容纳更多内容。用于#impress或.step   |          |                  |
  | .visible         | visibility: visible;                |          |                  |
  | .hidden          | visibility: hidden;                 |          | 隐藏元素，只占位 |


### normalize.css

* https://github.com/necolas/normalize.css
* 保证各浏览器都有一个相似的样式基础
* 与``reset.css``不同，``normalize.css``只统一不同浏览器的区别，并不清除所有元素的样式

### fonts.css

* 基于 https://github.com/zenozeng/fonts.css 中选择的中文字体
* 加入了对 impress.js<sup>*</sup> 部分元素的字体支持
* 加入几个字体类
  | 类名            | 作用     | 类名            | 作用     |
  |-----------------|----------|-----------------|----------|
  | .font-hei       | 黑体     | .font-body      | 正文字体 |
  | .font-kai       | 楷体     | .font-title     | 标题字体 |
  | .font-song      | 宋体     | .font-quote     | 引用字体 |
  | .font-fang-song | 仿宋     | .font-code      | 代码字体 |

### typo.css

* https://typo.sofi.sh/
* 中文网页重设与排版

### tachyons.css

* http://tachyons.io
* 功能更为完善的功能性样式表

| 类名                                                      | 作用                                                         |
|-----------------------------------------------------------|--------------------------------------------------------------|
| .ba/.bt/.br/.bb/.bl/.bn                                   | 指定方向设置边框，border: all/top/right/bottom/left/none     |
| .b--red/.b--blue ...                                      | 边框颜色，.b--white和.b--black后面可以-90~-10/05/025/0.125   |
| .b--transparent/.b--inherit/.b--initial/.b--unset         | 特殊边框颜色                                                 |
| .b--dotted/.b--dashed/.b--solid/.b--none                  | 边框样式，border-style: dotted/dashed/solid/none             |
| .bw0/.bw1 ~ .bw5                                          | 边框宽度，border-width: 0/.125/.25/.5/1/2 rem                |
| .bt-0/.br-0/.bb-0/.bl-0                                   | 上/右/下/左方边框宽度为0                                     |
| .w1/.w2/.w3/.w4/.w5                                       | width: 1/2/4/8/16rem                                         |
| .w-10,.w-20 ~ .w-100                                      | width: 10%/20%...100%                                        |
| .w-25/.w-33/.w-34/.w-75                                   | width: 25%/33%/34%/75%                                       |
| .w-third/.w-two-thirds/.w-auto                            | width: 33.33333%/66.66667%/auto                              |
| .mw-100/.mw1 ~ .mw9/.mw-none                              | 最大宽度，max-width: 100%/1rem/2rem/4rem...96rem/none        |
| .measure/.measure-narrow/.measure-wide                    | max-width: 30/34/20em。每行约 66/45/80 个字符                |
| .h-auto/h-inherit                                         | height: auto/inherit                                         |
| .h1/.h2/.h3/.h4/.h5                                       | height: 1/2/4/8/16rem                                        |
| .h-25/.h-50/.h-75/.h-100                                  | height: 25%/50%/75%/100%                                     |
| .vh-25/.vh-50/.vh-75/.vh-100                              | height: 25vh/50vh/75vh/100vh                                 |
| .min-h-100/min-vh-100                                     | min-height: 100%/100vh                                       |
| .dn/.di/.db/.dt/.dib/.dit                                 | display: none/inline/block/table/inline-block/inline-table   |
| .pa0 ~ .pa7                                               | paddings，0/.25/.5/1/2/4/8/16rem。ph/pv/pl/pr/pt/pb指定方向  |
| .ma0 ~ .ma7                                               | margins，0/.25/.5/1/2/4/8/16rem。mh/mv/ml/mr/mt/mb指定方向   |
| .center/.ml-auto/.mr-auto                                 | margin-left: auto; margin-right: auto;                       |
| .f-headline/.f-subheadline/.f1 ~ .f5 ~ .f7                | font-size: 6rem/5rem/3rem ~ 1rem ~ 0.75rem                   |
| .i/.fs-normal                                             | font-style: italic/normal                                    |
| .indent/.small-caps/.truncate                             | 首行缩进/全大写/截断溢出文字                                 |
| .tl/.tr/.tc/.tj                                           | **水平对齐**，text-align: left/right/center/justify          |
| .v-base/.v-top/.v-mid/.v-btm                              | vertical-align: baseline/top/middle/bottom                   |
| .lh-copy/.lh-title/.lh-solid                              | 行高，分别用于普通正文、标题行单行文本，提供1.5/1.25/1的行高 |
| .o-0/.o-025/.o-05/.o-10/.o-20 ~ /.o-100                   | 不透光率，opacity: 0/.025/.05/.1/.2 ~ 1                      |
| .cf/.cl/.cr/.cb/.cn                                       | clear，clearfix/clear: left/right/both/none                  |
| .fl/.fr/.fn                                               | 浮动，float: left/right/none，**父节点应设置.cf**            |
| .flex/.inline-flex                                        | flex容器，display: flex/inline-flex                          |
| .flex-column/.flex-row/.flex-wrap/.flex-nowrap            | flex容器，设定主轴方向                                       |
| .flex-wrap-reverse/.flex-column-reverse/.flex-row-reverse | flex容器，设定主轴方向                                       |
| .justify-start/-end/-center/-between/-around/             | flex容器主轴上的对齐方式，justify-content                    |
| .items-start/-end/-center/-baseline/-stretch              | flex容器交叉轴方向对齐方式，align-items                      |
| .content-start/-end/-center/-between/-around/-stretch     | flex容器多个主轴行之间的分布方式，align-content              |
| .self-start/-end/-center/-baseline/-stretch               | flex元素覆盖容器的align-items设定。align-self                |
| .order-0/.order-1 ~ .order-8/.order-last                  | flex元素顺序，order: 0/1 ~ /99999                            |
| .flex-auto/.flex-none                                     | flex元素属性，flex: 1 1 auto和flex: none                     |
| .list                                                     | 不显示列表标记                                               |
| .absolute/.relative/.static/.fixed                        | position:absolute/relative/static/fixed                      |
