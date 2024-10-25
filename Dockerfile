FROM registry.us-west-1.aliyuncs.com/modelscope-repo/modelscope:ubuntu20.04-cuda11.8.0-py38-torch2.0.1-tf2.13.0-1.9.5

WORKDIR /data/work

RUN git clone https://www.modelscope.cn/iic/nlp_gte_sentence-embedding_chinese-base.git
RUN git clone https://github.com/modelscope/modelscope-agent.git
RUN cd modelscope-agent && pip install -r requirements.txt && export PYTHONPATH=$PYTHONPATH:`pwd`

WORKDIR /data/work
# 下载模型
RUN python -c "from modelscope import snapshot_download; snapshot_download('qwen/Qwen2-7B-Instruct', cache_dir='qwen2-7b-instruct')"
EXPOSE 8000

ADD run.sh run.sh

CMD ["/bin/bash", "run.sh"]

