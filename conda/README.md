# Anaconda #



## TUNA mirror ##

- Reference: [TUNA Mirror](https://mirror.tuna.tsinghua.edu.cn/help/anaconda/)

Run the following after install conda:

```bash
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free/
conda config --set show_channel_urls yes
```


## Guide ##

- create an environment: `conda create --name python36 python=3.6`

- list an environment: `conda info --envs`

- list an environment package: `conda list -n python36`

- install package to the sepecial environment: `conda install -n python36 numpy`

- active & deactive the environment:
    > #
    > # To activate this environment, use:
    > # > source activate python36
    > #
    > # To deactivate this environment, use:
    > # > source deactivate python36
    > #

- remove the environment: `conda remove -n python36 --all`
- remove the package in the environment: `conda remove -n python36 numpy`

- update: `conda update conda` && `conda update anaconda`
