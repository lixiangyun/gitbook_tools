# gitbook 本地化工具

## 使用举例

克隆一个符合gitbook规范的markdown文档仓库

```
git clone https://github.com/lixiangyun/Disruptor_doc_ZH_CN.git
```

### 生成html

```
docker run -it --rm \
         -v $PWD/Disruptor_doc_ZH_CN:/srv/gitbook \
         linimbus/gitbook_tools \
         /bin/bash -c "gitbook build"
```

**注意：如果涉及gitbook插件，需要增加`gitbook install`**

在_book下面查看index.html或者通过ngix启动http服务查看；

```
docker run -v $PWD/Disruptor_doc_ZH_CN/_book:/usr/share/nginx/html -d -p 8080:80 nginx
```

通过浏览器访问(http://your_ip:8080/)

### gitbook插件安装

```
docker run -it --rm --net=host \
         -e http_proxy=http://127.0.0.1:808 \
         -e https_proxy=http://127.0.0.1:808 \
         -v $PWD/Disruptor_doc_ZH_CN:/srv/gitbook \
         linimbus/gitbook_tools \
         /bin/bash -c "gitbook install;gitbook build"
```

**注意：因为gitbook install需要从外部下载，所以某些情况下需要设置代理，如`-e http_proxy=http://127.0.0.1:808`**

### 生成PDF

```
docker run -it --rm \
         -v $PWD/Disruptor_doc_ZH_CN:/srv/gitbook \
         linimbus/gitbook_tools \
         /bin/bash -c "gitbook pdf"
```

在当前目录下生成的book.pdf

**注意：其他格式epub、mobi，如`gitbook epub`或者`gitbook mobi`**
