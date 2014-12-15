FROM centos:centos6

# Install basic packages
RUN yum update -y
RUN yum groupinstall -y 'Development tools'
RUN yum install -y tar openssl-devel zlib-devel readline-devel libffi-devel libyaml-devel

# Install ruby-build
RUN git clone https://github.com/sstephenson/ruby-build.git .ruby-build
RUN .ruby-build/install.sh
RUN rm -fr .ruby-build

# Install ruby-2.1.4
RUN ruby-build 2.1.4 /usr/local

# Install bundler, pry
RUN gem update --system
RUN gem install bundler pry --no-document
