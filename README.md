# <p align="center">Talaxie open Studio (aka Talend)</p>
  
This repository aims to install **a ready to use** Talaxie client using docker compose, the idea is to leverage a Linux container using KasmVNC technology streaming the application to a web browser.
    
## 🧐 Features    
- All Talaxie version are available (DI, ESB, BD) depend on the docker compose profile you need.
- Using [*.localtest.me](https://readme.localtest.me/) avoiding to modify your host file
- You can play with a one million lines customers dataset, automaticaly generated as a postgres database view with name  ```vw_customers```

## 🛠️ Tech Stack
- [Talaxie](https://www.dataiku.com)
- [Traefik](https://doc.traefik.io/traefik)
- [Postgres](https://www.postgresql.org/)

## 🧑🏻‍💻 Usage

### Build and start
```bash
$ git clone https://github.com/jsminet/docker-kasm-talaxie.git

# Get the needed Talaxie version
$ ./app/kasm-talaxie/download.bat

# Build non official containers
$ docker compose build
```

### Starting the stack
```bash
$ docker compose --profile di up -d
$ docker compose --profile esb up -d 
$ docker compose --profile bd up -d 
```

### Stopping and clean volumes
```bash
$ docker compose --profile di down -v
$ docker compose --profile esb down -v
$ docker compose --profile bd down -v
```

## 👋 Talaxie access

Open your favorite web browser and navigate to **https://talaxie.localtest.me**

## 🛠️ Database connection
#### Postgres

Open your favorite web browser and navigate to **http://adminer.localtest.me**

|Host|User|Password|Database|
|---|---|---|---|
|postgres|postgres|secret|postgres|
        
## 🍰 Contributing    
Contributions are what make the open source community such an amazing place to be learn, inspire, and create. Any contributions you make are **greatly appreciated**.

Before contributing, please read the [code of conduct](CODE_OF_CONDUCT.md) & [contributing guidelines](CONTRIBUTING.md).
            
## 🙇 Author
#### JS
- Github: [@jsminet](https://github.com/jsminet)
        
## ➤ License
Distributed under the WTFPL License. See [WTFPL LICENSE](https://en.wikipedia.org/wiki/WTFPL) for more information.