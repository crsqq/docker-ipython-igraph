```
# add proxy if needed:
PROXY="YOUR_PROXY_ADDRESS" ./add_proxy.sh

./build.sh
docker run -d -p 8888:8888 --name notebook -v /<PATH_TO_HOSTDIR>:/notebooks ip_notebook_stack
```
