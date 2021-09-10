## 配色方案

* 在``immpressjs/css/src``下放置``SCSS``格式的样式表
* 通过``make``命令把``SCSS``样式表编译为正常的``CSS``文件，并放置到``impressjs/css/themes``下
* 在展示中引入想要的配色方案
  ```html
  <link href="css/themes/blue.css" rel="stylesheet" />
  ```

## 内嵌SVG文件

为了通过``CSS``和``Javascript``操纵``SVG``文件，需要把其内联到HTML文件中。可以通过``inline-svg``插件完成内联。

1. 把``js/``子目录拷贝或者链接到幻灯目录下
2. 正常使用``<img>``包含``SVG``文件，并加上类名``class="svg"``
   ```html
   <img id="logo" class="svg" src="/images/logo.svg" alt="Some awesome company" />
   ```
3. 引入``inline-svg``插件
   * 可以使用缺省参数，``<img>``的类名为``svg``，为``<body>``加上类名``js-inlinesvg``
     ```html
     <script src="js/inlineSVG.min.js"></script>
     <script>inlineSVG.init();</script>
     ```
   * 可以指定要用的类名，还可以指定成功后要执行的函数
     ```html
     <script src="js/inlineSVG.min.js"></script>
     <script>
     inlineSVG.init({
       svgSelector: 'img.svg', // the class attached to all images that should be inlined
       initClass: 'js-inlinesvg', // class added to <html>
     }, function () {
       console.log('All SVGs inlined');
     });
     </script>
     ```
4. ``<img>``上的额外的属性，如``height``、``width``、``data-*``等，将被拷贝到``<svg>``上
5. 可以使用CSS调整SVG的样式
   ```css
   svg:hover path {
     fill: #c00;
   }
   
   // or
   #logo:hover path {
     fill: #c00;
   }
   ```

