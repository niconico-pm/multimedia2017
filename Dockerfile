FROM centos:7
MAINTAINER ishiguro <ishiguro@info.mie-u.ac.jp>

RUN yum -y update
RUN yum install -y epel-release
RUN rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm
RUN yum install -y gcc httpd httpd-devel emacs wget unzip git zlib-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel readline nkf tar
RUN yum install -y --enablerepo=remi,remi-php71 php php-devel php-mbstring php-pdo php-gd php-cli php-xml
RUN yum clean all

# mkdir
RUN mkdir /root/.emacs.d;mkdir /export
RUN rmdir /var/www/html
RUN ln -s /export /var/www/html

# conf
ADD ./conf/init.el /root/.emacs.d/init.el
ADD ./conf/.bashrc /root/.bashrc
ADD ./conf/vimrc /root/.vimrc
ADD ./conf/httpd.conf /etc/httpd/conf/httpd.conf
ADD ./conf/php.ini /etc/php.ini
ADD ./conf/run.sh /run.sh
RUN chmod -v +x /run.sh

CMD ["/sbin/init"]

