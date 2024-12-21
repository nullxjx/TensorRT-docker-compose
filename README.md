# TensorRT-docker-compose
docker-compose for [TensorRT](https://github.com/NVIDIA/TensorRT), support [sticky-sessions]( https://doc.traefik.io/traefik/routing/services/#sticky-sessions) using traefik to enable the [prefix-caching](https://docs.vllm.ai/en/v0.5.5/automatic_prefix_caching/apc.html) feature of TensorRT


## File Structure
### host path
```bash
/host_path/models
                └── 1-gpu
                    ├── model_repository
                    │   ├── ensemble
                    │   │   └── 1
                    │   ├── postprocessing
                    │   │   └── 1
                    │   ├── preprocessing
                    │   │   └── 1
                    │   ├── tensorrt_llm
                    │   │   └── 1
                    │   └── tensorrt_llm_bls
                    │       └── 1
                    │           └── lib
                    └── weights
                        └── tokenizer

```

## Usage
start services
```bash
docker-compose up -d
``` 

stop services
```bash
docker-compose down
```

test sticky-sessions
```bash
bash request.sh
```

You can observe that if you do not delete the cookie, your request will be load balanced to the same TensorRT instance every time.
If you delete the cookies, or if you don't use cookies, then load balancing between different instances will work normally.

