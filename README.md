# gitbook_tools

## 使用举例

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

### 生成PDF

```
docker run -it --rm \
         -v $PWD/Disruptor_doc_ZH_CN:/srv/gitbook \
         linimbus/gitbook_tools \
         /bin/bash -c "gitbook build;gitbook pdf"
```

在当前目录下生成的book.pdf
