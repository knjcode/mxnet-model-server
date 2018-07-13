FROM awsdeeplearningteam/mms_cpu

RUN apt-get update && apt-get install -y git \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/knjcode/mxnet-model-server -b token_auth_test \
  && cd mxnet-model-server \
  && pip install .

CMD ["mxnet-model-server", "start", "--mms-config", "/model/mms_app_cpu.conf"]
