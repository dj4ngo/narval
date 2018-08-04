#    :                                                         
#      7?               NARVAL PROJECT                    
#         =O?=                                                 
#             ~7=          88888,                              
#                =OZ?=   DDD8Z$7ZOOZ                           
#                    :O?8O8D8ZZI+==IZ8OZ                       
#                      =IZZ$Z7$ZOZZ7I=IZO8Z$                   
#                       O7=ZIZIZZZZO7ZI=IIZOOZO                
#                         ZI7I==?IIIZ7Z777+?$OOO7              
#                           Z$I+?=:=?II$77$ZII7Z$OZ            
#                            ?$Z77I===??II7$$III=I$O           
#                              7$$I+=====++++$I?+II$OZ         
#                               OI+=I+=:~====+I+7+7+?Z8        
#                                O$==7=::~=====+IIIII$ZO       
#                                 ?7=?ZO7+====+??+7IIIZO       
#                                 =I78Z  II$7I=??I77?I$ZO      
#                                 $ZZ8$     +7$$II7I7$7$8      
#                                 :88I         $Z7I7I77Z8      
#                                                IZ77$$ZO      
#                                                 7Z$$$$I      
#                                                  Z7$ZO       
#                                                  OZZZ7       
#                                                  Z$$8        
#                                                 :ZZ8         
#                                             88OOO8O          
#                                              8DD88Z          
#                                                 $8O8         
#                                                   Z8Z        
FROM debian:stable-slim

MAINTAINER Sébastien Boyron

RUN  \
  debian_server="$(awk 'NR==1 {print $2}' /etc/apt/sources.list)" &&\
  debian_version="$(awk 'NR==1 {print $3}' /etc/apt/sources.list)" &&\
  echo "deb ${debian_server} ${debian_version} contrib non-free" > /etc/apt/sources.list.d/non-free.list &&\
  echo "deb-src ${debian_server} ${debian_version} contrib non-free" >> /etc/apt/sources.list.d/non-free.list &&\
  echo "deb ${debian_server} stretch-backports main contrib non-free" > /etc/apt/sources.list.d/stretch-backports.list &&\
  echo "deb-src ${debian_server} stretch-backports main contrib non-free" >> /etc/apt/sources.list.d/stretch-backports.list &&\
  apt-get update &&\
  apt-get -y dist-upgrade &&\
  apt-get -y install tmux vim bzip2 netcat git python python3 openvpn net-tools wget curl man-db manpages &&\
  apt-get -y autoremove &&\
  apt-get -y clean &&\
  rm -rf /var/cache/apt /var/lib/apt/lists


# Add dicts
RUN mkdir -p /narval/dict  &&\
  cd /narval/dict &&\
  wget http://downloads.skullsecurity.org/passwords/rockyou.txt.bz2 &&\
  wget http://downloads.skullsecurity.org/passwords/john.txt.bz2

# Add sqlmap
RUN mkdir -p /narval/tools &&\
  cd /narval/tools &&\
  git clone https://github.com/sqlmapproject/sqlmap.git sqlmap &&\
  ln -s /narval/tools/sqlmap/sqlmap.py /usr/local/bin/sqlmap

# Add burp
RUN mkdir -p /narval/tools/burp &&\
  cd /narval/tools/burp &&\
  curl -JLO https://portswigger.net/burp/releases/download

# Add java for burp
RUN mkdir -p /usr/share/man/man1 &&\
  apt-get update &&\
  apt-get install -y default-jre &&\
  apt-get -y autoremove &&\
  apt-get -y clean &&\
  rm -rf /var/cache/apt /var/lib/apt/lists

# Add nikto
RUN apt-get update &&\
  apt-get -y install nikto &&\
  apt-get -y autoremove &&\
  apt-get -y clean &&\
  rm -rf /var/cache/apt /var/lib/apt/lists

# Add firefox
RUN apt-get update &&\
  apt-get -y install firefox-esr &&\
  apt-get -y autoremove &&\
  apt-get -y clean &&\
  rm -rf /var/cache/apt /var/lib/apt/lists
