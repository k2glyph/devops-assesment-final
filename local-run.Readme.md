## Running the Application locally

- Clone the repository:
```
git clone https://github.com/k2glyph/devops-assesment-final.git
cd devops-assesment-final
```
- Start the application:
```
 $ docker-compose up -d
Creating network "devops-assesment_default" with the default driver
Creating postgres_db ... done
Creating golang_app  ... done
```
- Verify running containers:
```
 $ docker ps
CONTAINER ID   IMAGE                  COMMAND                  CREATED          STATUS                    PORTS                    NAMES
a283a18b227e   devops-assesment_app   "sh -c ./transaction…"   47 seconds ago   Up 43 seconds             0.0.0.0:8080->8080/tcp   golang_app
eb1520e1ae3f   postgres:12            "docker-entrypoint.s…"   48 seconds ago   Up 47 seconds (healthy)   0.0.0.0:5432->5432/tcp   postgres_db
```
- Access the application:
```
$ curl http://localhost:8080/health
{"status":"healthy"}

```