Table of Contents
=================

   * [UTILS](#utils)
      * [github-markdown-toc](#github-markdown-toc)

# UTILS

记录平时使用的小工具。



## github-markdown-toc

作用：生成markdown目录结构

安装：

```bash
curl https://raw.githubusercontent.com/ekalinin/github-markdown-toc/master/gh-md-toc -o gh-md-toc
chmod a+x gh-md-toc

```

使用：

> ```bash
> ➥ cat ~/projects/Dockerfile.vim/README.md | ./gh-md-toc -
>   * [Dockerfile.vim](#dockerfilevim)
>   * [Screenshot](#screenshot)
>   * [Installation](#installation)
>         * [OR using Pathogen:](#or-using-pathogen)
>         * [OR using Vundle:](#or-using-vundle)
>   * [License](#license)
> ```
>
>

> ```bash
> ➥ ./gh-md-toc ~/projects/Dockerfile.vim/README.md                                                                                                                                                Вс. марта 22 22:51:46 MSK 2015
> 
> Table of Contents
> =================
> 
>   * [Dockerfile.vim](#dockerfilevim)
>   * [Screenshot](#screenshot)
>   * [Installation](#installation)
>         * [OR using Pathogen:](#or-using-pathogen)
>         * [OR using Vundle:](#or-using-vundle)
>   * [License](#license)
> ```

