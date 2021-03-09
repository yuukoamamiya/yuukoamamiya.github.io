---
title: '红米k30折腾记'
date: 2020-07-01 22:30:43
tags: [科技]
feature: https://cdn.jsdelivr.net/gh/yuukoamamiya/pic/20200701224625.jpg
description: 我就这么耗费了一整天的时间把miui刷掉之后想方设法再现miui的功能……
slug: redmi-k30
---
突然这么说一句可能有些突兀。MIUI是傻逼。

<!-- more -->

我在打开任何应用都能看见广告的时候发现MIUI是傻逼。我在关广告关了半个钟头还没关完的时候发现MIUI是傻逼。我在发现无法更换默认桌面应用的时候发现MIUI是傻逼。我在安装了冰箱却发现无法冻结系统自带应用商店的时候发现MIUI是傻逼。我在安装了play版的支付宝和火狐却不停被提醒“您安装的是非正版版本”的时候发现MIUI是傻逼。我在v2ray没法正常更新订阅的时候发现MIUI是傻逼。我在受够了MIUI这个傻吊系统想要刷机刷掉时发现解锁还要等7天的时候发现MIUI真的就是一坨彻头彻尾的傻逼。

这一切都像极了那个苏联笑话：嘿老兄，这是谁买了这部手机，是你还是我？

