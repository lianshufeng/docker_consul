# install docker (china): 
````command
docker-compose up -d
````
- docker-compose.yml 
````shell
version: "3"

services:

  consul_node0:
    image: lianshufeng/consul
    ports:
      - "8500:8500"
    container_name: consul_node0
    volumes:
      - "./data/node0:/data"
    restart: always
    command: "consul agent -server -ui -bootstrap-expect=3 -node=consul_node0 -data-dir /data -client 0.0.0.0 -datacenter=dc1"

  consul_node1:
    image: lianshufeng/consul
    ports:
      - "8501:8500"
    container_name: consul_node1
    volumes:
      - "./data/node1:/data"
    restart: always
    command: "consul agent -server -ui -bootstrap-expect=3 -node=consul_node1 -data-dir /data -client 0.0.0.0 -datacenter=dc1 -join consul_node0"
    depends_on:
      - consul_node0

  consul_node2:
    image: lianshufeng/consul
    ports:
      - "8502:8500"
    container_name: consul_node2
    volumes:
      - "./data/node2:/data"
    restart: always
    command: "consul agent -server -ui -bootstrap-expect=3 -node=consul_node2 -data-dir /data -client 0.0.0.0 -datacenter=dc1 -join consul_node0"
    depends_on:
      - consul_node0


````