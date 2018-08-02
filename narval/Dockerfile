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
FROM debian:sid-slim

MAINTAINER Sébastien Boyron

RUN apt-get update &&\
  apt-get -y dist-upgrade

RUN mkdir -p /narval/dict

ADD http://downloads.skullsecurity.org/passwords/rockyou.txt.bz2 /narval/dict/rockyou.txt.bz2
ADD http://downloads.skullsecurity.org/passwords/john.txt.bz2 /narval/dict/john.txt.bz2

RUN apt-get -y install \
  firefox tmux vim bzip2

