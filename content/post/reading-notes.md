---
title: '读书笔记页面'
date: 2020-04-29 16:59:05
tags: [科技]
published: true
hideInList: false
feature: https://i.loli.net/2020/04/29/gqb7RwFB9MGxeQD.jpg
isTop: false
---
最近逛少数派看到一个[帖子](https://sspai.com/post/60024)，这个作者设计了一套系统，自称能够“保卫表达”。考虑到我和他的情况有所不同——一来，我这种后现代互联网嬉皮士只有批话，没有表达。批话不再是表达的外在形式或者是一部分，而是成为了表达本身，所以我要“表达”的时候一定是去s1反串或者是去nga钓鱼，个人微博满足不了我；二来微博有色图可以转，而自己搭一个个人微博则没有，这一点还不如我的[tg频道](https://t.me/doloreshazeanime)——不过虽然我批话说了一大通，他这个系统还是很有意思的，我拿来记录一下自己的读书笔记。你甚至可以在这个[页面](https://yuukoamamiya.github.io/readingnote/)看到我看一本苏童的《妻妾成群》看了一万年没看完的鸽子模样233

<!-- more -->

他这个系统大概就是，用tasker（安卓）快捷指令（ios）等方式快速记录内容，把内容储存在后端 BaaS 平台上面，最后写了一个 html 页面来呈现内容。至于内容是什么，是反串钓鱼引言怪气还是理客中，这反而不重要了。

## 内容的储存：leancloud

别问我后端 BaaS 平台是什么，我也不知道，反正跟着教程走就对了。

![](https://cdn.jsdelivr.net/gh/yuukoamamiya/pic/20200429164100.jpg)

去 [leancloud 国际版](https://leancloud.app/)上注册一个账号并且验证手机与邮箱。那之后创建一个应用。

进入应用后在左上角选择创建 class，class 名称命名为 `content` 。将下方 create 、delete 、update 三项权限设置为“指定用户”，用户名和角色留空就可以了。

![](https://cdn.jsdelivr.net/gh/yuukoamamiya/pic/20200429154114.png)

那之后点击左侧你刚刚添加好的 content ，选择“添加列”。起名为`content` ，类型选择 `string` 。

![](https://cdn.jsdelivr.net/gh/yuukoamamiya/pic/20200429154903.png)

最后添加好了就是我图里的这个效果。不够刚设置好的时候因为并没有储存在里面的内容所以应该是全空的，会随着你不断的说批话而不停的把批话储存起来，最后就像我这样。

![](https://cdn.jsdelivr.net/gh/yuukoamamiya/pic/20200429155130.png)

好了，设置到这里，拿来储存批话的容器就已经设置完毕了。接下来就是在最左边依次点击设置-应用key，然后把这个网页挂在这里，等到接下来要用到的时候再切到这个网页 ctrl + c 就可以了。

![](https://cdn.jsdelivr.net/gh/yuukoamamiya/pic/20200429155529.png)

## 内容的上传：tasker

上传内容，就是调用 leancloud 的接口在 content 表中插入一条数据。如果你会写代码，那随便就秒了。

问题是我不会。

不过好在少数派作者自己提供了几种上传的方式，win 上面可以用 quicker，ios 上也有作者已经配置好的快捷指令可以用。评论区也有人提供了安卓上能用的 [tasker 工程](https://github.com/jimlee2002/nonsense.fun_tasker)和 mac 能用的 [utools 的教程](https://xwlearn.com/howto-graciously-bb-in-mac/)。

那我是个用不起苹果的穷逼，那肯定用 tasker 啊。

首先要确认你的手机开了 root，这个作者不晓得没有root能不能用，因为他没有一台没root的手机帮他测试。真巧，我也没有。

![](https://cdn.jsdelivr.net/gh/yuukoamamiya/pic/20200429164034.jpg)

直接下载 [apk 文件](https://github.com/jimlee2002/nonsense.fun_tasker/releases)并装上后，长按“发送”按钮，来到选项菜单。

![](https://cdn.jsdelivr.net/gh/yuukoamamiya/pic/20200429160631.jpg)

title 可以随便填。AppID 和 MaterKey 就是 leancloud 网页里的那个，复制一下就行了。className 这一项，如果是严格按照教程来的，那应该填 content。

然后你随便写点内容，点下发送，应该就能在 leancloud 里面见到你刚刚输入的批话了。

## 内容的呈现：github pages

要不是因为想白嫖服务器和域名，谁会选择去用github pages呢。反正我的博客都已经在撸 github 羊毛了，也不差这么一个 html 文件的羊毛。想必微软家大业大，也不会在意我的这么一点挖资本主义墙角的行为的。活圣人圣大钞·大门更是早就说过要先让中国人习惯用微软的盗版，更何况我这还不是盗版。

我因为反正不会写 html ，就索性直接从[作者的仓库](https://github.com/daibor/nonsense.fun)里面整个 fork 了过来。如果你的博客没有占用掉 `用户名.github.io` 这个域名的话，可以给仓库命名为这个。我这边毕竟做博客已经用掉了，随便起了个仓库名，到时候用 `用户名.github.io/仓库名` 反正也是一样的。

![](https://cdn.jsdelivr.net/gh/yuukoamamiya/pic/20200429163822.png)

fork 过来的文件里面这些倒是可以随便改。只要你够不要脸，什么古风啊之类的东西往上面整一整，没准还能在豆瓣约到炮。

![](https://cdn.jsdelivr.net/gh/yuukoamamiya/pic/20200429163701.png)

当然重头戏还是这里，需要输入 leancloud 的 appid 和 appkey ，来保证可以读取到你储存的内容。

全部都设置好之后，底下点下commit，这个文件就算是编辑好了。

在 setting 里面选择开启 github pages之后就大功告成了。快来访问这个网址，让大家看看你的批话吧。

![](https://cdn.jsdelivr.net/gh/yuukoamamiya/pic/20200429164502.png)

![](https://cdn.jsdelivr.net/gh/yuukoamamiya/pic/20200429164953.png)

↑效果图大概长这样

作者仓库的自述文件里面还记叙了一些别人做的个人推特，里面不少人自己另外写了 html ，还是比较炫酷的。不过我反正不会写，这也是羡慕不来的事情。

![](https://cdn.jsdelivr.net/gh/yuukoamamiya/pic/20200429164906.jpg)

个人微博搭到这里就算是大功告成了。不过考虑到个人微博既没法钓鱼，也没法对线，这里还是建议您去s1或者nga呢亲。

或者去知乎欣赏一下历史教科书级别的傻逼，不也挺好吗。

![](https://i.loli.net/2020/04/29/ex2NIU9VjHSbyfd.png)

![](https://i.loli.net/2020/04/29/Yhm35tsjNvdBDwn.png)

![](https://i.loli.net/2020/04/29/6sTUQ8NPGCz41wy.png)