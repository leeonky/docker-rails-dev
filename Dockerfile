FROM leeonky/rvm:ubuntu

USER $USER_NAME

#RUN sudo rpm -ivh https://kojipkgs.fedoraproject.org//packages/http-parser/2.7.1/3.el7/x86_64/http-parser-2.7.1-3.el7.x86_64.rpm

RUN sudo apt-get install -y imagemagick libmagickwand-dev redis-server nodejs

#install ruby in china
RUN echo "ruby_url=https://cache.ruby-china.org/pub/ruby" > ~/.rvm/user/db

ADD projects /tmp/projects
ADD setup_project.sh /tmp/setup_project.sh

RUN sudo chown $USER_NAME:$USER_NAME /tmp/projects -R
RUN /bin/bash --login /tmp/setup_project.sh /tmp/projects/gene
#RUN /bin/bash --login /tmp/setup_project.sh /tmp/projects/oulu
#RUN /bin/bash --login /tmp/setup_project.sh /tmp/projects/ule-web
RUN /bin/bash --login /tmp/setup_project.sh /tmp/projects/default

CMD bash
