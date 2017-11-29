# multimedia

## 前準備
+ ssh root@server-ip

## 設定ファイルのダウンロードとビルド
+ git clone https://github.com/niconico-pm/multimedia2017.git multi
+ cd multi
+ docker build --rm -t multi .
 + 時間かかります。最後に下記が出たら正常終了。エラーが出たら、もう時間をおいてから、もう一度やってみる。
```
Successfully built XXXXXX
Successfully tagged multi:latest
dockerXX:~#
```

+ sudo mkdir /root/export
+ docker run -d --name multi01 -p 80:80 -v /root/export:/export -e "TZ=Asia/Tokyo" multi /run.sh
（`-p`と`-v`は環境にあわせて適宜 良い感じにしてください）


## 確認
+ docker exec -it multi01 /bin/bash
+ ps -ef
~~~
UID        PID  PPID  C STIME TTY          TIME CMD
root         1     0  0 07:07 ?        00:00:00 /bin/sh /usr/sbin/apachectl -DFOREGROUND
root         8     1  0 07:07 ?        00:00:00 /usr/sbin/httpd -DFOREGROUND
apache       9     8  0 07:07 ?        00:00:00 /usr/sbin/httpd -DFOREGROUND
apache      10     8  0 07:07 ?        00:00:00 /usr/sbin/httpd -DFOREGROUND
apache      11     8  0 07:07 ?        00:00:00 /usr/sbin/httpd -DFOREGROUND
apache      12     8  0 07:07 ?        00:00:00 /usr/sbin/httpd -DFOREGROUND
apache      13     8  0 07:07 ?        00:00:00 /usr/sbin/httpd -DFOREGROUND
root        20     0  0 07:08 ?        00:00:00 /bin/bash
root        31    20  0 07:08 ?        00:00:00 ps -ef
~~~

+ ブラウザで http://server-ip/ (it works!)

