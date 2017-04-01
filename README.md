# emacs.d
configuration for emacs

# 基本的开发配置

## 终端内的Emacs

使用一下命令就可以从终端启动emacs指定配置文件
```bash
env HOME=/你自己的配置仓库配置 emacs
```

## GUI版本的Emacs

如果你是从APP里启动的话，你需要如下配置:
1. 找到你的Emacs.App的路径
2. 从该APP路径下的Contents/MacOS,找到可执行的二进制文件`Emacs`
3. 在你的shell初始化文件里加上

```bash
alias emacs='env HOME=/仓库位置/ /位置/Emacs.app/Contents/MacOS/Emacs'
```
