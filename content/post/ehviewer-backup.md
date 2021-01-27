---
title: '备份EHViewer的数据'
date: 2019-07-27 23:08:39
tags: [科技,二次元]
published: true
hideInList: false
feature: https://raw.githubusercontent.com/yuukoamamiya/pic/master/TIM%E5%9B%BE%E7%89%8720190726174630.jpg
description: 木有eh的人生还有什么意义（指元素英雄
---
> 所有这些时刻，终将流逝在时光中  
> 一如眼泪  
> 消失在雨中  

<!-- more -->

因为ehentai将要关站，我决定给我手机上的客户端EHViewer做个备份，至少要把下载好的漫画拷到电脑上来，免得等将来为了给手机腾空间的时候给删了没地方给找回来。

预定的备份计划是分三步走：首先是先复制到电脑上，然后是导入到漫画管理软件，最后打好TAG。

那么首先是第一步，复制到电脑上。

直接插上数据线复制是不可行的。因为传输协议的关系，拷贝起来奇慢无比不说，更难受的是直接在文件管理器里边右键复制的话基本是会直接卡死。

![](https://raw.githubusercontent.com/yuukoamamiya/pic/master/20190727221850.png)

解决方法当然有很多。最优解自然是直接把卡拔下来插读卡器拷，但是我手机只有内置存储，这自然行不通。再比如说先打个包然后用wifi传，一不再是传输一堆零散的小文件，二也换了一种传输协议，自然传地更快。但是我一来手机性能不好，就不折腾再打个包了，二来我手机大部分的空间都拿来存ehv上下来的漫画了，再来个同样内容的压缩包，手机存储是撑不住的。

我最后用的是一个妥协方案中的妥协方案，照样直接插数据线复制，但是为了避免卡死用了第三方软件来拷贝。我用的是GoodSync。

使用起来挺简单的，首先选择同步模式是单向同步，然后选择两个目标的文件夹，一个选择mtp协议的手机根目录下的ehviewer文件夹，另一个就在D盘底下新建一个同名文件夹好了。这个软件会先检查两边文件夹的区别，然后把左边的文件夹给同步到右边去。

![](https://raw.githubusercontent.com/yuukoamamiya/pic/master/Snipaste_2019-07-26_18-21-42.png)

![](https://raw.githubusercontent.com/yuukoamamiya/pic/master/Snipaste_2019-07-26_21-11-19.png)

在图上可以看到一个“错误96”，实际上那个是已经删除掉的本子，被这个软件给扫描了出来，但是复制又复制不出来，就报错……

这会给拷贝的目标文件夹里面留下一堆空文件夹。我在网上搜了一个批处理去直接删掉这堆空文件夹。

```bash
@ECHO OFF
ECHO 搜索...
DIR "%CD%" /AD /B /S | SORT /R /O list.txt
IF EXIST deleted.txt ATTRIB -S -H -A -R deleted.txt & DEL /F /Q deleted.txt >NUL 2>NUL
ECHO 删除...
FOR /F "delims=|" %%i IN ( list.txt ) DO RD "%%i\" >NUL 2>NUL & IF NOT EXIST "%%i\" ECHO %%i\>>deleted.txt
IF EXIST deleted.txt NOTEPAD.EXE deleted.txt
DEL /F /Q list.txt >NUL 2>NUL
ECHO 完成！
```

顺便还导出了list.txt和deleted.txt这么两个列表。

![](https://raw.githubusercontent.com/yuukoamamiya/pic/master/20190727224601.png)

看了一下排在最顶上的就是飛燕老师的本子……他的本子确实我不太对胃口。



然后下一步是导入进漫画管理软件。

我在win上甚至找不到一个逻辑接近ehentai的漫画管理软件，就随便找了一个YAC Reader来用。但是这个软件是不支持读取文件夹下直接是一堆图片这样的漫画的，想让它能读出来，首先要给打个包，压成zip。

![](https://raw.githubusercontent.com/yuukoamamiya/pic/master/Snipaste_2019-07-27_22-49-25.png)

我用的压缩软件是bandizip，上下文菜单里面直接是有添加到单独的压缩包这个选项的。winrar或者7z的话我不清楚有没有，反正就算没有也都是可以用命令行来批量解决的。

![](https://raw.githubusercontent.com/yuukoamamiya/pic/master/Snipaste_2019-07-27_21-01-50.png)

我还另外设置了压缩级别，设置为0-不压缩。因为毕竟我们只是要把漫画给打个包，而不是真的要把文件给压缩起来节约存储空间。

![](https://raw.githubusercontent.com/yuukoamamiya/pic/master/TIM%E5%9B%BE%E7%89%8720190727225444.png)

然后等压缩好就可以把原来的散装漫画给删了。

用YAC Reader新建一个库，目录选择这堆zip漫画所在的目录然后就可以等待导入了。

![](https://raw.githubusercontent.com/yuukoamamiya/pic/master/TIM%E5%9B%BE%E7%89%8720190727230029.png)

![](https://raw.githubusercontent.com/yuukoamamiya/pic/master/Snipaste_2019-07-27_22-07-57.png)

导入完之后就可以手动编辑一下每一本漫画的元信息啊，打一打TAG啊什么的了。我不太清楚这个漫画管理软件能不能打TAG，因为我考虑了一下，我这里有一千多本本子，每个本子都得编辑元数据打TAG的话，这个工程太浩大了……得做到猴年马月去……

![](https://raw.githubusercontent.com/yuukoamamiya/pic/master/20190727231044.png)

这个时候就开始怀念起了ehentai是多好，已经将要消逝这一点是多么可惜。

我有幸在我的有生之年见证了大图书馆是如何步向毁灭的。




补充：

用GoodSync拷贝的文件几乎是漏成了筛子……

我最后还是去用了先压缩然后再走wifi传的法子。

![](https://raw.githubusercontent.com/yuukoamamiya/pic/master/Snipaste_2019-07-28_14-50-26.png)

我用到的传输工具是feem。


8月2日

庆祝熊猫死后七日复活。
