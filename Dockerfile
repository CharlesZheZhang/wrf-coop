#
FROM davegill/wrf-coop:eighthtry
MAINTAINER Dave Gill <gill@ucar.edu>

#RUN echo _HERE1_
#RUN git clone https://github.com/davegill/WRF.git davegill/WRF \
#  && cd davegill/WRF \
#  && git fetch origin +refs/pull/4/merge: \
#  && git checkout -qf FETCH_HEAD \
#  && cd .. \
#  && mv WRF /wrf/WRF
#RUN echo _HERE2_

RUN git clone _FORK_/_REPO_.git WRF \
  && cd WRF \
  && git checkout _BRANCH_ \
  && cd ..

RUN git clone https://github.com/davegill/SCRIPTS.git SCRIPTS \
  && cp SCRIPTS/rd_l2_norm.py . && chmod 755 rd_l2_norm.py \
  && cp SCRIPTS/script.csh .    && chmod 755 script.csh    \
  && ln -sf SCRIPTS/Namelists . 

RUN curl -SL https://www2.mmm.ucar.edu/wrf/dave/sbm.tar.gz | tar -xzC /wrf

#ADD nml.tar /wrf

VOLUME /wrf
CMD ["/bin/tcsh"]
