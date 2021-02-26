---
title: 记一次搬迁博客
date: 2019-05-08 20:20:52
tags: [科技]
published: true
hideInList: false
feature: 
description: gridea，萌新滴神
---
我的博客本来是搭在blogger上面的，就是域名中间是blogspot的那个。那个博客的提供商是谷歌。一方面我是谷粉，这谷歌爸爸的东西，就算是再沙雕这臭脚也是得去捧的（谷歌：说的好，安卓10加入高斯模糊）；另一方面，也是因为看编程随想的博客分享他的经历，说他的博客几次受到黑客的攻击，都是谷歌爸爸给拦下来的，谷歌爸爸果然还是靠谱。

但是谷歌爸爸虽然好，但是毕竟拦在墙外。为之奈何，为之奈何。没办法，搬呗。

 <!-- more -->

> 在中国，任何超脱飞扬的思想都会砰然坠地的，现实的引力太沉重了。

搬回来选择也很多，比如说我以前用的[hexo](https://hexo.io/zh-cn/index.html)，再比如说谷歌搜索“github博客”出来的第一个结果[jekyll](http://jekyll.com.cn/)都是可以的。不过我就不太想用这两个东西。一则我比较不喜欢用命令行。二则我也不会手写css修改html。总的来说我是一个技术废物，能用那种博客提供商就绝对不会自己折腾，能一键设置就绝对不会用notepad打开config.ini的那种。当然直接说因为我是个技术废物太难听了，毕竟说这话的时候大抵脑子里出现的是被抓着游街剃个阴阳头手里举个牌子写着“我是技术废物”，怎么也不会联想到“我们是妖精的尾巴”头上去23333所以我们还是得换个说法，技术废物不能叫技术废物，这得叫做专注于内容生产。

## Gridea

于是最后想到之前[小众软件](https://www.appinn.com/hve-notes/)介绍过的[Gridea](https://gridea.dev/)，算是一个挺傻瓜式的生成静态博客的工具。稍微设置一下就可以把生成的静态博客给托管在github pages上面。算是省了“先安装node.js，再用npm命令安装hexo，最后再改七改八才能用”所需要费的功夫了（我想起来我以前踩的坑还觉得怨念啊）。

![](https://raw.githubusercontent.com/yuukoamamiya/pic/master/20190508192213.png)

不过毕竟是傻瓜式的工具，可以选择的主题并不多。即使嫌难看，你叫我自己手改那我也不会，要是不满意那就只能凑合着用用了，虽然我感觉其实也还挺满意的。毕竟之前用blogspot那么难看的主题也都用下来了不是吗2333

搬运博文的另一个难题是图片。

## Picgo

blogspot的编辑器不是markdown编辑器，而是富文本编辑器，图床是人家自带的。我以前就是本地拿typora写好文章之后，复制到blogspot的编辑器里面用markdownhere这个谷歌扩展给转换成富文本，然后本地写的时候是不加图片的，图片等到文章已经在编辑器里面排版好了再上传。这也就产生了另一个问题，我现在要把文章搬运走，然而我本地存着的md文件全部是不带图片也不带图床连接的……

![](https://raw.githubusercontent.com/yuukoamamiya/pic/master/20190508194008.png)

没办法，图片就只能慢慢搬了。从[少数派](https://sspai.com/post/42310)上面看来一个叫[Picgo](https://molunerfinn.com/PicGo/)的图床上传工具，这个工具可以一键上传图片到图床并且复制markdown格式。省了我不少麻烦。

考虑到反正都恶意利用github了，索性捋巨硬羊毛就一捋到底，把图床也丢在github上。这样子我的博客就从内容到评论再到配图完全基于github了。

不过因为我这边连接github实在是够呛，速度不快不说还时断时续……这就是影响我搬运博文的最大掣肘。

## Paste to Markdown

<https://euangoddard.github.io/clipboard2markdown/>

也是之前在[少数派](https://sspai.com/post/54103)上边看来的。

因为原本有相当一部分的博文我没有留md文件在硬盘上，比如说有些是用手机写的，电脑上就自然不会有记录，有些则是写的太早了已经删掉了。总之这个时候就是靠这个工具出马的时候了。直接复制富文本进[网页](https://euangoddard.github.io/clipboard2markdown/)ctrl+V就成，直接就是markdown格式了。

![](https://raw.githubusercontent.com/yuukoamamiya/pic/master/20190508195404.png)

基本就是有存md的直接复制进gridea的编辑器里面去，没有存md的先用paste to markdown转化再复制进去就ok。我进化到最后简直成为了流水线操作员，三秒钟能搬运一篇博文过来2333。最难的地方还是在于传图片到github的时候一个图要传个五到十秒种……

用我老家的方言讲真是眼珠子都等白了。

## Gitalk

我之前用的评论系统是disqus。反正博客都搭在墙外边，索性连评论系统也用个洋玩意，就当作是为了洋气也好。

gridea支持的评论系统有两套，一个是disqusjs，另一套就是我现在用的gitalk。说实话我本来是想要接着用disqus的，结果问题来了……我他妈连不上disqus的api……每次打开渲染好的网页就只能看博文底下评论区在那里不停打转显示“载入中”，载入载个三五分钟还会很温馨的提示你要不要重新载入。可以说是“不是在载入就是在通往载入的路上”了……

没办法，那就换gitalk吧。gitalk评论是基于github的issue功能实现的。全家都是微软，也好。

![](https://raw.githubusercontent.com/yuukoamamiya/pic/master/20190508195554.png)

不过也还有一个问题，我不知道是这个issue功能带bug，还是撞上人家的审核机制了，总之就是有两篇文章的issue一直创建不出来，一篇是[黑win10的](https://yuukoamamiya.github.io/p/reason-to-use-win10/)，另一篇是讲lgbt的，不过已经删掉了，没有就没有吧，凑合着用。

## まだ足りない部分

毕竟也没花太多的功夫用傻瓜式的工具搭起来的，总归是有不少不满意的地方。~~比如说上文的评论就是一例~~

比如说没有RSS，再比如说没法用IFTTT设置转发。

![](https://raw.githubusercontent.com/yuukoamamiya/pic/master/20190508201205.png)

不过IFTTT也就每次更新博客之后转发到推特比较方便，微博还是三天两头出问题。你阿浪还是傻吊。

![](https://raw.githubusercontent.com/yuukoamamiya/pic/master/20190508201356.png)

转发博文到微博就只能手动转发，我倒是找了个[chrome扩展](https://chrome.google.com/webstore/detail/%E4%B8%80%E9%94%AE%E5%BE%AE%E5%8D%9A/dlnibcgilcbfohdalmandfokomeljkfc)让这个转发过程来得更轻松一些。不过反正都得手动了，这个倒是和原来的blogspot也差不多。
