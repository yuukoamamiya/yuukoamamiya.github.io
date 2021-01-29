---
title: '从Gridea迁移到Hugo'
date: 2021-01-28 16:52:00+0800
tags: [科技]
feature: 
description: 持续集成，牛逼
---

我之前写了[一篇博文](https://yuukoamamiya.github.io/p/%E8%AE%B0%E4%B8%80%E6%AC%A1%E6%90%AC%E8%BF%81%E5%8D%9A%E5%AE%A2/)来讲述我从 blogspot 转移到现在用的 github page ，那个时候用的生成工具是 Gridea ，我现在还觉得那玩意不错，什么都是傻瓜式的，也就第一次设置的时候要跟着教程来，麻烦点，设置好之后就可以看着GUI的脸色行事了。

只不过后来是越用越觉得 Gridea 有各种各样的问题。我最讨厌的毒瘤框架自不必说，写了篇文章要生成个半天再同步个半天，还经常同步个半天没能 push 上去，就相当痛苦。正好这个时候有了 Github Actions ，如果是自建博客的话传个markdown文件就行，剩下的都是云端自动了，也犯不着在本地先执行什么 `hexo -d` 再执行一下 `git` ，最早制约我去自己折腾 hexo 一类工具的制约已经消失了。

## 安装Hugo

我得说我选择 Hugo 没有什么特别的理由，纯粹就是单纯图个装起来省事。我之前装好了包管理器 Chocolatey ，再装 Hugo 就一行命令的事情，而且装好了直接就已经是环境变量了，可以直接在命令行里执行 `hugo` 命令，很方便。

要紧的命令就这么两行：

安装 Chocolatey （需要管理员权限 powershell）：

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
```

安装 Hugo

```powershell
choco install hugo-extended
```

这两个装上就够了，当然，要是像我这样没GUI就浑身难受的，那还可以再装个 Chocolatey GUI：

```powershell
choco install chocolateygui
```

装到这里就算是该装的软件都装过一遍了，那之后就是做博客了。

## 创建博客

Hugo 里面新建工程的命令是

```powershell
hugo new site my_blog
```

在任意目录下运行，就可以看到生成了一个名为 `my_blog` 的文件夹，这个文件夹里面自带了一些博客最基本的内容。Hugo 是不自带默认主题的，需要去下一个来。

我下的是 [Stack](https://github.com/CaiJimmy/hugo-theme-stack) 主题，自带一个[中文文档](https://docs.stack.jimmycai.com/v/zh-cn/)，一步一步照着文档来就行。下载最新 [Release](https://github.com/CaiJimmy/hugo-theme-stack/releases) 之后下，把 `hugo-theme-stack-master` 改名为 `hugo-theme-stack` 并放到站点目录的 `theme` 文件夹下。

我这是个全新的博客，就如文档所言，把 `exampleSite` 文件夹中的 `assets` 和 `config.yaml` 给复制到博客根目录下；博客根目录下原本有个 `config.toml` ，理论上可以对着这两个文件依样画葫芦自己写配置文件，但是还是算了，嫌麻烦，直接给删了得了。

不过网上能找到的一些修改功能的教程几乎都是基于 toml 的，有时候把格式改成 yaml 修修改改还能用，有时候就用不了，凑合凑合得了，也不用太讲究。

以下设置过程中，全程时不时打开 `hugo server` 看看对劲不对劲……

## 配置主题

`config.yaml` 这个文件几乎是开箱即用的，但还是不少地方需要自己再设置过。

```yaml
params:
    mainSections:
        - post
    featuredImageField: feature
    rssFullContent: false
    favicon: https://cdn.jsdelivr.net/gh/yuukoamamiya/pic/20210127185955.ico
```

`featuredImageField` 决定的是特色图片（题图）使用的字段。默认是 image ，我这里修改成了 feature ，因为从 Gridea 的 post 文件夹里拿出来的文件就是这样的。当然也可以批量修改，用 sublime text 就可以把整个文件夹里的 feature 字段全部改成 image ，不过我偷懒了一手，而且这么改目前看下来也没出啥毛病。能用就成。

`rssFullContent` 决定的是 rss 是否输出全文。 `favicon` 决定了网站的图标，看着改就行。

```yaml
sidebar:
        emoji: 🎷
        subtitle: 让无价值的灵魂去哭泣吧！
        avatar:
            local: true
            src: img/avatar.png
```

一些个性化博客的设置。把博主头像放在根目录下的 `assets/img` 里就成。

```yaml
menu:
        - identifier: link
          name: Link
          url: link
          weight: -50
          pre: link

        - identifier: rss
          name: Rss
          url: index.xml
          weight: -40
          pre: rss
```

个性化菜单。

原本的左侧菜单只有主页、关于、存档、搜索，这四个选项。我给加了友链和 rss 订阅这两个。

当然这个时候菜单里面的东西都是不能用的，还需要再配置过。

老样子还是从作者给的示范里面偷活，把 `exampleSite/content/page` 整个文件夹拷到根目录的 `content` 文件夹底下，搜索和存档是直接可以用了。`about.md` 这个文件还得依样画葫芦自己写点东西上去（我之前甚至想不到写什么去别人博客里偷活233）， `link.md` 也是一律。大佬们自然有办法手写点代码让友情链接的页面好看点，我是个粗人，拿 md 随手写写差不多了。rss 直接可以用了，不需要再创建了。

不过这里有个问题是，生成的 rss 订阅地址是 `index.xml` 而不是以前的 `atom.xml` ，这就意味着以前的 rss 订阅地址就失效了。我也没什么好办法去解决。

```yaml
# Change it to your Disqus shortname before using
disqusShortname: yukoamamiya
```

```yaml
    comments:
        enabled: true
        provider: disqus
```

评论系统设置 disqus 省事，就直接用了。 `disqusShortname` 这个属性设置一下就行。

这个主题支持 disqus 和 utterances 两套评论系统，后者是基于 github issue 的，要是我之前 gitalk 的数据还在我就用后者了。不过换成 Hugo 之后链接地址全变了，原先的 issue 也就对应不上了，算了算了，全扬了得了233

```yaml
permalinks:
    post: /p/:filename/
    page: /:slug/
```

这行代码决定的是生成的博文页面的 url 。

Gridea 的逻辑是取文件名做链接，比如说 `aigis.md` 这个文件最后生成的链接是 `xxx.github.io/post/aigis` ，而 Hugo 的逻辑，至少按照这个主题原来的设置 `post: /p/:slug/`来说是读文件的内容。如果有在 Front Matter 里面设置 `slug` 字段的话，那就读取这个字段并生成地址，没有的话就读 `title` ，那我从 Gridea 刚刚转过来的，哪里会设置这个字段嘛，结果就是前面的 `aigis.md` 生成的链接成了 `xxx.github.io/p/千年战争` 。

我把这段里面的 `slug` 改成了 `filename` 这个逻辑就和 Gridea 的对上了。当然，还有 p 和 post 的区别，不过这个我不打算改了。就那么几篇特定的博文用 `aliases` 设置一下别名就成了。比如这样：

```yaml
aliases:
    - /post/order-44/
```



![](https://cdn.jsdelivr.net/gh/yuukoamamiya/pic/20200429164034.jpg)

反正 SEO 乱了也没什么，会点进来看的也就爱看个什么 TNO 魔怔 Order-44 啊，怒喷 MIUI 啊之类的，也就那么几篇，就连点进来看我睿评太宰治的都没几个。

[修改字体](https://docs.stack.jimmycai.com/v/zh-cn/modify-theme/example-custom-font-family-for-article-content)

修改字体我几乎是从文档里面一字不落直接照搬了。不过我自己也确认不了思源宋体的效果，我这边直接本地强制把字体显示成 Ubuntu 了……

[给分类 / 标签添加图片和简介](https://docs.stack.jimmycai.com/v/zh-cn/writing/gei-fen-lei-biao-qian-tian-jia-tu-pian-he-jian-jie)

同样是照着文档来就行。在 `content/tags/标签名` 下创建 `_index.md`，然后写点迫真二次元内容。

比如：

```yaml
---
title: "科技"
feature: https://cdn.jsdelivr.net/gh/yuukoamamiya/pic/20210128122034.jpg
description: "你的XP系统有点问题，我已经帮你重装好了"
---
```

显示效果是这样的：

![](https://cdn.jsdelivr.net/gh/yuukoamamiya/pic/20210128201948.png)

## 迁移博文

Gridea 的博文存放在其数据文件夹的 `\posts` 子目录下，直接把里面的那堆博文复制到 `\content\post` 下就能用。

两者的 Front Matter 还是有些区别的，比如说 Hugo 的 `hidden: = flase` 对应的是 Gridea 的 `hideInList: false` ，不过总体而言差别不大。而且也可以用 sublime text 批量改整个文件夹。

一个比较明显的区别在文章简介，在这个主题里面基本就是副标题。Hugo 的文章简介是用 `description` 词条写的，而 Gridea 的则是靠 `<!-- more -->` 打标记。这个没啥批量改的法子，也许可以写脚本硬改，但是我这里文章虽然多，有副标题的也不怎么多，就硬改得了。

![](https://cdn.jsdelivr.net/gh/yuukoamamiya/pic/20210128203433.png)

我觉得最炫的是这个hhhhh

~~不过这篇博文是大一时候写的了，现在我看我也流泪啊~~

还有一个重大的问题是时间。

Gridea 里面的时间格式是 `2021-01-28 16:52:00` ，而 Hugo 的则是 `2021-01-28 16:52:00+0800` ，两者几乎完全一样，就是 Hugo 的加上了时区信息。

老的博文不写时区也无所谓，但是新的博文在写的时候一定要加上时区信息。如果不写的话，Hugo 会认为这是一篇发布时间在未来的博文而不给渲染……

## Google Search Console

![](https://cdn.jsdelivr.net/gh/yuukoamamiya/pic/20210128205719.png)

如果是第一次向谷歌提交站点的话，这一步还是放在后面，等 Github Actions 设置好了再弄吧。我这里因为以前就设置过，现在重新提交一下站点地图就成。

![](https://cdn.jsdelivr.net/gh/yuukoamamiya/pic/20210128210146.png)

站点地图的提交需要时间……估计现在在谷歌上搜 TNO 搜来我博客的，摁一下还是会看404……

## Google Analytics

主题作者在文档里面也[提了一嘴](https://docs.stack.jimmycai.com/v/zh-cn/modify-theme)怎么设置，不过我还是跟着[这个教程](https://coreychen71.github.io/posts/2019-05/hugoaddgoogleanalytics/)走的。

![](https://cdn.jsdelivr.net/gh/yuukoamamiya/pic/20210128211634.png)

没申请过 Google Analytics 服务的可以来 [https://analytics.google.com/analytics/web/?authuser=0#provision/SignUp/](https://analytics.google.com/analytics/web/?authuser=0#provision/SignUp/) 先申请一个，我这边是已经申请好了，就差把代码嵌到博客里面去了。

首先把跟踪 id 加到 `config.yaml` 里面去。上面发的那个教程里用的是 toml ，和 yaml 的格式略有不同。

```yaml
googleAnalytics: UA-xxxxxxxxx-x
```

然后是把 `\themes\hugo-theme-stack\layouts\partials\head\head.html` 复制到根目录下的 `\layouts\partials\head\head.html` 里去。

在这个文件里加上四行：

```html
{{ template "_internal/google_analytics_async.html" . }}
{{ if not .Site.IsServer }}
{{ template "_internal/google_analytics_async.html" . }}
{{ end }}
```

在 `\layouts` 目录下建立 `_internal` 文件夹，并且再在其中创建 `google_analytics_async.html ` 文件，然后把我前面截图里面的全局网站代码（gtag.js）复制进去就成。

## 设置Github Actions

首先是要准备 `<你的github用户名>.github.io` 仓库，有一个 master 分支和一个 gh-pages 分支。

然后把刚刚弄出来的那堆博客文件整个目录传到这个仓库的 master 分支上去——这个时候比较标准的解法是 `git push` ，不过我能不用命令行肯定不用命令行的233

我在这一步用的是 [Github Desktop](https://desktop.github.com/) 应用（没错，我甚至连 git 都没装）。

这里要注意的是需要设置排除，根目录下创建一个文本文档并重命名为 `.gitignore` ，写入以下内容：

```
/public/
/themes/*/.git
```

然后是申请 token，在 github 上依次点击 右上角你的头像 - Settings - Developer Settings - Personal access tokens，生成一个。

![](https://cdn.jsdelivr.net/gh/yuukoamamiya/pic/20210128220717.png)

（我这里之前 Gridea 本来就要用的，直接用了之前那个）

要注意的是这个 token 只会在这个时候给你看一次，丢了就是丢了，以后就再也不会再出现了。我推荐把这个给存到密码管理软件里面去，用 lastpass 之类的软件给管理起来。

![](https://cdn.jsdelivr.net/gh/yuukoamamiya/pic/20210128223012.png)

回到 `<你的github用户名>.github.io` 仓库，依次选择 Settings - Secret ，添加一个仓库密钥名为 `personal_token` ，内容是刚刚的 token 复制进去。

![](https://cdn.jsdelivr.net/gh/yuukoamamiya/pic/20210128223513.png)

回到仓库，依次点击 Actions - New wordflow - Set up a workflow yourself，然后把这堆我也是抄来的一大坨代码复制进去就好了。

```yml
name: Deploy Hugo # 任君喜欢

on:
  push:
    branches:
      - master   # master 更新触发

jobs:
  build-deploy:
    runs-on: ubuntu-18.04
    steps:
      - uses: actions/checkout@v1

      - name: Setup Hugo
        uses: peaceiris/actions-hugo@v2
        with:
          hugo-version: latest

      - name: Build 
        run: hugo

      - name: Deploy
        uses: peaceiris/actions-gh-pages@v3
        with:
          personal_token: ${{ secrets.personal_token }} # personal_token
          PUBLISH_BRANCH: gh-pages  # 推送到当前 gh-pages 分支
          PUBLISH_DIR: ./public  # hugo 生成到 public 作为跟目录
          commit_message: ${{ github.event.head_commit.message }}
```

## 施工完毕

事情到这一步，就算是施工完毕了。你可以在 master 分支随便进行一些改动来使得 Action 生效。我刚弄好的时候传了一个表情包上去然后删掉了（

![](https://cdn.jsdelivr.net/gh/yuukoamamiya/pic/20210128231609.jpg)

之后再更新新的文章就直接把 .md 文件上传到 `\content\post` 目录下就成，用网页传用命令行传用桌面应用传都没问题。改动之后会自动生成自动生效。已经难说和 Gridea 哪个方便哪个麻烦了。可能配置过程中还是 Gridea 更加傻瓜式一些，但是配置好之后还是这么整比较省事。

就是手写 Front Matter 还有点麻烦，这个我还得再琢磨琢磨。比如说可以设置 Front Matter 的默认格式，再比如说可以用那种自定义短语的软件来辅助之类的，都还可以进一步研究。



