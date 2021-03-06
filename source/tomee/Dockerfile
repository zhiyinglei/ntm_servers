# Set the base image to Ubuntu
FROM ubuntu:14.04

MAINTAINER Zhiying

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \ 
	&& apt-get install -y \
			python-software-properties \
			software-properties-common \
			curl \
			vim \
                        wget \
 	&& add-apt-repository ppa:webupd8team/java \   
	&& echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections \  
	&& echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections \
	&& apt-get update && apt-get install -y \ 
		oracle-java8-installer \ 
		oracle-java8-set-default

ENV PATH /usr/local/tomee/bin:$PATH
RUN mkdir -p /usr/local/tomee

WORKDIR /usr/local/tomee

ENV GPG_KEYS \
	BDD0BBEB753192957EFC5F896A62FC8EF17D8FEF \
	223D3A74B068ECA354DC385CE126833F9CF64915 \
	7A2744A8A9AAF063C23EB7868EBE7DBE8D050EEF \
	82D8419BA697F0E7FB85916EE91287822FDB81B1 \
	9056B710F1E332780DE7AF34CBAEBE39A46C4CA1 \
	A57DAF81C1B69921F4BA8723A8DE0A4DB863A7C1 \
	B7574789F5018690043E6DD9C212662E12F3E1DD \
	B8B301E6105DF628076BD92C5483E55897ABD9B9 \
	DBCCD103B8B24F86FFAAB025C8BB472CD297D428 \
	F067B8140F5DD80E1D3B5D92318242FE9A0B1183 \
	FAA603D58B1BA4EDF65896D0ED340E0E6D545F97
RUN set -xe \
	&& for key in $GPG_KEYS; do \
		gpg --keyserver ha.pool.sks-keyservers.net --recv-keys "$key"; \
	done

RUN set -x \
	&& curl -fSL https://dist.apache.org/repos/dist/release/tomee/tomee-7.0.2/apache-tomee-7.0.2-webprofile.tar.gz.asc -o tomee.tar.gz.asc \
	&& curl -fSL http://apache.rediris.es/tomee/tomee-7.0.2/apache-tomee-7.0.2-webprofile.tar.gz -o tomee.tar.gz \
	&& tar -zxf tomee.tar.gz \
	&& mv apache-tomee-webprofile-7.0.2/* /usr/local/tomee \
	&& rm -Rf apache-tomee-webprofile-7.0.2 \
	&& rm bin/*.bat \
	&& rm tomee.tar.gz* \
	&& rm -rf /var/lib/apt/lists/* \
        && mkdir -p /usr/local/tomee/webapps/rr \
        && wget "https://oss.sonatype.org/content/repositories/releases/com/tascape/reactor-report/1.2.3/reactor-report-1.2.3.war" \ 
                     -O /usr/local/tomee/webapps/rr/rr.war \
        && cd /usr/local/tomee/webapps/rr && jar xvf rr.war && rm rr.war \
        && sed -i 's/127.0.0.1/mysql/g' /usr/local/tomee/webapps/rr/META-INF/context.xml 
   

EXPOSE 8080
CMD ["catalina.sh", "run"]