![](https://cdn.jsdelivr.net/gh/yuukoamamiya/pic/20200628194331.png)

那还能咋办。看到这么一个“与人斗其乐无穷的手机”。我一咬牙，一狠心，一跺脚，我就把这手机给……给供着用了一个星期。

![](https://cdn.jsdelivr.net/gh/yuukoamamiya/pic/20200628194604.jpg)

害，都用小米手机了，那必然是个穷鬼。穷鬼是没法砸手机的。而有钱砸手机的阔佬自然也不会花钱买小米的罪受。

等到这一个星期过去，分分钟给你解锁了，系统都给你刷咯。指定没有你的好果汁吃。

刷机的ROM选的是破先生推荐的[crdroid](https://crdroid.net/phoenix)，这是一个基于lineage修改的系统。

![](https://cdn.jsdelivr.net/gh/yuukoamamiya/pic/20200701175522.jpg)

哦管他呢，lineage也好pixel experience也好，什么都好，只要不是miui，什么都好。

## 解锁

正常来说我应该把刷rec放在第一部分。但是我很想把小米这个撒泼打滚就是不想让你解锁的模样给发出来乐一乐。

![](https://cdn.jsdelivr.net/gh/yuukoamamiya/pic/20200701180359.jpg)

![](https://cdn.jsdelivr.net/gh/yuukoamamiya/pic/20200628194338.jpg)

考虑到我用小米以前用的手机不是谷歌就是三星，小米确实是我用过的手机里面体验最屎的同时也是最想让你吃屎并且千方百计阻止你离开屎盆子的手机了，以我贫瘠的脑容量实在是无法想象段位比小米还要高的华为手机用户是如何生存的。

## Recovery

顺着crdroid的发布页面可以直接找到这个机型的[rec](https://sourceforge.net/projects/crdroid/files/phoenix/6.x/recovery/)，现在的rec基本都是twrp了，没什么可说的，好歹都能用触摸屏，挺好。

刷入过程也没什么好说的，用这两句命令线刷就行。有刷机经验的话很快就能搞定。大约比下载ROM的速度快了个114514倍吧。

```
fastboot flash recovery twrp.img
fastboot boot twrp.img
```

~~命令行看起来都比MIUI亲切~~

唯一要注意的是如果一边开模拟器肝手游一边刷机的话ADB会读到两个和电脑连接的安卓设备，所以还是先把模拟器关了吧。

## 刷入系统

主要是下载系统的过程比较慢，我用了bitcomet去下，但是也没比http硬下好多少。

进twrp三清。把rom包拷贝到手机目录。install。搞定。

刷好之后可以在“高级”菜单下直接root系统，root完了会自带magisk。

## GApps

其实就是俗称的谷歌全家桶。可以在https://opengapps.org/下载到。

ARM64和安卓10不必说。variant看着选。

pico和nano是小包。mico和mini则多了一些谷歌自家app。full和stock是完整的全家桶，不同之处在于输入stock之后，谷歌自家的短信应用会替换你系统自带的短信应用，谷歌的电话会替代自带的电话，etc。

当然说是这么说，反正我的那个stock包刷进去了是没替换成……短信电话日历邮箱的APP都有了双份，还害得我特地用冰箱再去冻了一些……

![](https://cdn.jsdelivr.net/gh/yuukoamamiya/pic/20200701190543.jpg)

如图所示，stock这个包是真的很完整，如果用不着什么google pay啊duo啊谷歌地图谷歌新闻之类的玩意还是别刷了，micro和mini里面选着刷就行。具体micro和mini的包里面有什么是可以在网页里看的，比如说这图里的就是micro的。

![](https://cdn.jsdelivr.net/gh/yuukoamamiya/pic/20200701190653.png)

## Magisk

在twrp里面开启了root系统之后就自带的管理器，之后就都是这个应用来帮你管理root权限了。比起他的老前辈supersu而言，magisk有着可以安装插件的黑科技。

~~虽然这么说话很阴间，但是都0202年了，不会还有kingroot吧~~

我先把我打上的模块列在这里。大部分都会在下面的部分提到。

- Advanced Charging Controller (ACC)
- Ice Box System Plugin Module
- Riru (Riru - Core)
- Riru - EdXposed
- Riru - Enhanced mode for Strorage Isolation
- Riru - MiPushFake

## 黑阈

老牌后台管理了。这个作者人品不咋地，软件还是阳间的。

## 冰箱

考虑到各路国产毒瘤APP在后台也不安生。比方说当你启动支付宝的时候这些国产毒瘤们会在后台挨个唤醒，支付宝叫醒淘宝，淘宝叫醒飞猪，飞猪叫醒咸鱼……就这么挨个地叫直到你的内存塞不下位置。

冰箱的意义就在这里，可以把这些国产毒瘤app给暂时禁用，被禁用的应用是无法耍流氓的。

![](https://cdn.jsdelivr.net/gh/yuukoamamiya/pic/20200701192740.jpg)

当然还有个用法是像我上文说的那样要是一不小心刷gapps刷多了可以用冰箱去禁用……不过这个是憨批用法小孩子不要学……

![](https://cdn.jsdelivr.net/gh/yuukoamamiya/pic/20200429164100.jpg)

我前文讲到我装的magisk模块里有一个`Ice Box System Plugin Module`，这个就是给冰箱用的提权插件。就是因为这个提权插件，冰箱被谷歌认为是利用了系统漏洞而被play市场下架。我刚刚装上冰箱的时候就愣住了，play市场上面下不到，从旧手机提取的apk装上去之后也没法恢复play市场的购买……好在我邮箱问了开发者之后开发者送了我一个激活码，不然我真的要吃瘪233

![](https://cdn.jsdelivr.net/gh/yuukoamamiya/pic/20200701192736.jpg)

关于冰箱的使用技巧还有一则。把冰箱设置为默认的辅助应用之后可以长按home键调出冰箱。

不管是小爱同学还是google now我都挺不喜欢的，对着手机话筒说一句“hi google 我要订机票”然后看着那些智能AI助手告诉你说你现在的网络不行是真滴脑瘫

## 存储重定向

这是一个谷歌本拟在安卓10里面就加入的功能，现在咕到安卓11去了，意在规范安卓app的文件存储。所有应用，保存的图片就全部存在picture文件夹，保存的文件就全部存在download文件夹，而不是在存储目录下东一坨tencent西一坨qqbrowser到处拉屎。不过考虑到应用开发者干啥啥不行拖字第一名，最后谷歌的要求是2021年的时候上架play市场的app都要支持这个功能。

不过……国内的应用们嘛，哈哈哈哈。

![](https://cdn.jsdelivr.net/gh/yuukoamamiya/pic/20200429164906.jpg)

存储重定向就是这点好，装了之后存储目录干净锃亮，除了picture啊download啊几个文件夹之外，什么tencent之类的屎是不存在的。在装他之前，你时不时就想打开垃圾清理软件看看今天又是哪个傻卵APP给我生产了一堆垃圾（我以前爱用Dir）；在装了之后，你时不时就想打开文件管理器看看今天又是哪个傻卵APP又在存储目录给老子拉了屎。

![](https://cdn.jsdelivr.net/gh/yuukoamamiya/pic/20200701202002.jpg)

需要magisk模块`Riru - Enhanced mode for Strorage Isolation`。

## App Ops

黑格尔说“历史是自由观念的发展”，这话自然被马克思疯狂黑屁。不过用在安卓应用生态上总体还是比较靠谱的。不过考虑到安卓软件的流氓厂商比你更自由也更发展，所以说安卓应用的历史是流氓软件的发展倒是也不为过。

在古早的安卓版本里，用户无法控制哪些权限可以被厂商获得哪些不能，于是厂商一脚油门，不管这个权限需不需要，我先要了再说；在安卓6.0开始，用户可以选择自己的权限给或者不给厂商，于是厂商说你可以不给，那我也可以把应用不给你用。

![](https://cdn.jsdelivr.net/gh/yuukoamamiya/pic/20200429164034.jpg)

所以说从直接拿到变成了先预告了再拿，这种变化无疑就是一种自由观念的发展啊！

App Ops的意义在于如果厂商耍这种流氓，那咱们可以虚与委蛇一翻，假装给了，实际上给个空的权限，任你读剪切板读飞起来也读不到我刚刚复制的车牌号。

![](https://cdn.jsdelivr.net/gh/yuukoamamiya/pic/20200701212431.jpg)

当然，据说某个国产安卓UI内置了这个功能，然后有一些软件厂商进化到了第三形态：给我看看你的权限正常不正常。

要是你给了个假权限，软件会无法启动。

![](https://cdn.jsdelivr.net/gh/yuukoamamiya/pic/20200429164034.jpg)

这就是技术力吗，中国安卓，崛起。

## 通知滤盒

没什么奇技淫巧，就是天天被推送垃圾信息有点烦，用这个屏蔽一部分。屏蔽规则我还在慢慢摸索。

## Mi Push Service Framework

用xp框架和magisk模块伪装成miui之后搭了小米推送的顺风车（便乘），这样子就可以很放心的把应用的后台杀了还不用担心收不到推送了。甚至可以和冰箱打配合，被冰箱禁用的app也能收到推送。

~~要不是国内不能用fcm我干嘛要倒腾这个~~

当然，用了这个之后感觉最大的问题就是……我留着这些傻逼软件的推送干什么，让他们特意推送点垃圾信息给我，我再刻意用另一个软件去屏蔽吗，这也太傻逼了吧。

## EdXposed

Xposed框架在古早的安卓4.x占据了玩机界的半壁江山。不过现在提当年也没什么意义，当年的酷安还是玩机界的北极星呢哈哈哈哈。

至于现在，现在的xp整个生态都不行了，我也就顺手装了几个。与其说是挖空心思去折腾……倒不如说是和老朋友的久别重逢。

说实话这些xp模块竟然在安卓10上还能用这一点就挺令我惊讶的。

- 去你大爷的内置浏览器
- 验证码提取器
- NekoSMS

## AccA

magisk的模块里面有个`Advanced Charging Controller (ACC)`，用了这个模块，你就可以更加高效地把电池供起来，实现电池崇拜的大飞跃，一脚油门从把手机电池当爷爷进化到手机电池当祖宗……

不过这个模块是没有图形界面的，要实现控制手机到60开始充电到80停止充电得去修改配置文件。于是开发者又写了个方便修改配置的GUI出来。

![](https://cdn.jsdelivr.net/gh/yuukoamamiya/pic/20200701220503.jpg)

这样子我就可以更加优雅的把手机电池当祖宗了。谢谢你，开发者。

## F-Droid

要是早几年，我会和人说酷安是一个乌烟瘴气的地方。但是今天的话就算了。酷安是个什么臭弟弟，他也配乌烟瘴气？

现在的酷安充其量算是个乌烟瘴气的余烬，没有乌没有烟没有瘴也没有气，什么都没有，什么都是虚无的，只不过是昔日酷安的倒影罢了。

现在的话，play菜市场自不必说，F-Droid也是个好去处。有大家都爱的telegram，有我上文提到的AccA，有油管最新最in的第三方NewPipe，有看漫画的tachiyomi。

![](https://cdn.jsdelivr.net/gh/yuukoamamiya/pic/20200701222911.jpg)

总之，都是好东西啊。大概秒了酷安114514个手机乐园吧。

## 结语

安卓是自由的系统。自由是安卓最锋利的矛，也是安卓最脆弱的脚后跟。

我给这台红米刷完机的那一晚上折腾到了半夜，然后蒙头便睡，一觉睡到了第二天中午。

醒来之后我就在问自己这么一个问题：

这一切值得吗？

~~别吐槽题图的k20，我没找到k30的图~~
