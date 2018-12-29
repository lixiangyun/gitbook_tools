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

在_book下面查看index.html或者通过ngix启动http服务查看；

```
docker run -v $PWD/Disruptor_doc_ZH_CN/_book:/usr/share/nginx/html -d -p 8080:80 nginx
```

通过浏览器访问(http://your_ip:8080/)

### 生成PDF（暂不支持）

```
docker run -it --rm \
         -v $PWD/Disruptor_doc_ZH_CN:/srv/gitbook \
         linimbus/gitbook_tools \
         /bin/bash -c "gitbook build;gitbook pdf"
```

在当前目录下生成的book.pdf

### gitbook插件安装

```
docker run -it --rm --net=host \
         -e http_proxy=http://127.0.0.1:808 \
         -e https_proxy=http://127.0.0.1:808 \
         -v $PWD/Disruptor_doc_ZH_CN:/srv/gitbook \
         linimbus/gitbook_tools \
         /bin/bash -c "gitbook install;gitbook build;gitbook pdf"
```
