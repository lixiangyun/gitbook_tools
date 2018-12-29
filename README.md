# gitbook_tools

## 使用举例

**生成PDF**

```
git clone https://github.com/lixiangyun/Disruptor_doc_ZH_CN.git
```

```
docker run --net=host -it --rm \
         -e http_proxy=http://127.0.0.1:3128 \
		 -e https_proxy=http://127.0.0.1:3128 \
		 -v $PWD/Disruptor_doc_ZH_CN:/srv/gitbook \
		 linimbus/gitbook_tools \
		 /bin/bash -c \
		 "gitbook install .;gitbook build .;gitbook pdf ."
```

